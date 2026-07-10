---
title: "Codex Action 설정과 API 비용 관리"
description: "PR 자동 리뷰 비용을 통제하기 위한 트리거, 모델, 변경 범위와 측정 방법을 정리합니다."
publishedAt: 2026-07-08
keywords: ["Codex API 비용", "Codex Action", "GitHub Actions"]
status: published
cta: product
---
API 비용은 고정된 숫자로 외우기보다 저장소에서 직접 측정해야 합니다. 모델 가격과 정책은 바뀔 수 있으므로 구매 전 [OpenAI 공식 가격 페이지](https://openai.com/api/pricing/)를 확인하세요.

## 실행 횟수부터 줄이기

초안 PR은 제외하고 `opened`, `synchronize`, `reopened` 이벤트만 사용합니다. 문서만 바뀐 PR이나 자동 생성 파일은 경로 필터로 제외할 수 있습니다. 큰 PR은 리뷰 품질과 비용 모두 불리하므로 변경을 나누는 것이 먼저입니다.

## 한 달간 기록할 값

PR 번호, 변경 파일 수, 실행 횟수, 사용 모델, 대략적인 비용, 유효한 지적 수를 기록합니다. 처음에는 저장소별 월 예산을 정하고 예상보다 빨리 소진되면 자동 리뷰를 선택 실행 방식으로 바꿉니다.

## 키 관리

API 키를 코드나 프롬프트에 적지 말고 GitHub Actions Secret으로 저장합니다. 로그와 artifact에도 키나 고객 데이터가 포함되지 않는지 첫 실행에서 확인하세요.
