#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source_root="${repo_root}/skills"
target_root="${repo_root}/plugins/moss-skills/skills"

rm -rf "${target_root}"
mkdir -p "${target_root}"

while IFS= read -r skill_dir; do
  skill="$(basename "${skill_dir}")"
  cp -R "${skill_dir}" "${target_root}/${skill}"
done < <(find "${source_root}" -mindepth 1 -maxdepth 1 -type d -name 'moss-*' -print | LC_ALL=C sort)
