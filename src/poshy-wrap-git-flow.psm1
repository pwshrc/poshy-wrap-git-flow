#!/usr/bin/env pwsh
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest


if (-not (Test-Command git-flow) -and (-not (Get-Variable -Name PWSHRC_FORCE_MODULES_EXPORT_UNSUPPORTED -Scope Global -ValueOnly -ErrorAction SilentlyContinue))) {
    return
}

[string] $git_bin = $null
if (Test-Command hub) {
    $git_bin = "hub"
} elseif (Test-Command git) {
    $git_bin = "git"
}

function Use-GitFlowBranchDevelop {
    & $git_bin checkout (git config gitflow.branch.develop) @args
}
Set-Alias -Name gcd -Value Use-GitFlowBranchDevelop
Export-ModuleMember -Function Use-GitFlowBranchDevelop -Alias gcd

function Use-GitFlowBranchHotfix {
    & $git_bin checkout (git config gitflow.prefix.hotfix) @args
}
Set-Alias -Name gch -Value Use-GitFlowBranchHotfix
Export-ModuleMember -Function Use-GitFlowBranchHotfix -Alias gch

function Use-GitFlowBranchRelease {
    & $git_bin checkout (git config gitflow.prefix.release) @args
}
Set-Alias -Name gcr -Value Use-GitFlowBranchRelease
Export-ModuleMember -Function Use-GitFlowBranchRelease -Alias gcr

function Invoke-GitFlow {
    & $git_bin flow @args
}
Set-Alias -Name gfl -Value Invoke-GitFlow
Export-ModuleMember -Function Invoke-GitFlow -Alias gfl

function Invoke-GitFlowFeature {
    & $git_bin flow feature @args
}
Set-Alias -Name gflf -Value Invoke-GitFlowFeature
Export-ModuleMember -Function Invoke-GitFlowFeature -Alias gflf

function Invoke-GitFlowFeatureFinish {
    & $git_bin flow feature finish @args
}
Set-Alias -Name gflff -Value Invoke-GitFlowFeatureFinish
Export-ModuleMember -Function Invoke-GitFlowFeatureFinish -Alias gflff

function Invoke-GitFlowFeatureFinishCurrent {
    # TODO: fix variable substitution.
    & $git_bin flow feature finish ${$(git_current_branch)#feature/} @args
}
Set-Alias -Name gflffc -Value Invoke-GitFlowFeatureFinishCurrent
Export-ModuleMember -Function Invoke-GitFlowFeatureFinishCurrent -Alias gflffc

function Invoke-GitFlowFeaturePublish {
    & $git_bin flow feature publish @args
}
Set-Alias -Name gflfp -Value Invoke-GitFlowFeaturePublish
Export-ModuleMember -Function Invoke-GitFlowFeaturePublish -Alias gflfp

function Invoke-GitFlowFeaturePublishCurrent {
    # TODO: fix variable substitution.
    & $git_bin flow feature publish ${$(git_current_branch)#feature/} @args
}
Set-Alias -Name gflfpc -Value Invoke-GitFlowFeaturePublishCurrent
Export-ModuleMember -Function Invoke-GitFlowFeaturePublishCurrent -Alias gflfpc

function Invoke-GitFlowFeaturePull {
    & $git_bin flow feature pull @args
}
Set-Alias -Name gflfpll -Value Invoke-GitFlowFeaturePull
Export-ModuleMember -Function Invoke-GitFlowFeaturePull -Alias gflfpll

function Invoke-GitFlowFeatureStart {
    & $git_bin flow feature start @args
}
Set-Alias -Name gflfs -Value Invoke-GitFlowFeatureStart
Export-ModuleMember -Function Invoke-GitFlowFeatureStart -Alias gflfs

function Invoke-GitFlowHotfix {
    & $git_bin flow hotfix @args
}
Set-Alias -Name gflh -Value Invoke-GitFlowHotfix
Export-ModuleMember -Function Invoke-GitFlowHotfix -Alias gflh

function Invoke-GitFlowHotfixFinish {
    & $git_bin flow hotfix finish @args
}
Set-Alias -Name gflhf -Value Invoke-GitFlowHotfixFinish
Export-ModuleMember -Function Invoke-GitFlowHotfixFinish -Alias gflhf

function Invoke-GitFlowHotfixFinishCurrent {
    # TODO: fix variable substitution.
    & $git_bin flow hotfix finish ${$(git_current_branch)#hotfix/} @args
}
Set-Alias -Name gflhfc -Value Invoke-GitFlowHotfixFinishCurrent
Export-ModuleMember -Function Invoke-GitFlowHotfixFinishCurrent -Alias gflhfc

function Invoke-GitFlowHotfixPublish {
    & $git_bin flow hotfix publish @args
}
Set-Alias -Name gflhp -Value Invoke-GitFlowHotfixPublish
Export-ModuleMember -Function Invoke-GitFlowHotfixPublish -Alias gflhp

function Invoke-GitFlowHotfixPublishCurrent {
    # TODO: fix variable substitution.
    & $git_bin flow hotfix publish ${$(git_current_branch)#hotfix/} @args
}
Set-Alias -Name gflhpc -Value Invoke-GitFlowHotfixPublishCurrent
Export-ModuleMember -Function Invoke-GitFlowHotfixPublishCurrent -Alias gflhpc

function Invoke-GitFlowHotfixStart {
    & $git_bin flow hotfix start @args
}
Set-Alias -Name gflhs -Value Invoke-GitFlowHotfixStart
Export-ModuleMember -Function Invoke-GitFlowHotfixStart -Alias gflhs

function Invoke-GitFlowInit {
    & $git_bin flow init @args
}
Set-Alias -Name gfli -Value Invoke-GitFlowInit
Export-ModuleMember -Function Invoke-GitFlowInit -Alias gfli

function Invoke-GitFlowRelease {
    & $git_bin flow release @args
}
Set-Alias -Name gflr -Value Invoke-GitFlowRelease
Export-ModuleMember -Function Invoke-GitFlowRelease -Alias gflr

function Invoke-GitFlowReleaseFinish {
    & $git_bin flow release finish @args
}
Set-Alias -Name gflrf -Value Invoke-GitFlowReleaseFinish
Export-ModuleMember -Function Invoke-GitFlowReleaseFinish -Alias gflrf

function Invoke-GitFlowReleaseFinishCurrent {
    # TODO: fix variable substitution.
    & $git_bin flow release finish ${$(git_current_branch)#release/} @args
}
Set-Alias -Name gflrfc -Value Invoke-GitFlowReleaseFinishCurrent
Export-ModuleMember -Function Invoke-GitFlowReleaseFinishCurrent -Alias gflrfc

function Invoke-GitFlowReleasePublish {
    & $git_bin flow release publish @args
}
Set-Alias -Name gflrp -Value Invoke-GitFlowReleasePublish
Export-ModuleMember -Function Invoke-GitFlowReleasePublish -Alias gflrp

function Invoke-GitFlowReleasePublishCurrent {
    # TODO: fix variable substitution.
    & $git_bin flow release publish ${$(git_current_branch)#release/} @args
}
Set-Alias -Name gflrpc -Value Invoke-GitFlowReleasePublishCurrent
Export-ModuleMember -Function Invoke-GitFlowReleasePublishCurrent -Alias gflrpc

function Invoke-GitFlowReleaseStart {
    & $git_bin flow release start @args
}
Set-Alias -Name gflrs -Value Invoke-GitFlowReleaseStart
Export-ModuleMember -Function Invoke-GitFlowReleaseStart -Alias gflrs
