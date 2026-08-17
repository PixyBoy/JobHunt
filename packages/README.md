# Packages

Reusable boundaries live here.

- `core`: platform-agnostic domain and application concepts.
- `database`: persistence adapters and database integration.
- `config`: validated runtime configuration.
- `contracts`: shared schemas, DTO contracts, and integration contracts.
- `connectors`: source/application connector abstractions and implementations.

Keep dependencies directional: infrastructure/integration packages may depend on `core` and `contracts`; `core` must not depend on platform-specific packages.
