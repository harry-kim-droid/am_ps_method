# Install Guide

Use this guide to install the automation files into a customer's GitHub repository.

## Prerequisites

- The target project is hosted on GitHub.
- GitHub Actions is enabled.
- You have permission to add repository files and GitHub Actions secrets.
- An OpenAI API key is available for the customer or service operator.
- The first pilot starts in read-only review mode.

## Files Installed

The installer copies:

- `.github/workflows/codex-pr-review.yml`
- `.github/workflows/codex-weekly-tech-debt.yml`
- `.github/codex/prompts/pr-review.md`
- `.github/codex/prompts/weekly-tech-debt.md`

## Install With PowerShell

From this service-kit repository:

```powershell
.\scripts\install-codex-review-kit.ps1 -TargetRepo "C:\path\to\customer\repo"
```

Preview without copying:

```powershell
.\scripts\install-codex-review-kit.ps1 -TargetRepo "C:\path\to\customer\repo" -WhatIfOnly
```

Overwrite existing automation files:

```powershell
.\scripts\install-codex-review-kit.ps1 -TargetRepo "C:\path\to\customer\repo" -Force
```

## GitHub Setup

1. Add `OPENAI_API_KEY` under repository secrets.
2. Commit the installed files to a branch.
3. Open a test pull request.
4. Confirm the `Codex PR Review` workflow posts useful feedback.
5. Manually run `Codex Weekly Tech Debt Report` from the Actions tab.
6. Download the generated artifact and verify the report before sending it to the customer.

## Pilot Defaults

Use these defaults for the first customer:

- `sandbox: read-only`
- PR comments enabled only after reviewing the first sample internally
- Weekly report reviewed manually before delivery
- No automatic fix PRs
- No production secrets in prompts

## Customization

Edit the prompt files in the customer's repository:

- `.github/codex/prompts/pr-review.md`
- `.github/codex/prompts/weekly-tech-debt.md`

Add customer-specific priorities such as:

- Payment risk
- Data migration risk
- Mobile compatibility
- API backward compatibility
- Performance-sensitive paths
- Security-sensitive modules

Keep the first version narrow. A short, high-signal review is easier to sell than a long report that engineers ignore.
