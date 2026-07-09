# Operations Playbook

## Daily PR Review Process

1. Review newly opened or updated customer PRs.
2. Let Codex generate the first review draft.
3. Remove weak or speculative findings.
4. Confirm each remaining finding points to a concrete file, behavior, or test gap.
5. Send a concise PR comment or report.
6. Track accepted and rejected findings.

For the first pilot week, keep a private copy of every removed finding. Review that list before changing prompts so prompt tuning is based on evidence instead of vibes.

## Weekly Technical Debt Process

1. Pull the latest default branch.
2. Collect the last 7 days of commits and merged PRs.
3. Run the weekly Codex prompt.
4. Verify every top item manually.
5. Rank items by customer impact and fix effort.
6. Send the report using `templates/weekly-tech-debt-report.md`.
7. Convert the top 1-3 items into GitHub issues if the customer wants that.

## Finding Quality Bar

Send a finding only when it is:

- Concrete
- Actionable
- Relevant to the changed code or active repository risk
- Not already obvious from CI
- Useful enough that an engineer would not resent reading it

Do not send:

- Generic style preferences
- Vague "consider improving" comments
- Findings that cannot cite a file or behavior
- Large rewrites unless the customer asked for architecture review

## Risk Labels

P0:

- Likely production incident, data loss, security exposure, or failed deployment.

P1:

- High-confidence bug, missing migration step, broken user flow, or important test gap.

P2:

- Maintainability, moderate test gap, performance concern, or confusing logic.

P3:

- Nice-to-have cleanup or documentation improvement.

## Customer Report Tone

Use short, direct language:

- What changed
- What risk exists
- Why it matters
- What to do next

Avoid long AI explanations. The customer is paying for clarity.

## Monthly Review

Discuss:

- Which findings were useful
- Which findings were noisy
- Which recurring issues should become team rules
- Whether to add automatic fix PRs for low-risk cleanup
- Whether the plan should scale up or down
