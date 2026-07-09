$ErrorActionPreference = "Stop"

$branch = (git branch --show-current).Trim()
if ($branch -ne "codex/test-pr-workflow") {
    throw "Run this from the codex/test-pr-workflow branch. Current branch: $branch"
}

$status = git status --short
if ($status) {
    throw "Working tree is not clean. Commit or stash changes before triggering a test run."
}

git commit --allow-empty -m "Trigger Codex PR review after billing update"
git push origin HEAD:codex/test-pr-workflow

$originUrl = (git remote get-url origin).Trim()
$repoSlug = $originUrl
if ($repoSlug -match "github\.com[:/](.+?)(\.git)?$") {
    $repoSlug = $Matches[1] -replace "\.git$", ""
}

Write-Host ""
Write-Host "Triggered Codex PR Review on the open test PR."
Write-Host "Check: https://github.com/$repoSlug/actions"
