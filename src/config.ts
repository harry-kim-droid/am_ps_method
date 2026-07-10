export const site = {
  name: '리뷰 워크벤치',
  description: '혼자 만드는 개발자를 위한 Codex 코드리뷰 자동화 실전 가이드',
  productName: 'Codex 셀프 코드리뷰 자동화 키트',
  checkoutUrl: import.meta.env.PUBLIC_CHECKOUT_URL || 'https://github.com/harry-kim-droid/am_ps_method/issues/new?template=purchase.yml',
  checkoutReady: Boolean(import.meta.env.PUBLIC_CHECKOUT_URL),
  sampleUrl: import.meta.env.PUBLIC_SAMPLE_URL || '/sample/',
  analyticsDomain: import.meta.env.PUBLIC_ANALYTICS_DOMAIN || '',
};
