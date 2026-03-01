#!/usr/bin/env python3
# /// script
# dependencies = ["pyyaml"]
# ///
"""
migrate_filetype_to_tags.py

Converts `filetype: <value>` frontmatter to a tag in the `tags` list,
then removes the `filetype` key.

Usage:
    python3 migrate_filetype_to_tags.py           # live run
    python3 migrate_filetype_to_tags.py --dry-run  # preview only
"""

import sys
import yaml
import pathlib

VAULT_PATH = pathlib.Path("/Users/mtm/Documents/Obsidian Vault")
DRY_RUN = "--dry-run" in sys.argv


def split_frontmatter(text):
    """Split file into (frontmatter_str, body_str). Returns (None, text) if none found."""
    if not text.startswith("---"):
        return None, text
    lines = text.split("\n")
    for i, line in enumerate(lines[1:], 1):
        if line.strip() == "---":
            fm = "\n".join(lines[1:i])
            body = "\n".join(lines[i + 1:])
            return fm, body
    return None, text


def process_file(filepath):
    text = filepath.read_text(encoding="utf-8")

    fm_str, body = split_frontmatter(text)
    if fm_str is None:
        return False

    try:
        fm = yaml.safe_load(fm_str)
    except yaml.YAMLError as e:
        print(f"  YAML error: {filepath.name}: {e}")
        return False

    if not isinstance(fm, dict) or "filetype" not in fm:
        return False

    filetype_value = fm.pop("filetype")
    if not filetype_value:
        return False

    existing_tags = fm.get("tags", [])
    if isinstance(existing_tags, str):
        existing_tags = [existing_tags]
    elif existing_tags is None:
        existing_tags = []

    if filetype_value not in existing_tags:
        existing_tags = [filetype_value] + list(existing_tags)

    fm["tags"] = existing_tags

    new_fm = yaml.dump(fm, allow_unicode=True, default_flow_style=False, sort_keys=False)
    new_text = f"---\n{new_fm}---\n{body}"

    if not DRY_RUN:
        filepath.write_text(new_text, encoding="utf-8")

    return True


def main():
    processed = 0
    skipped = 0
    errors = 0

    for md_file in sorted(VAULT_PATH.rglob("*.md")):
        try:
            if process_file(md_file):
                processed += 1
                if DRY_RUN:
                    print(f"  would update: {md_file.name}")
            else:
                skipped += 1
        except Exception as e:
            print(f"  error: {md_file.name}: {e}")
            errors += 1

    mode = "DRY RUN" if DRY_RUN else "DONE"
    print(f"\n{mode} — updated: {processed}, skipped: {skipped}, errors: {errors}")


if __name__ == "__main__":
    main()
