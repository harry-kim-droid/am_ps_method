# Codex PR Review and Tech Debt Reporting Service

Small-team product package for selling a Codex-based automation service:

- Automated pull request review for small development teams
- Weekly technical debt report
- Customer onboarding checklist
- GitHub Actions workflow starter
- Codex prompts for repeatable review and reporting

This repository is meant to become a sellable service kit, not only a demo. The first commercial version should be operated as a human-reviewed automation service: Codex drafts the findings, and the service owner verifies the output before sending it to customers.

## Target Customer

Small software teams with 1-10 engineers who:

- Ship through GitHub pull requests
- Do not have enough senior review capacity
- Want faster feedback on bugs, tests, maintainability, and release risk
- Need a weekly view of technical debt without running a formal platform team

## Offer

**Codex Review Desk for Small Teams**

What the customer gets:

- PR review summary on every selected pull request
- Risk-focused comments covering bugs, tests, security, compatibility, and maintainability
- Weekly technical debt report with ranked action items
- Optional small fix PRs for low-risk issues
- Monthly process review to tune prompts and review criteria

## Recommended Pricing

Pilot:

- 1 repository
- 2 weeks
- Up to 20 pull requests
- One weekly technical debt report
- Price: free to KRW 300,000 depending on customer warmth

Starter:

- 1-2 repositories
- Up to 50 PRs/month
- Weekly report
- Price: KRW 300,000-700,000/month

Team:

- 3-5 repositories
- Up to 150 PRs/month
- Weekly report plus monthly review call
- Price: KRW 900,000-2,000,000/month

## Repository Contents

- [docs/service-blueprint.md](docs/service-blueprint.md): full service definition
- [docs/sales-one-pager.md](docs/sales-one-pager.md): customer-facing sales sheet
- [docs/install-guide.md](docs/install-guide.md): customer repository installation guide
- [docs/onboarding-checklist.md](docs/onboarding-checklist.md): setup checklist
- [docs/operations-playbook.md](docs/operations-playbook.md): weekly operating process
- [docs/troubleshooting.md](docs/troubleshooting.md): GitHub Actions, quota, and setup failure guide
- [docs/outreach-script.md](docs/outreach-script.md): messages for finding pilot customers
- [docs/unit-economics.md](docs/unit-economics.md): pricing, time budget, and margin guardrails
- [scripts/install-codex-review-kit.ps1](scripts/install-codex-review-kit.ps1): installer for copying workflow files into a customer repo
- [scripts/trigger-codex-review-test.ps1](scripts/trigger-codex-review-test.ps1): helper to rerun the test PR workflow after billing fixes
- [templates/pr-review-prompt.md](templates/pr-review-prompt.md): Codex PR review prompt
- [templates/weekly-tech-debt-prompt.md](templates/weekly-tech-debt-prompt.md): Codex weekly report prompt
- [templates/weekly-tech-debt-report.md](templates/weekly-tech-debt-report.md): report template
- [.github/workflows/codex-pr-review.yml](.github/workflows/codex-pr-review.yml): GitHub Actions starter workflow
- [.github/workflows/codex-weekly-tech-debt.yml](.github/workflows/codex-weekly-tech-debt.yml): weekly report workflow

## First 14 Days

1. Pick one friendly customer or your own active repository.
2. Install the GitHub Actions workflow in a test branch using [docs/install-guide.md](docs/install-guide.md).
3. Run PR reviews for one week and manually verify every Codex finding.
4. Produce the first weekly technical debt report.
5. Ask the customer which findings saved time or avoided risk.
6. Convert the pilot into a monthly plan using the pricing above.

## Safety Rules

- Do not sell this as fully autonomous engineering.
- Keep a human approval step for customer-visible findings.
- Avoid secrets, private customer data, or production credentials in prompts.
- Start in read-only review mode before enabling automatic patch generation.
- Keep all output traceable to commits, files, and pull request numbers.
