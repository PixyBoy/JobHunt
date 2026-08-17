# Repository Rules

Protect the `main` branch with a GitHub branch ruleset.

## Required settings

Target branch: `main`

Enable:

- Require a pull request before merging.
- Require status checks to pass before merging.
- Require branches to be up to date before merging.
- Block force pushes.
- Block branch deletion.

Required status check after this PR is merged: `Foundation checks`.

For the current single-maintainer phase, do not require an approving review. Add required reviews when another human maintainer joins the project.

Administrators may bypass only for repository recovery; normal changes still go through pull requests.
