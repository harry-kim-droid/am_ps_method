# Objection Handling

Use this when a prospect replies with concerns. Keep answers honest, specific, and short.

## "Is this just ChatGPT reviewing my code?"

Suggested answer:

Not exactly. Codex drafts the first review, but during the pilot I manually verify the output before sending it. The service is the workflow: scoped PR selection, review criteria, noise removal, weekly synthesis, and follow-up on what was actually useful.

## "Can AI guarantee fewer bugs?"

Suggested answer:

No. I would not sell it as a guarantee. The goal is to add another review layer that catches practical issues earlier: missing tests, migration risk, edge cases, confusing logic, and repeated cleanup patterns. We judge the pilot by useful findings, not by promises.

## "Why not just run this ourselves?"

Suggested answer:

You can. The reason teams still use an operated service is that prompt tuning, review filtering, weekly synthesis, and false-positive control take time. The pilot tests whether outsourcing that operating loop is worth more than doing it internally.

## "Will our code be exposed?"

Suggested answer:

The pilot starts with the least access possible. No production credentials are needed. We can run on selected PRs only, ignore sensitive paths, and keep output private first instead of posting directly to PRs. If your repo has strict confidentiality requirements, we should review those before starting.

## "Can it post comments automatically?"

Suggested answer:

Technically yes, but I recommend private drafts during calibration. Once we know the findings are useful and low-noise, direct PR comments can be enabled.

## "How much does the OpenAI API cost?"

Suggested answer:

API cost depends on PR volume, repository size, and model choice. For the first pilot, I keep usage controlled by reviewing selected PRs only and manually checking output. The pilot price is not based only on API cost; it includes setup, review filtering, weekly reporting, and calibration.

## "Why is the pilot KRW 300,000?"

Suggested answer:

The pilot is priced to be smaller than a few hours of senior engineering time. It covers setup, selected PR reviews, one weekly technical debt report, and an end-of-pilot summary. If the sample review is not useful, we should not move to the paid pilot.

## "Can you fix the issues too?"

Suggested answer:

For the first pilot, I recommend review-only. Small fix PRs can be added later for low-risk cleanup, but automatic changes before trust is established create unnecessary risk.

## "We already have senior reviewers."

Suggested answer:

That is a good fit if those reviewers are overloaded. This does not replace their judgment; it gives them a filtered first pass and a weekly view of repeated issues so they spend less time finding obvious gaps.

## "We do not want noisy AI comments."

Suggested answer:

Agreed. That is why the pilot is human-verified. During calibration, I can send findings privately first. Anything vague, speculative, or not tied to a concrete file or behavior gets removed.

## "Can we try it for free?"

Suggested answer:

Yes, for a very small sample: 3 recent PRs and a short report. If that is useful, the 2-week pilot is KRW 300,000. Keeping the free part small makes sure both sides are testing real value, not doing open-ended unpaid consulting.

## Bad Answers To Avoid

Do not say:

- "This will definitely make money."
- "This guarantees fewer production bugs."
- "The API cost is the only real cost."
- "You can trust all AI comments automatically."
- "Just give me full repo and production access."

## Close After A Good Reply

Use this when the prospect is interested:

Great. For the sample, please send 3 recent PR links that represent normal work for your team. I will review them privately and send back:

- the top useful findings
- any false positives I removed
- whether I think a 2-week pilot is worth doing

If the sample is useful, the pilot scope is 1 repo, 2 weeks, up to 20 selected PRs, and 1 weekly technical debt report for KRW 300,000.
