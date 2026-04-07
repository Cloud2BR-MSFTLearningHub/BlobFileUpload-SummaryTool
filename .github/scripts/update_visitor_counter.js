const fs = require('fs');
const path = require('path');
const https = require('https');

const repoRoot = path.resolve(__dirname, '..', '..');
const metricsPath = path.join(repoRoot, 'metrics.json');
const refreshDate = new Date().toISOString().slice(0, 10);
const repo = process.env.REPO;
const token = process.env.TRAFFIC_TOKEN;
const markerPattern = /<!-- START BADGE -->[\s\S]*?<!-- END BADGE -->/g;

function readMetrics() {
  if (!fs.existsSync(metricsPath)) {
    return { totalViews: 0, refreshDate };
  }

  try {
    return JSON.parse(fs.readFileSync(metricsPath, 'utf8'));
  } catch {
    return { totalViews: 0, refreshDate };
  }
}

function writeMetrics(metrics) {
  fs.writeFileSync(metricsPath, `${JSON.stringify(metrics, null, 2)}\n`, 'utf8');
}

function fetchTrafficViews() {
  if (!repo || !token) {
    return Promise.resolve(null);
  }

  return new Promise((resolve) => {
    const request = https.request(
      {
        hostname: 'api.github.com',
        path: `/repos/${repo}/traffic/views`,
        method: 'GET',
        headers: {
          'User-Agent': 'Cloud2BR-visitor-counter',
          Accept: 'application/vnd.github+json',
          Authorization: `Bearer ${token}`,
        },
      },
      (response) => {
        let data = '';
        response.on('data', (chunk) => {
          data += chunk;
        });
        response.on('end', () => {
          if (response.statusCode !== 200) {
            console.warn(`GitHub traffic API returned ${response.statusCode}.`);
            resolve(null);
            return;
          }

          try {
            const parsed = JSON.parse(data);
            resolve(typeof parsed.count === 'number' ? parsed.count : null);
          } catch {
            resolve(null);
          }
        });
      }
    );

    request.on('error', () => resolve(null));
    request.end();
  });
}

function findMarkdownFiles(startDir) {
  const results = [];
  for (const entry of fs.readdirSync(startDir, { withFileTypes: true })) {
    if (entry.name === '.git' || entry.name === 'node_modules') {
      continue;
    }

    const fullPath = path.join(startDir, entry.name);
    if (entry.isDirectory()) {
      results.push(...findMarkdownFiles(fullPath));
      continue;
    }

    if (entry.isFile() && entry.name.endsWith('.md')) {
      results.push(fullPath);
    }
  }
  return results;
}

function buildBadgeBlock(totalViews) {
  return [
    '<!-- START BADGE -->',
    '<div align="center">',
    `  <img src="https://img.shields.io/badge/Total%20views-${totalViews}-limegreen" alt="Total views">`,
    `  <p>Refresh Date: ${refreshDate}</p>`,
    '</div>',
    '<!-- END BADGE -->',
  ].join('\n');
}

function updateMarkdownBadges(totalViews) {
  const replacement = buildBadgeBlock(totalViews);
  for (const filePath of findMarkdownFiles(repoRoot)) {
    const content = fs.readFileSync(filePath, 'utf8');
    if (!markerPattern.test(content)) {
      markerPattern.lastIndex = 0;
      continue;
    }

    markerPattern.lastIndex = 0;
    const updated = content.replace(markerPattern, replacement);
    fs.writeFileSync(filePath, updated, 'utf8');
  }
}

async function main() {
  const currentMetrics = readMetrics();
  const fetchedViews = await fetchTrafficViews();
  const totalViews = fetchedViews ?? currentMetrics.totalViews ?? 0;
  const nextMetrics = { totalViews, refreshDate };

  writeMetrics(nextMetrics);
  updateMarkdownBadges(totalViews);
  console.log(`Visitor badge refreshed with ${totalViews} total views.`);
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
