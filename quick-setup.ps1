$ErrorActionPreference = "Stop"
$repoUrl = "https://github.com/ngotuantruong3110-wq/-agent-setup/archive/refs/heads/main.zip"
$repoRoot = Join-Path $env:USERPROFILE "agent-setup"
$tempRoot = Join-Path $env:TEMP "agent-setup-bootstrap"
$zipPath = Join-Path $env:TEMP "agent-setup.zip"

if (-not (Get-Command agy -ErrorAction SilentlyContinue)) {
    throw "Install Antigravity first so the agy command is available, then rerun this command."
}

if (-not (Get-Command uv -ErrorAction SilentlyContinue)) {
    Invoke-RestMethod https://astral.sh/uv/install.ps1 | Invoke-Expression
    $env:Path = "$env:USERPROFILE\.local\bin;$env:USERPROFILE\.cargo\bin;$env:Path"
}

if (Test-Path -LiteralPath $tempRoot) {
    Remove-Item -LiteralPath $tempRoot -Recurse -Force
}
New-Item -ItemType Directory -Force -Path $tempRoot | Out-Null
Invoke-WebRequest -Uri $repoUrl -OutFile $zipPath
Expand-Archive -LiteralPath $zipPath -DestinationPath $tempRoot -Force
$sourceRoot = Get-ChildItem -LiteralPath $tempRoot -Directory | Select-Object -First 1

New-Item -ItemType Directory -Force -Path $repoRoot | Out-Null
Copy-Item -Path (Join-Path $sourceRoot.FullName "*") -Destination $repoRoot -Recurse -Force

& (Join-Path $repoRoot "install.ps1")
& (Join-Path $repoRoot "enable-login-sync.ps1")
Write-Host "Setup complete. Future sign-ins will sync automatically."
