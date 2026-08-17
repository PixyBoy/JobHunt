# Repository Rules

## Main branch

Protect `main` with a GitHub branch ruleset.

Enable:

- Require a pull request before merging.
- Require status checks to pass before merging.
- Require branches to be up to date before merging.
- Block force pushes.
- Block branch deletion.

Required checks:

- `Foundation checks`
- `Package audit`

For the current single-maintainer phase, do not require an approving review. Add required reviews when another human maintainer joins the project.

Administrators may bypass only for repository recovery; normal changes still go through pull requests.

## Dependency graph

GitHub Dependency Review requires the repository Dependency Graph to be enabled. The current security gate uses `pnpm audit` until that repository-level setting is enabled.

When enabling the next security-hardening step:

1. Open repository Settings.
2. Open Code security / Security & analysis.
3. Enable Dependency Graph.
4. Reintroduce `actions/dependency-review-action` on pull requests.

This is repository configuration, not application code, and should remain outside the runtime architecture.
