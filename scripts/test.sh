#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

node -e "JSON.parse(require('node:fs').readFileSync('package.json', 'utf8'))"
node -e "JSON.parse(require('node:fs').readFileSync('nx.json', 'utf8'))"
bash -n scripts/*.sh
sh -n .docker/entrypoint.sh

EXPECTED_PROJECTS=(api worker mcp-server core database config contracts connectors)
PROJECTS="$(pnpm exec nx show projects)"
for project in "${EXPECTED_PROJECTS[@]}"; do
  if ! grep -Fxq "$project" <<<"$PROJECTS"; then
    echo "Nx project '$project' was not discovered." >&2
    exit 1
  fi
done

if command -v docker >/dev/null 2>&1 && docker compose version >/dev/null 2>&1; then
  docker compose \
    --env-file config/env/.env.test.example \
    -f infra/docker/docker-compose.yml \
    config --quiet
else
  echo "Docker Compose not found; compose validation skipped."
fi

echo "Foundation tests passed."
