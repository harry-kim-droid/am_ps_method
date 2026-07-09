$ErrorActionPreference = "Stop"

$branch = (git branch --show-current).Trim()
if ($branch -ne "codex/test-pr-workflow") {
    throw "Run this from the codex/test-pr-workflow branch. Current branch: $branch"
}

$status = git status --short
if ($status) {
    throw "Working tree is not clean. Commit or stash changes before triggering a test run."
}

git fetch origin codex/test-pr-workflow
$localHead = (git rev-parse HEAD).Trim()
$remoteHead = (git rev-parse origin/codex/test-pr-workflow).Trim()
if ($localHead -ne $remoteHead) {
    throw "Local branch is not exactly synced with origin/codex/test-pr-workflow. Refusing to push extra local history."
}

git commit --allow-empty -m "Trigger Codex PR review after billing update"
git push origin HEAD:codex/test-pr-workflow

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
