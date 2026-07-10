param(
    [Parameter(Mandatory = $true)]
    [string] $TargetRepo,

    [switch] $Force,

    [switch] $WhatIfOnly
)

$ErrorActionPreference = "Stop"

$sourceRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot "..")).Path
$targetRoot = Resolve-Path -LiteralPath $TargetRepo

$requiredSourceFiles = @(
    ".github/workflows/codex-pr-review.yml",
    ".github/workflows/codex-weekly-tech-debt.yml",
    ".github/codex/prompts/pr-review.md",
    ".github/codex/prompts/weekly-tech-debt.md",
    "docs/troubleshooting.md",
    "docs/cost-and-security.md",
    "scripts/trigger-codex-review-test.ps1"
)

foreach ($relativePath in $requiredSourceFiles) {
    $sourcePath = Join-Path $sourceRoot $relativePath
    if (-not (Test-Path -LiteralPath $sourcePath)) {
        throw "Missing source file: $sourcePath"
    }
}

$gitDir = Join-Path $targetRoot ".git"
if (-not (Test-Path -LiteralPath $gitDir)) {
    throw "Target path is not a Git repository: $targetRoot"
}

foreach ($relativePath in $requiredSourceFiles) {
    $sourcePath = Join-Path $sourceRoot $relativePath
    $targetPath = Join-Path $targetRoot $relativePath
    $targetDir = Split-Path -Parent $targetPath

    if ((Test-Path -LiteralPath $targetPath) -and -not $Force) {
        Write-Host "skip existing $relativePath"
        continue
    }

    if ($WhatIfOnly) {
        Write-Host "would copy $relativePath"
        continue
    }

    New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
    Copy-Item -LiteralPath $sourcePath -Destination $targetPath -Force:$Force
    Write-Host "copied $relativePath"
}

Write-Host ""
Write-Host "Next steps:"
Write-Host "1. Add OPENAI_API_KEY to the target repository's GitHub Actions secrets."
Write-Host "2. Open a test pull request to trigger Codex PR Review."
Write-Host "3. Run Codex Weekly Tech Debt Report manually from GitHub Actions before enabling the schedule."
