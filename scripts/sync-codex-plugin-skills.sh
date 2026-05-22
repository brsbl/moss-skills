#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source_root="${repo_root}/skills"
target_root="${repo_root}/plugins/moss-notes/skills"

skills=(
  "moss-notes"
  "moss-frontmatter"
  "moss-comments"
  "moss-wiki-links"
  "moss-mockup"
)

rm -rf "${target_root}"
mkdir -p "${target_root}"

for skill in "${skills[@]}"; do
  rm -rf "${target_root}/${skill}"
  cp -R "${source_root}/${skill}" "${target_root}/${skill}"
done
