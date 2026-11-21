$ErrorActionPreference = "Stop"
$repoRoot = $PSScriptRoot
$logDirectory = Join-Path $env:LOCALAPPDATA "AgentSetup"
$logPath = Join-Path $logDirectory "sync.log"

New-Item -ItemType Directory -Force -Path $logDirectory | Out-Null
Start-Transcript -Path $logPath -Append | Out-Null

try {
    git -C $repoRoot pull --ff-only

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
