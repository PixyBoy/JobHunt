#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if [[ ! -f .env ]]; then
  cp config/env/.env.development.example .env
fi

command -v docker >/dev/null 2>&1 || { echo "Docker is required." >&2; exit 1; }
docker compose version >/dev/null 2>&1 || { echo "Docker Compose v2 is required." >&2; exit 1; }

pnpm infra:up
docker compose --env-file .env -f infra/docker/docker-compose.yml ps

echo "Local infrastructure is ready. NestJS application bootstrap is the next phase."
