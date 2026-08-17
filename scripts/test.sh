#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

node -e "JSON.parse(require('node:fs').readFileSync('package.json', 'utf8'))"
bash -n scripts/*.sh
sh -n .docker/entrypoint.sh

if command -v docker >/dev/null 2>&1 && docker compose version >/dev/null 2>&1; then
  docker compose \
    --env-file config/env/.env.test.example \
    -f infra/docker/docker-compose.yml \
    config --quiet
else
  echo "Docker Compose not found; compose validation skipped."
fi

echo "Foundation tests passed."
