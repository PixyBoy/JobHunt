#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

command -v node >/dev/null 2>&1 || { echo "Node.js is required." >&2; exit 1; }
command -v pnpm >/dev/null 2>&1 || { echo "pnpm is required." >&2; exit 1; }

NODE_MAJOR="$(node -p "process.versions.node.split('.')[0]")"
PNPM_MAJOR="$(pnpm --version | cut -d. -f1)"

[[ "$NODE_MAJOR" == "24" ]] || { echo "Node.js 24.x is required (found $(node --version))." >&2; exit 1; }
[[ "$PNPM_MAJOR" == "11" ]] || { echo "pnpm 11.x is required (found $(pnpm --version))." >&2; exit 1; }

if [[ ! -f .env ]]; then
  cp config/env/.env.development.example .env
  echo "Created .env from config/env/.env.development.example"
fi

pnpm install --frozen-lockfile

if command -v docker >/dev/null 2>&1 && docker compose version >/dev/null 2>&1; then
  pnpm infra:validate
else
  echo "Docker Compose not found; infrastructure validation skipped."
fi

echo "Bootstrap complete."
