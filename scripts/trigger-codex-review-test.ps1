[CmdletBinding()]
param(
    [string] $TargetBranch,
    [switch] $AllowProtectedBranch
)

$ErrorActionPreference = "Stop"
if (Get-Variable -Name PSNativeCommandUseErrorActionPreference -ErrorAction SilentlyContinue) {
    $PSNativeCommandUseErrorActionPreference = $false
}

function Invoke-Git {
    param([Parameter(ValueFromRemainingArguments = $true)][string[]] $Arguments)

    & git @Arguments
    if ($LASTEXITCODE -ne 0) {
        throw "git $($Arguments -join ' ') failed."
    }
}

function Invoke-GitOutput {
    param([Parameter(ValueFromRemainingArguments = $true)][string[]] $Arguments)

    $output = & git @Arguments
    if ($LASTEXITCODE -ne 0) {
        throw "git $($Arguments -join ' ') failed."
    }
    return ($output | Out-String).Trim()
}

$branch = Invoke-GitOutput branch --show-current
if (-not $branch) {
    throw "Run this from a named branch, not a detached HEAD."
}

if (-not $TargetBranch) {
    $TargetBranch = $branch
}

if ($branch -ne $TargetBranch) {
    throw "Run this from the $TargetBranch branch. Current branch: $branch"
}

$protectedBranches = @("main", "master", "production", "prod", "release")
if (-not $AllowProtectedBranch -and $protectedBranches -contains $TargetBranch) {
    throw "Refusing to create a trigger commit on protected branch '$TargetBranch'. Check out a test PR branch, or pass -AllowProtectedBranch if this is intentional."
}

$status = Invoke-GitOutput status --short
if ($status) {
    throw "Working tree is not clean. Commit or stash changes before triggering a test run."
}

Invoke-Git fetch origin $TargetBranch
$localHead = Invoke-GitOutput rev-parse HEAD
$remoteHead = Invoke-GitOutput rev-parse "origin/$TargetBranch"
if ($localHead -ne $remoteHead) {
    throw "Local branch is not exactly synced with origin/$TargetBranch. Refusing to push extra local history."
}

Invoke-Git commit --allow-empty -m "Trigger Codex PR review after billing update"
git push origin "HEAD:$TargetBranch"
if ($LASTEXITCODE -ne 0) {
    Invoke-Git reset --hard HEAD~1
    throw "Push failed. Rolled back the empty trigger commit so the helper can be retried."
}
Invoke-Git fetch origin $TargetBranch

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

$originUrl = Invoke-GitOutput remote get-url origin
$actionsUrl = Get-ActionsUrlFromRemote -RemoteUrl $originUrl

Write-Host ""
Write-Host "Triggered Codex PR Review on the open test PR."
if ($actionsUrl) {
    Write-Host "Check: $actionsUrl"
} else {
    Write-Host "Check the Actions page for remote: $originUrl"
}
