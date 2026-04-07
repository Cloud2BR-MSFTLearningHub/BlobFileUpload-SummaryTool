from __future__ import annotations

import os
import re
import subprocess
from datetime import datetime, timezone
from pathlib import Path

DATE_PATTERN = re.compile(r"^Last updated: \d{4}-\d{2}-\d{2}$", re.MULTILINE)
CURRENT_DATE = datetime.now(timezone.utc).strftime("%Y-%m-%d")
REPO_ROOT = Path(__file__).resolve().parents[2]


def run_git(*args: str) -> str:
    result = subprocess.run(
        ["git", *args],
        cwd=REPO_ROOT,
        check=True,
        capture_output=True,
        text=True,
    )
    return result.stdout.strip()


def changed_markdown_files() -> list[Path]:
    base_ref = os.environ.get("PR_BASE_REF", "main")
    diff_output = run_git("diff", "--name-only", f"origin/{base_ref}...HEAD", "--", "*.md")
    files = []
    for relative_path in diff_output.splitlines():
        path = REPO_ROOT / relative_path
        if path.is_file():
            files.append(path)
    return files


def update_file(path: Path) -> bool:
    content = path.read_text(encoding="utf-8")
    updated_content, count = DATE_PATTERN.subn(f"Last updated: {CURRENT_DATE}", content, count=1)
    if count == 0 or updated_content == content:
        return False
    path.write_text(updated_content, encoding="utf-8")
    return True


def main() -> int:
    files = changed_markdown_files()
    if not files:
        print("No changed Markdown files detected.")
        return 0

    updated_any = False
    for path in files:
        if update_file(path):
            print(f"Updated {path.relative_to(REPO_ROOT)}")
            updated_any = True

    if not updated_any:
        print("No Last updated lines needed changes.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
