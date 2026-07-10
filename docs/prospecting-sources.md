# Prospecting Sources

Use these sources to build the first 30-prospect list. The goal is not to scrape everyone. The goal is to find teams likely to have GitHub pull requests, small engineering teams, and active review pain.

## Source 1: Warm Network

Start here before public lists.

Look for:

- Founders you already know
- Freelance agencies
- Developers who recently changed jobs
- Startup operators who can introduce you to a CTO
- Teams where trust is already higher than a cold email

Why it works:

- The first pilot needs trust more than scale.
- A warm team is more likely to share recent PRs.
- You can ask for honest feedback even if they do not buy.

## Source 2: Wellfound South Korea

URL:

- https://wellfound.com/location/south-korea-1

What to look for:

- Companies with 11-50 or 51-200 employees
- Actively hiring engineering roles
- B2B, SaaS, infrastructure, data, AI, or developer tools
- Recent backend, full-stack, DevOps, platform, or QA hiring

How to use it:

1. Open the company page.
2. Check whether the company is small enough to feel review bottlenecks.
3. Find the CTO, founder, engineering manager, or developer advocate.
4. Add the company to `templates/prospect-tracker.csv`.
5. Send the short DM from `docs/outreach-script.md`.

## Source 3: Startup.jobs South Korea

URL:

- https://startup.jobs/locations/south-korea

What to look for:

- Engineering category roles
- Remote or hybrid teams
- Recently posted technical roles
- Teams hiring multiple technical roles at once

Prioritize companies hiring:

- Backend Engineer
- Full Stack Engineer
- DevOps
- QA
- Platform Engineer
- Senior Software Engineer

Why it works:

- Hiring is a signal that review load may increase.
- Growing teams often need more consistent engineering process before hiring catches up.

## Source 4: SeoulTech Jobs in Korea

URL:

- https://github.com/SeoulTech/startup-jobs-in-korea
- https://github.com/SeoulTech/jobs-in-korea

What to look for:

- GitHub issue titles with developer roles
- Seoul-based startups
- Remote or hybrid tags
- Teams that already use GitHub publicly

Why it works:

- GitHub-native job posts are more likely to come from teams comfortable with GitHub workflows.

## Source 5: Public GitHub Organizations

Search GitHub for:

- `location:Korea language:TypeScript`
- `location:Seoul language:Python`
- `topic:saas Korea`
- `topic:startup Korea`

Look for:

- Organization accounts with active repositories
- Recent pull requests or issues
- Public engineering docs
- Small tooling or product repositories

Do not contact maintainers with a generic pitch. Mention one concrete signal, such as active PRs, recent hiring, or visible release activity.

## Qualification Score

Score each prospect from 0-10:

- Uses GitHub or public repos: +2
- Has 2-10 engineers or appears small: +2
- Hiring engineers now: +2
- B2B/SaaS/dev/data/infrastructure product: +2
- Warm introduction possible: +2

Contact prospects scoring 6 or higher first.

## First 30 Split

Build the list like this:

- 10 warm network prospects
- 8 Wellfound prospects
- 6 Startup.jobs prospects
- 3 SeoulTech GitHub job prospects
- 3 public GitHub organization prospects

## Outreach Rule

Never lead with "AI automation makes guaranteed profit."

Lead with:

- "I can review 3 recent PRs and send a human-verified sample."
- "If it is not useful, we stop there."
- "If it is useful, the 2-week pilot is KRW 300,000."

That keeps the offer concrete and reduces trust friction.
