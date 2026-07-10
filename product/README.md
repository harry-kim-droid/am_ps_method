# Codex 셀프 코드리뷰 자동화 키트 v1.0.0

GitHub PR마다 Codex가 버그, 테스트 누락, 호환성·배포 위험을 검토하고 매주 기술부채 리포트를 만드는 읽기 전용 자동화 패키지입니다.

## 30분 설치

1. PowerShell에서 `scripts/install-codex-review-kit.ps1 -TargetRepo "C:\path\to\repo"`를 실행합니다.
2. 대상 저장소의 GitHub Secret에 `OPENAI_API_KEY`를 등록합니다.
3. 설치된 파일을 별도 브랜치에 커밋하고 테스트 PR을 엽니다.
4. 첫 결과에서 파일·라인 근거와 오탐을 사람이 확인합니다.
5. Actions 탭에서 주간 리포트를 수동 실행합니다.

자세한 내용은 `docs/install-guide.md`, `docs/cost-and-security.md`, `docs/troubleshooting.md`를 순서대로 읽으세요.

## 경계

- 자동 코드 수정은 하지 않습니다.
- OpenAI API 비용은 포함되지 않습니다.
- AI 리뷰는 사람의 검토나 보안 감사를 대체하지 않습니다.
- API 키와 프로덕션 비밀을 프롬프트나 저장소 파일에 넣지 마세요.

## 업데이트와 지원

초기 버전 업데이트에는 제공 파일의 호환성 수정이 포함됩니다. 개별 저장소 설치, 맞춤 프롬프트, 코드 수정은 별도 지원입니다.
