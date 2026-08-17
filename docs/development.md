# Development

## Prerequisites

- Node.js 24.x LTS
- pnpm 11.x
- Docker with Compose v2
- Git

## First setup

```bash
pnpm bootstrap
pnpm dev
```

`pnpm dev` starts the local infrastructure only. The NestJS application will be added in the next project phase.

## Validation

```bash
pnpm test
pnpm ci
pnpm infra:validate
```

## Git workflow

Create focused branches and small pull requests. Use conventional prefixes such as `feat/`, `fix/`, `chore/`, and `docs/`. CI must pass before merge.
