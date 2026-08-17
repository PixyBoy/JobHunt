# Deployment

No production runtime target is selected yet. This is intentional: the application boundary must exist before choosing deployment topology.

Current deployment contract:

- production configuration is provided through environment variables;
- secrets are injected at runtime and never committed;
- local PostgreSQL and Redis are provided through Docker Compose for development only;
- releases are created from existing semantic-version tags (`vX.Y.Z`);
- the production Docker image contract becomes active after the NestJS build output is defined.

When a hosting target is selected, deployment-specific files should be added under `infra/` without leaking provider concerns into application code.
