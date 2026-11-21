$ErrorActionPreference = "Stop"

$requiredCommands = @("agy", "uv")
foreach ($commandName in $requiredCommands) {
    if (-not (Get-Command $commandName -ErrorAction SilentlyContinue)) {
        throw "Required command '$commandName' is missing from PATH. Install it, reopen PowerShell, and run this script again."
    }
}

Write-Host "Installing or refreshing Antigravity plugins..."
agy plugin install https://github.com/obra/superpowers
agy plugin install https://github.com/DietrichGebert/ponytail

Write-Host "Installing or refreshing Graphify..."
uv tool install --upgrade graphifyy
graphify antigravity install
graphify install --platform codex

if (Get-Command codex -ErrorAction SilentlyContinue) {
    Write-Host "Installing or refreshing Codex plugins..."
    codex plugin marketplace add obra/superpowers-marketplace
    codex plugin install superpowers@superpowers-marketplace
    codex plugin marketplace add DietrichGebert/ponytail
    codex plugin add ponytail@ponytail
} else {
    Write-Host "Codex CLI is not installed. Install Codex plugins from the Codex app's Plugins page."
}

Write-Host "Setup complete. Restart Antigravity and Codex, then check their plugin and skill lists."
