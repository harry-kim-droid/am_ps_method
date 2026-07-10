$ErrorActionPreference = "Stop"
$root = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
& (Join-Path $PSScriptRoot "build-product.ps1")
$zip = Join-Path $root "product-dist\codex-self-review-kit-v1.0.0.zip"
$testRoot = Join-Path $env:TEMP ("codex-kit-test-" + [guid]::NewGuid())
$unpack = Join-Path $testRoot "unpack"
$target = Join-Path $testRoot "target"
try {
  Expand-Archive -LiteralPath $zip -DestinationPath $unpack
  New-Item -ItemType Directory -Force -Path (Join-Path $target ".git") | Out-Null
  & (Join-Path $unpack "scripts\install-codex-review-kit.ps1") -TargetRepo $target
  $required = @(
    ".github\workflows\codex-pr-review.yml",
    ".github\workflows\codex-weekly-tech-debt.yml",
    ".github\codex\prompts\pr-review.md",
    ".github\codex\prompts\weekly-tech-debt.md"
  )
  foreach ($file in $required) {
    if (-not (Test-Path (Join-Path $target $file))) { throw "Installer did not create $file" }
  }
  Write-Host "Package smoke test passed."
} finally {
  if (Test-Path -LiteralPath $testRoot) { Remove-Item -LiteralPath $testRoot -Recurse -Force }
}
