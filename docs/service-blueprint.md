# Service Blueprint

## Service Name

Codex Review Desk for Small Teams

## Positioning

A lightweight AI-assisted review desk for small development teams that want senior-style review coverage without hiring another full-time senior engineer.

The service uses Codex to inspect pull requests and repository health on a schedule. The operator verifies Codex output, filters weak findings, and sends concise, actionable feedback to the customer.

## Problem

Small teams often have these recurring problems:

- Pull requests wait too long for review.
- Review quality depends on who is available that day.
- Tests, edge cases, and migration risk are easy to miss.
- Technical debt is discussed informally but rarely tracked.
- Founders and senior engineers spend time on repetitive review work.

## Customer Promise

Every week, the customer gets:

- Faster PR feedback
- Fewer missed bugs and test gaps
- A ranked technical debt list
- Clear next actions, not vague AI-generated commentary

## Core Workflow

### Pull Request Review

Trigger:

- New pull request
- Pull request marked ready for review
- Manual `@codex review` request

Codex checks:

- Behavioral bugs
- Missing tests
- Risky migrations
- Data loss or backward compatibility issues
- Security-sensitive changes
- Performance regressions
- Overly complex code
- Documentation drift

Human operator checks:

- Remove speculative findings
- Confirm file and line references
- Prioritize only useful feedback
- Convert verbose output into a customer-ready summary

Output:

- PR summary
- Risk rating
- Top findings
- Suggested tests
- Optional small patch proposal

### Weekly Technical Debt Report

Trigger:

- Weekly Codex automation or scheduled CLI run

Codex checks:

- Recently changed files
- Open TODO/FIXME comments
- Flaky or failing tests
- Large or complex modules
- Dependency warnings
- Repeated review findings
- Missing docs around active areas

Output:

- Executive summary
- Top 5 technical debt items
- Suggested one-week fixes
- Deferred risks
- Suggested owners

## Delivery Model

### Phase 1: Assisted Service

The operator manually reviews all Codex output before sending it to customers.

Best for:

- First pilots
- High-trust customer relationships
- Learning what findings customers actually value

### Phase 2: Semi-Automated Service

Codex posts low-risk summaries automatically. High-risk or uncertain findings are held for human review.

Best for:

- Customers with stable repositories
- Mature review criteria
- Recurring monthly retainers

### Phase 3: Productized Automation

The workflow runs through GitHub Actions, Codex Automations, or a custom dashboard using the Codex SDK.

Best for:

- Multiple customers
- Standardized onboarding
- Higher-margin subscription plans

## Minimum Viable Pilot

Pilot scope:

- 1 repository
- 2 weeks
- PR reviews on selected pull requests
- 1 weekly technical debt report
- Human-verified output only

Success criteria:

- Customer says at least 3 findings were useful
- At least 1 issue would likely have been missed manually
- Weekly report leads to at least 1 concrete cleanup task
- Setup takes less than 2 hours for the next customer

## Metrics

Operational metrics:

- PRs reviewed
- Findings sent
- Findings accepted
- False positives removed before delivery
- Average review turnaround
- Weekly report action items completed

Business metrics:

- Pilot-to-paid conversion
- Monthly recurring revenue
- Churn reasons
- Support time per customer
- Gross margin after API and operator time

## Boundaries

This service should not promise:

- Perfect bug detection
- Replacement for human code review
- Autonomous production changes
- Security audit equivalence
- Legal, compliance, or regulated-system approval

It should promise:

- Faster second-pass review
- Better review consistency
- Actionable weekly maintenance visibility
- Reduced repetitive senior-engineer workload
