# Architecture

## Foundation principles

JobHunt is designed as a connector-driven automation platform. External systems such as Jobinja, JobVision, Telegram, and future sources must be integrated behind explicit connector interfaces so the core domain never depends on platform-specific APIs, DOM selectors, or authentication details.

High-level flow:

`Source -> Connector -> Normalize -> Deduplicate -> Score -> Decide -> Apply -> Verify -> Track`

Infrastructure concerns are kept outside application/domain code. PostgreSQL is the durable system of record and Redis is reserved for ephemeral coordination such as caching, locks, and queues.

## Phase boundaries

This repository currently contains the project foundation only. NestJS application structure, workflow orchestration, browser automation, and connector implementations are intentionally added in later phases so infrastructure decisions remain testable and reversible.

## Rules

- External platform behavior belongs in connectors/adapters.
- Core workflows depend on interfaces, not platform implementations.
- Automated application actions must be observable, idempotent where possible, and verifiable.
- Secrets never belong in source control.
- Prefer one deployable application until scale or isolation requirements justify additional services.
