# Architecture

## Foundation principles

JobHunt is a connector-driven automation platform. External systems such as Jobinja, JobVision, Telegram, E-Estekhdam, and future sources are integrated behind explicit connector interfaces so core logic never depends on platform-specific APIs, DOM selectors, or authentication details.

High-level flow:

`Source -> Connector -> Normalize -> Deduplicate -> Score -> Decide -> Apply -> Verify -> Track`

PostgreSQL is the durable system of record. Redis is reserved for ephemeral coordination such as caching, locks, and queues.

## Workspace boundaries

```text
apps/
  api/          # HTTP/API runtime
  worker/       # background/workflow runtime
  mcp-server/   # MCP/agent tool runtime

packages/
  core/         # platform-agnostic domain/application concepts
  database/     # persistence adapters
  config/       # validated runtime configuration
  contracts/    # shared schemas and integration contracts
  connectors/   # external platform adapters/connectors
```

The directories are registered as Nx projects before application code is introduced. NestJS is intentionally deferred to the next phase.

## Dependency direction

- Applications may depend on packages; packages never depend on applications.
- `core` stays platform-agnostic and does not depend on `database` or `connectors`.
- `database` and `connectors` may implement interfaces owned by `core`.
- Cross-runtime communication uses explicit contracts from `contracts` rather than importing application internals.
- External platform behavior belongs in connectors/adapters.
- Automated application actions must be observable, idempotent where possible, and verifiable.
- Secrets never belong in source control.

## Scaling rule

Start with the minimum number of deployable runtimes above. Split services only when isolation, independent scaling, reliability, or ownership requirements provide a measurable reason.
