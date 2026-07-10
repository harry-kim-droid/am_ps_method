# 콘텐츠 운영 가이드

## 주간 루프

1. Search Console과 판매처에서 노출, 방문, 샘플 다운로드, 결제 클릭, 구매를 확인한다.
2. `metrics/weekly-funnel.csv`에 일주일 합계를 한 행 추가한다.
3. 검색 의도와 고객 질문을 바탕으로 `content/briefs/`에 YAML 브리프를 만든다.
4. `Draft reviewed content`를 수동 실행한다.
5. 생성 PR에서 모든 URL, 명령, 가격, 정책, 모델명을 직접 확인한다.
6. 오탐 표현과 홍보성 문장을 제거한 뒤 `status: published`로 변경한다.
7. 병합 후 실제 페이지, CTA, 모바일 화면을 확인한다.

## 이벤트 이름

- `sample_download`: 무료 샘플 다운로드
- `checkout_click`: 결제 페이지 이동
- `purchase`: Lemon Squeezy 판매 대시보드의 완료 주문

정적 사이트는 쿠키 없는 Plausible을 선택적으로 연결할 수 있다. 사용하지 않으면 서버 로그와 판매처 대시보드로 시작한다. 구매 완료는 클라이언트가 임의로 기록하지 않고 판매처 수치를 기준으로 한다.

## 출시 전 교체 값

- 저장소 변수 `PUBLIC_CHECKOUT_URL`: Lemon Squeezy 상품 checkout URL
- 저장소 변수 `PUBLIC_ANALYTICS_DOMAIN`: 분석을 사용할 때만 입력
- `src/pages/policy.astro`: 실제 판매자명, 이메일과 법정 고지
- Lemon Squeezy 상품: 출시가 29,000원, 정상가 표기 39,000원, `product-dist/codex-self-review-kit-v1.0.0.zip` 업로드

## 14일 목표

상품 공개, 글 5개, 유효 방문 100, 샘플 다운로드 10, 유료 판매 1건을 기준으로 삼는다. 판매가 없으면 글 수를 늘리기 전에 checkout 클릭률과 구매 전 질문부터 분석한다.
