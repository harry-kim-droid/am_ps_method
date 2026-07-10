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

## Korean Short DM

안녕하세요, GitHub PR을 쓰는 작은 개발팀을 위한 리뷰 자동화 파일럿을 테스트하고 있습니다.

Codex가 PR 리뷰 초안을 만들고, 제가 사람이 한 번 검수해서 노이즈를 제거한 뒤 버그 가능성, 테스트 누락, 마이그레이션 리스크 같은 실질적인 내용만 전달하는 방식입니다.

바로 유료 제안드리려는 건 아니고, 최근 PR 3개만 샘플로 리뷰해서 짧은 리포트를 보내드려도 괜찮을지 여쭤보고 싶었습니다.

유용하지 않으면 거기서 멈추고, 유용하면 2주 파일럿을 논의하면 됩니다.

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

## Korean Email

Subject: GitHub PR 리뷰 보조 파일럿 제안드립니다

안녕하세요 {{name}}님,

GitHub Pull Request를 사용하는 작은 개발팀을 대상으로 Codex 기반 PR 리뷰 보조 파일럿을 진행하고 있습니다.

방식은 단순합니다. Codex가 선택된 PR을 먼저 검토하고, 제가 사람이 한 번 더 확인해서 노이즈를 제거한 뒤 실제로 볼 가치가 있는 내용만 전달합니다. 주로 버그 가능성, 테스트 누락, 배포 리스크, 유지보수 부담이 커질 수 있는 부분을 봅니다.

파일럿 범위:

- 저장소 1개
- 2주
- 선택된 PR 리뷰
- 주간 기술부채 리포트 1회
- 운영/프로덕션 계정 정보 불필요

처음부터 결제를 요청드리기보다는, 최근 PR 3개를 샘플로 리뷰해서 짧은 리포트를 보내드리고 싶습니다. 팀에서 실제로 도움이 된다고 느끼시면 그때 2주 파일럿을 논의하면 됩니다.

괜찮으시면 샘플 리뷰 가능한 PR 3개를 추천해주실 수 있을까요?

감사합니다.
{{your_name}}

## Korean Follow-Up

안녕하세요 {{name}}님, 이전에 말씀드린 PR 리뷰 샘플 관련해서 짧게 다시 연락드립니다.

최근 PR 3개만 기준으로:

- 놓치기 쉬운 버그 가능성
- 테스트가 필요한 엣지 케이스
- 다음 스프린트에 정리하면 좋은 기술부채

를 사람이 검수한 리포트로 보내드릴 수 있습니다.

유용하지 않으면 바로 중단하면 되고, 유용하면 2주 파일럿으로 이어가면 됩니다.

이번 주에 샘플로 한번 받아보실 의향이 있으실까요?

## Korean Founder DM

{{name}}님 안녕하세요. 작은 개발팀에서 PR 리뷰가 병목이 되는 경우가 많아서, Codex 기반으로 PR 리뷰 초안을 만들고 사람이 검수해서 전달하는 파일럿을 만들고 있습니다.

개발자를 대체하는 서비스가 아니라, 대표님이나 시니어 개발자가 매번 보기 어려운 테스트 누락/리스크/반복되는 기술부채를 빨리 잡아주는 보조 레이어입니다.

최근 PR 3개만 샘플로 보고 짧은 리포트를 드려도 괜찮을까요? 유용하지 않으면 거기서 멈추겠습니다.

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
