# Applications

Deployable/runtime boundaries live here.

- `api`: HTTP/API entry point. NestJS implementation is intentionally deferred to the next phase.
- `worker`: background and workflow execution boundary.
- `mcp-server`: MCP tool surface for AI/agent integrations.

Application projects may depend on packages. Packages must never depend on applications.
