# Codex 셀프 코드리뷰 자동화 키트

한국 1인 개발자에게 판매할 디지털 상품, 무료 샘플, Astro SEO 블로그, Codex 콘텐츠 초안 워크플로를 한 저장소에서 운영합니다.

## 로컬 실행

```powershell
npm install
npm run dev
```

정적 빌드와 상품 패키지:

```powershell
npm run build
npm run package:product
powershell -ExecutionPolicy Bypass -File scripts/test-package.ps1
```

결과물:

- `dist/`: 배포할 Astro 사이트
- `product-dist/codex-self-review-kit-v1.0.0.zip`: Lemon Squeezy에 올릴 유료 상품
- `public/downloads/codex-review-free-sample.zip`: 사이트에서 제공할 무료 샘플

## 출시 설정

1. Lemon Squeezy에서 상품을 만들고 유료 ZIP을 업로드합니다.
2. GitHub 저장소 변수 `PUBLIC_CHECKOUT_URL`에 checkout URL을 설정합니다.
3. `src/pages/policy.astro`의 TODO를 실제 판매자 정보로 교체합니다.
4. 저장소 Settings → Pages에서 GitHub Actions 배포를 활성화합니다.
5. 필요할 때 `PUBLIC_ANALYTICS_DOMAIN`을 설정합니다.

## 콘텐츠 검수 흐름

1. `content/briefs/`에 YAML 브리프를 추가합니다.
2. GitHub Actions의 `Draft reviewed content`를 실행합니다.
3. Codex가 `status: review` 초안을 담은 PR을 엽니다.
4. 사람이 근거와 문장을 검수하고 `status: published`로 바꿉니다.
5. 기본 브랜치 병합 후 사이트가 자동 배포됩니다.

자세한 주간 운영과 지표 정의는 [docs/content-operations.md](docs/content-operations.md)를 참고하세요.

## 안전 원칙

- 고객 API 키를 사용하고 GitHub Secret에만 저장합니다.
- 리뷰 실행은 `contents: read`, `sandbox: read-only`가 기본입니다.
- 콘텐츠와 코드리뷰 모두 사람이 확인하기 전에는 고객에게 확정 정보로 제공하지 않습니다.
- 자동 코드 수정, 완전한 버그 탐지, 보안 감사 대체를 약속하지 않습니다.
