# Development

## Prerequisites

- Node.js 24.x LTS
- pnpm 11.x
- Docker with Compose v2
- Git

## First setup

```bash
pnpm bootstrap
pnpm infra:up
pnpm ci
```

`pnpm bootstrap` validates the required toolchain, creates `.env` from the development example when needed, installs locked dependencies, and validates Docker Compose.

`pnpm infra:up` starts PostgreSQL and Redis and waits for their health checks to pass.

## Daily development

```bash
pnpm infra:up
pnpm nx:projects
pnpm dev
```

There is no NestJS runtime yet; `pnpm dev` currently manages local infrastructure only.

## Nx workspace

```bash
pnpm nx:projects
pnpm nx:graph
pnpm nx:affected
```

Registered projects:

- Applications: `api`, `worker`, `mcp-server`
- Packages: `core`, `database`, `config`, `contracts`, `connectors`

The projects define architecture boundaries only. Source code and framework-specific targets are introduced in later phases.

## Validation

Run the same foundation gate used by CI:

```bash
pnpm ci
```

Infrastructure-only checks:

```bash
pnpm infra:validate
pnpm infra:up
pnpm infra:logs
pnpm infra:down
```

## Git workflow

Create focused branches and small pull requests. Do not push implementation work directly to `main`. CI must pass before merge. See `docs/repository-rules.md` for the required GitHub ruleset.
