[CmdletBinding()]
param(
    [string] $TargetBranch
)

$ErrorActionPreference = "Stop"
if (Get-Variable -Name PSNativeCommandUseErrorActionPreference -ErrorAction SilentlyContinue) {
    $PSNativeCommandUseErrorActionPreference = $false
}

$branch = (git branch --show-current).Trim()
if (-not $branch) {
    throw "Run this from a named branch, not a detached HEAD."
}

if (-not $TargetBranch) {
    $TargetBranch = $branch
}

if ($branch -ne $TargetBranch) {
    throw "Run this from the $TargetBranch branch. Current branch: $branch"
}

$status = git status --short
if ($status) {
    throw "Working tree is not clean. Commit or stash changes before triggering a test run."
}

git fetch origin $TargetBranch
$localHead = (git rev-parse HEAD).Trim()
$remoteHead = (git rev-parse "origin/$TargetBranch").Trim()
if ($localHead -ne $remoteHead) {
    throw "Local branch is not exactly synced with origin/$TargetBranch. Refusing to push extra local history."
}

git commit --allow-empty -m "Trigger Codex PR review after billing update"
git push origin "HEAD:$TargetBranch"
if ($LASTEXITCODE -ne 0) {
    git reset --hard HEAD~1
    throw "Push failed. Rolled back the empty trigger commit so the helper can be retried."
}
git fetch origin $TargetBranch

function Get-ActionsUrlFromRemote {
    param([Parameter(Mandatory = $true)][string] $RemoteUrl)

    if ($RemoteUrl -match "^git@([^:]+):(.+?)(\.git)?$") {
        return "https://$($Matches[1])/$($Matches[2] -replace '\.git$', '')/actions"
    }

    if ($RemoteUrl -match "^ssh://git@([^/]+)/(.+?)(\.git)?$") {
        return "https://$($Matches[1])/$($Matches[2] -replace '\.git$', '')/actions"
    }

    if ($RemoteUrl -match "^https?://([^/]+)/(.+?)(\.git)?$") {
        return "https://$($Matches[1])/$($Matches[2] -replace '\.git$', '')/actions"
    }

    return $null
}

$originUrl = (git remote get-url origin).Trim()
$actionsUrl = Get-ActionsUrlFromRemote -RemoteUrl $originUrl

Write-Host ""
Write-Host "Triggered Codex PR Review on the open test PR."
if ($actionsUrl) {
    Write-Host "Check: $actionsUrl"
} else {
    Write-Host "Check the Actions page for remote: $originUrl"
}
