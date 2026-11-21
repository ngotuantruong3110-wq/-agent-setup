$ErrorActionPreference = "Stop"
$repoRoot = $PSScriptRoot
$syncScript = Join-Path $repoRoot "sync-at-login.ps1"
$taskName = "Agent Setup GitHub Sync"

if (-not (Test-Path -LiteralPath $syncScript)) {
    throw "Cannot find $syncScript. Clone the agent-setup repository first."
}
$powerShell = (Get-Process -Id $PID).Path
$argument = '-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File "' + $syncScript + '"'
$action = New-ScheduledTaskAction -Execute $powerShell -Argument $argument
$user = "$env:USERDOMAIN\$env:USERNAME"
$trigger = New-ScheduledTaskTrigger -AtLogOn -User $user
$principal = New-ScheduledTaskPrincipal -UserId $user -LogonType Interactive -RunLevel Limited
$settings = New-ScheduledTaskSettingsSet -StartWhenAvailable -MultipleInstances IgnoreNew

Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Principal $principal -Settings $settings -Description "Pull and update the agent setup tools at Windows sign-in." -Force | Out-Null
Write-Host "Automatic setup sync is enabled for this Windows account."
