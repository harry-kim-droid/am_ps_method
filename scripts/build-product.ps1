param([string] $Version = "1.0.0")
$ErrorActionPreference = "Stop"
$root = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$dist = Join-Path $root "product-dist"
$stage = Join-Path $dist "codex-self-review-kit"
$downloads = Join-Path $root "public\downloads"

if (Test-Path -LiteralPath $dist) { Remove-Item -LiteralPath $dist -Recurse -Force }
New-Item -ItemType Directory -Force -Path $stage, $downloads | Out-Null

$items = @(
  @{ From = "product\README.md"; To = "README.md" },
  @{ From = "product\docs"; To = "docs" },
  @{ From = "product\examples"; To = "examples" },
  @{ From = "docs\install-guide.md"; To = "docs\install-guide.md" },
  @{ From = "docs\troubleshooting.md"; To = "docs\troubleshooting.md" },
  @{ From = ".github\workflows\codex-pr-review.yml"; To = ".github\workflows\codex-pr-review.yml" },
  @{ From = ".github\workflows\codex-weekly-tech-debt.yml"; To = ".github\workflows\codex-weekly-tech-debt.yml" },
  @{ From = ".github\codex\prompts\pr-review.md"; To = ".github\codex\prompts\pr-review.md" },
  @{ From = ".github\codex\prompts\weekly-tech-debt.md"; To = ".github\codex\prompts\weekly-tech-debt.md" },
  @{ From = "scripts\install-codex-review-kit.ps1"; To = "scripts\install-codex-review-kit.ps1" },
  @{ From = "scripts\trigger-codex-review-test.ps1"; To = "scripts\trigger-codex-review-test.ps1" }
)
foreach ($item in $items) {
  $source = Join-Path $root $item.From
  if (-not (Test-Path -LiteralPath $source)) { throw "Missing package source: $source" }
  $target = Join-Path $stage $item.To
  New-Item -ItemType Directory -Force -Path (Split-Path -Parent $target) | Out-Null
  Copy-Item -LiteralPath $source -Destination $target -Recurse -Force
}

$productZip = Join-Path $dist "codex-self-review-kit-v$Version.zip"
Compress-Archive -Path (Join-Path $stage "*") -DestinationPath $productZip -CompressionLevel Optimal

$sampleStage = Join-Path $dist "free-sample"
New-Item -ItemType Directory -Force -Path $sampleStage | Out-Null
Copy-Item (Join-Path $root "free-sample\*") $sampleStage -Recurse -Force
Copy-Item (Join-Path $root "templates\pr-review-prompt.md") (Join-Path $sampleStage "pr-review-prompt.md") -Force
$sampleZip = Join-Path $downloads "codex-review-free-sample.zip"
if (Test-Path -LiteralPath $sampleZip) { Remove-Item -LiteralPath $sampleZip -Force }
Compress-Archive -Path (Join-Path $sampleStage "*") -DestinationPath $sampleZip -CompressionLevel Optimal

Write-Host "Product: $productZip"
Write-Host "Free sample: $sampleZip"
