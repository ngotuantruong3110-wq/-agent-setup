$ErrorActionPreference = "Stop"
$repoRoot = $PSScriptRoot
$logDirectory = Join-Path $env:LOCALAPPDATA "AgentSetup"
$logPath = Join-Path $logDirectory "sync.log"
$tempRoot = Join-Path $env:TEMP "agent-setup-sync"
$zipPath = Join-Path $env:TEMP "agent-setup-sync.zip"
$repoUrl = "https://github.com/ngotuantruong3110-wq/-agent-setup/archive/refs/heads/main.zip"

New-Item -ItemType Directory -Force -Path $logDirectory | Out-Null
Start-Transcript -Path $logPath -Append | Out-Null

try {
    if (Test-Path -LiteralPath $tempRoot) {
        Remove-Item -LiteralPath $tempRoot -Recurse -Force
    }
    New-Item -ItemType Directory -Force -Path $tempRoot | Out-Null
    Invoke-WebRequest -Uri $repoUrl -OutFile $zipPath
    Expand-Archive -LiteralPath $zipPath -DestinationPath $tempRoot -Force
    $sourceRoot = Get-ChildItem -LiteralPath $tempRoot -Directory | Select-Object -First 1
    Copy-Item -Path (Join-Path $sourceRoot.FullName "*") -Destination $repoRoot -Recurse -Force

    if (Get-Command agy -ErrorAction SilentlyContinue) {
        agy plugin install https://github.com/obra/superpowers
        agy plugin install https://github.com/DietrichGebert/ponytail
    }

    if ((Get-Command uv -ErrorAction SilentlyContinue) -and (Get-Command graphify -ErrorAction SilentlyContinue)) {
        uv tool install --upgrade graphifyy
        graphify antigravity install
        graphify install --platform codex
    }

    if (Get-Command codex -ErrorAction SilentlyContinue) {
        codex plugin marketplace upgrade
    }
}
finally {
    Stop-Transcript | Out-Null
}
