$ErrorActionPreference = "Stop"

$requiredCommands = @("agy", "codex", "uv")
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

Write-Host "Installing or refreshing Codex plugins..."
codex plugin marketplace add obra/superpowers-marketplace
codex plugin install superpowers@superpowers-marketplace
codex plugin marketplace add DietrichGebert/ponytail
codex plugin add ponytail@ponytail

Write-Host "Registering Graphify for Codex..."
graphify install --platform codex

Write-Host "Setup complete. Restart Antigravity and Codex, then check their plugin and skill lists."
