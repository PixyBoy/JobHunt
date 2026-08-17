# JobHunt

Automation-first platform for discovering, evaluating, and tracking job opportunities across multiple sources, with a path toward controlled application autopilot.

## Current phase

**Phase 0: project foundation.** The repository currently defines CI/CD, security checks, local infrastructure, environment conventions, scripts, and architecture rules. NestJS application code is intentionally not bootstrapped yet.

## Local setup

Prerequisites: Node.js 24.x, pnpm 11.x, Docker Compose v2.

```bash
pnpm bootstrap
pnpm dev
```

Useful commands:

```bash
pnpm infra:validate
pnpm test
pnpm ci
pnpm infra:down
```

## Infrastructure

Local development currently provides PostgreSQL and Redis through `infra/docker/docker-compose.yml`. Additional infrastructure is introduced only when an implemented feature requires it.

## Documentation

- `docs/architecture.md`
- `docs/development.md`
- `docs/deployment.md`
- `docs/decisions/`

## License

Copyright reserved. No license is granted for use, modification, or distribution unless explicitly provided by the repository owner.
