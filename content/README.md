# Content pipeline

`briefs/`의 YAML 파일이 콘텐츠 요청 인터페이스입니다. `status: queued`인 브리프를 Codex 워크플로가 읽고 `src/content/blog/`에 검수용 Markdown 초안을 만듭니다.

필수 필드:

- `slug`: 출력 파일명
- `topic`, `primary_keyword`, `search_intent`, `reader_problem`
- `product_link`: `sample` 또는 `product`
- `evidence_urls`: 근거로 사용할 공식 URL 목록
- `status`: `queued`, `drafted`, `published`

자동 생성된 글은 반드시 `status: review`로 저장하고 PR 검수 후에만 `published`로 바꿉니다. 가격, 정책, 모델명처럼 바뀔 수 있는 사실은 근거가 없으면 `[확인 필요]`로 표시합니다.
