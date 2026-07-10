# Outreach Script

## Target List

Start with 30 teams and track them in `templates/prospect-tracker.csv`:

- Startup founders you know
- Freelance agencies
- SaaS teams with public GitHub activity
- Teams hiring backend or full-stack engineers
- Teams with slow PR review complaints in job posts, blogs, or communities

## Short DM

Hi, I am testing a small service for teams that use GitHub PRs.

It uses Codex to draft PR review feedback and a weekly technical debt report, then I manually verify the output so your team does not get noisy AI comments.

The 2-week pilot covers one repository and selected PRs. The goal is simple: find at least a few useful bugs, test gaps, or cleanup tasks your team would actually act on.

Would it be useful if I reviewed 3 recent PRs and sent you a sample report?

## Email

Subject: AI-assisted PR review pilot for small dev teams

Hi {{name}},

I am running a small pilot for teams that use GitHub pull requests.

The service uses Codex to inspect selected PRs and produce a weekly technical debt report. I manually verify the findings before you see them, so the output stays practical: bugs, missing tests, migration risk, and concrete cleanup tasks.

Pilot scope:

- 1 repository
- 2 weeks
- selected PR reviews
- 1 weekly technical debt report
- no production credentials required

The goal is to prove whether this saves review time or catches issues your team would otherwise miss.

If you are open to it, I can review 3 recent PRs first and send a sample report.

Best,
{{your_name}}

## Discovery Questions

- How many PRs do you merge per week?
- Who usually reviews the riskiest PRs?
- What kind of issues are most painful when they slip through?
- Do you want comments directly on PRs, or a private draft first?
- Would a weekly technical debt report help planning, or would it create noise?

## Pilot Close

If the sample review is useful, suggest:

- 2-week pilot
- 1 repository
- selected PRs only
- weekly report
- clear success review at the end

Do not push for a subscription before the customer has seen concrete findings.

Use `docs/pilot-proposal.md` only after the customer has reacted positively to a sample review or discovery call.
