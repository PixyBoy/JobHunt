# JobHunt

Automation-first platform for discovering, evaluating, and tracking job opportunities across multiple sources, with a path toward controlled application autopilot.

## Current phase

**Phase 0.5: pre-application foundation.** CI/CD, security checks, local infrastructure, Nx workspace boundaries, environment conventions, and architecture rules are defined. NestJS application code is intentionally not bootstrapped yet.

## Local setup

Prerequisites: Node.js 24.x, pnpm 11.x, Docker Compose v2.

```bash
pnpm bootstrap
pnpm infra:up
pnpm ci
```

Useful commands:

```bash
pnpm nx:projects
pnpm nx:graph
pnpm infra:logs
pnpm infra:down
```

## Workspace

```text
apps/       api, worker, mcp-server
packages/   core, database, config, contracts, connectors
```

These are architecture boundaries only; framework-specific source code is added in the next phase.

## Infrastructure

Local development currently provides PostgreSQL and Redis through `infra/docker/docker-compose.yml`. Additional infrastructure is introduced only when an implemented feature requires it.

## Documentation

- `docs/architecture.md`
- `docs/development.md`
- `docs/deployment.md`
- `docs/repository-rules.md`
- `docs/decisions/`

## License

Copyright reserved. No license is granted for use, modification, or distribution unless explicitly provided by the repository owner.
