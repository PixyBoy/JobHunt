# Configuration

Configuration is environment-driven. Committed files under `config/env/` are examples only and must never contain real credentials.

For local development, `scripts/bootstrap.sh` copies `.env.development.example` to the repository-root `.env` when `.env` does not exist.

Production secrets must be injected by the deployment platform or secret manager. They must not be committed, baked into images, or stored in example files.
