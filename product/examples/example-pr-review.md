# 예제 PR 리뷰

## Summary

주문 결제 재시도 로직을 추가한 변경입니다. 중복 요청을 구분하는 키가 없어 결제가 두 번 처리될 위험이 있습니다.

## Risk Rating

Medium

## Findings

- Priority: P1
- File: `src/checkout.ts`
- Issue: 네트워크 재시도에서 동일 주문을 다시 결제할 수 있습니다.
- Why it matters: 고객 이중 결제와 수동 환불로 이어질 수 있습니다.
- Suggested fix: 주문 ID 기반 idempotency key를 결제 제공자에 전달합니다.
- Suggested test: 동일 키로 요청을 두 번 보내 실제 charge가 한 번만 생성되는지 확인합니다.

> 이 문서는 출력 형식을 보여주는 가상 예시입니다.
