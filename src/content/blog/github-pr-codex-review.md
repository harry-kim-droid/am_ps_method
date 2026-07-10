---
title: "GitHub PR에 Codex 코드리뷰를 자동으로 붙이는 방법"
description: "읽기 전용 Codex Action으로 PR을 검토하고 결과를 댓글로 남기는 최소 구성을 설명합니다."
publishedAt: 2026-07-10
keywords: ["Codex 코드리뷰", "GitHub Actions", "PR 자동화"]
status: published
cta: product
---
혼자 개발하면 PR은 기록을 남기는 장치일 뿐, 실제 리뷰어가 되지는 못합니다. 이 공백은 PR이 열릴 때 Codex가 변경사항을 읽고 위험을 요약하도록 만들면 줄일 수 있습니다.

## 최소 구성

필요한 것은 GitHub Actions 워크플로, 리뷰 기준을 담은 프롬프트, 저장소 Secret에 넣은 `OPENAI_API_KEY`입니다. 워크플로에는 `contents: read`만 부여하고 Codex sandbox도 `read-only`로 시작합니다.

```yaml
permissions:
  contents: read

- uses: openai/codex-action@v1
  with:
    openai-api-key: ${{ secrets.OPENAI_API_KEY }}
    prompt-file: .github/codex/prompts/pr-review.md
    sandbox: read-only
```

댓글을 게시하는 작업은 별도 job으로 분리해 `pull-requests: write` 권한이 리뷰 실행 단계에 흘러가지 않게 합니다.

## 처음부터 자동 수정하지 않는 이유

초기 목표는 코드 생산량이 아니라 두 번째 검토입니다. 자동 수정 권한까지 주면 잘못된 피드백이 실제 변경으로 이어질 수 있고, 어떤 판단이 적용됐는지 추적하기도 어려워집니다.

## 첫 테스트 PR

의도적으로 테스트가 빠진 작은 버그 수정 PR을 만드세요. 결과에서 파일과 근거가 정확한지, 일반론이 아닌 실행 가능한 테스트를 제안하는지 확인합니다. 근거 없는 지적이 많다면 모델보다 프롬프트 범위를 먼저 줄이는 편이 효과적입니다.
