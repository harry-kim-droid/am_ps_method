# Customer Onboarding Checklist

## Before Setup

- Confirm the customer uses GitHub pull requests.
- Confirm which repositories are in scope.
- Confirm who receives reports.
- Confirm whether Codex can post directly to PRs or should produce drafts only.
- Confirm whether the pilot is read-only review or includes patch proposals.
- Confirm any files or directories that must be ignored.
- Confirm sensitive areas that require extra caution.

## Access

- Create a dedicated GitHub account or app access where possible.
- Grant least-privilege repository access.
- Store API keys and tokens in GitHub Secrets.
- Do not ask for production credentials.
- Do not include customer secrets in Codex prompts.

## Repository Setup

- Install the workflow and prompt files using `docs/install-guide.md`.
- Add the PR review workflow from `.github/workflows/codex-pr-review.yml`.
- Add customer-specific review criteria to the workflow prompt.
- Run the workflow on a test PR.
- Verify that Codex output is useful and not too verbose.
- Decide whether comments are posted automatically or manually.

## Review Calibration

Ask the customer to rank review priorities:

- Bug risk
- Security risk
- Test coverage
- Maintainability
- Performance
- UX regressions
- Documentation

Tune prompts based on the top 3 priorities.

## Weekly Report Setup

- Choose report day and time.
- Choose target branch.
- Choose lookback window, usually 7 days.
- Decide whether to include open issues and TODO comments.
- Decide whether to include dependency health.
- Choose report destination: email, Slack, GitHub issue, Notion, or markdown file.

## Pilot Exit

At the end of the pilot, collect:

- Number of PRs reviewed
- Number of useful findings
- Number of false positives removed
- Examples of time saved
- Top 3 desired improvements

Convert to a paid plan only if the customer can point to concrete value.
