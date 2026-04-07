from __future__ import annotations

import re
import subprocess
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[2]
GITHUB_BADGE = "[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)"
ORG_LINK = "[Cloud2BR OSS - Learning Hub](https://github.com/Cloud2BR-MSFTLearningHub)"
DATE_RE = re.compile(r"Last updated: \d{4}-\d{2}-\d{2}")
SEPARATOR_RE = re.compile(r"-{10,}")


def tracked_markdown_files() -> list[Path]:
    result = subprocess.run(
        ["git", "ls-files", "*.md"],
        cwd=REPO_ROOT,
        check=True,
        capture_output=True,
        text=True,
    )
    return [REPO_ROOT / line for line in result.stdout.splitlines() if line]


def validate_file(path: Path) -> list[str]:
    lines = path.read_text(encoding="utf-8").splitlines()
    errors: list[str] = []

    if not lines or not lines[0].startswith("# "):
        return ["first line must be a markdown title starting with '# '"]

    if len(lines) < 8:
        return ["file is too short to contain the required header block"]

    if lines[1] != "":
        errors.append("line 2 must be blank")

    location_index = 2
    while location_index < len(lines) and lines[location_index].strip():
        location_index += 1

    if location_index == 2:
        errors.append("location line is missing")
        return errors

    if location_index >= len(lines) or lines[location_index] != "":
        errors.append("blank line required after location block")
        return errors

    header_start = location_index + 1
    expected = [GITHUB_BADGE, ORG_LINK, "", None, "", None]
    for offset, expected_line in enumerate(expected):
        line_index = header_start + offset
        if line_index >= len(lines):
            errors.append("header block is incomplete")
            return errors
        actual = lines[line_index]
        if offset == 3:
            if not DATE_RE.fullmatch(actual):
                errors.append("Last updated line must use YYYY-MM-DD format")
        elif offset == 5:
            if not SEPARATOR_RE.fullmatch(actual):
                errors.append("separator line must contain at least 10 hyphens")
        elif actual != expected_line:
            errors.append(f"expected '{expected_line}' at line {line_index + 1}")

    return errors


def main() -> int:
    failures = []
    for path in tracked_markdown_files():
        errors = validate_file(path)
        if errors:
            failures.append((path.relative_to(REPO_ROOT), errors))

    if failures:
        for path, errors in failures:
            print(f"{path}:")
            for error in errors:
                print(f"  - {error}")
        return 1

    print("All tracked Markdown files passed header validation.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
