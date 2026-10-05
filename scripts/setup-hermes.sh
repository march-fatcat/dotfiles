#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "$0")/.." && pwd)"
hermes_home="${HERMES_HOME:-$HOME/.hermes}"
workspace="$hermes_home/workspace"
mkdir -p "$workspace"

for file in AGENTS.md IDENTITY.md USER.md TOOLS.md; do
  if [[ -e "$workspace/$file" && ! -L "$workspace/$file" ]]; then
    echo "refusing to overwrite existing $workspace/$file" >&2
    exit 1
  fi
  cp "$repo_dir/$file" "$workspace/$file"
done

if [[ ! -e "$hermes_home/config.yaml" ]]; then
  cp "$repo_dir/config/hermes-config.yaml" "$hermes_home/config.yaml"
else
  echo "keeping existing $hermes_home/config.yaml"
fi

if [[ ! -e "$hermes_home/.env" ]]; then
  cp "$repo_dir/.env.example" "$hermes_home/.env"
  chmod 600 "$hermes_home/.env"
  echo "created $hermes_home/.env; fill in provider and bot credentials"
else
  echo "keeping existing $hermes_home/.env"
fi

echo "Hermes workspace prepared at $workspace"
