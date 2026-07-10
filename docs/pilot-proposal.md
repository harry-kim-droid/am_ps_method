# Pilot Proposal

## Codex Review Desk Pilot

This pilot gives your team a human-verified AI review layer for GitHub pull requests.

Codex drafts the first review. I verify the findings before you see them, remove noise, and send only concrete issues tied to code, tests, or release risk.

## Scope

- Duration: 2 weeks
- Repository: 1 GitHub repository
- Pull requests: up to 20 selected PRs
- Weekly report: 1 technical debt report
- Mode: read-only review unless we explicitly agree on patch proposals

## What You Receive

- PR review summaries
- Risk-ranked findings
- Missing test and edge-case suggestions
- Weekly technical debt report
- End-of-pilot summary with useful findings, false positives, and recommended next steps

## Setup Requirements

- GitHub repository access
- `OPENAI_API_KEY` configured in GitHub Secrets, or operator-run review from my environment
- Agreement on which PRs are in scope
- Agreement on ignored paths, sensitive areas, and report destination

No production credentials are required.

## Success Criteria

The pilot is successful if your team sees at least one of these outcomes:

- Review time saved on important PRs
- A real bug, missing test, or migration risk caught before merge
- A clearer weekly cleanup priority list
- Repeated review patterns your team can turn into rules

## Price

Pilot price:

- KRW 300,000 for 2 weeks

If the sample review is not useful, do not continue to the paid pilot.

## Monthly Option

If the pilot is useful:

- Starter: KRW 300,000-700,000/month for 1-2 repositories
- Team: KRW 900,000-2,000,000/month for 3-5 repositories

Monthly pricing depends on PR volume, report depth, and whether findings are posted directly or reviewed privately first.

## Boundaries

- This is not a guarantee that every bug will be found.
- This is not a replacement for your engineers.
- Customer-visible findings are human-verified during the pilot.
- Automatic code changes are out of scope unless separately agreed.
