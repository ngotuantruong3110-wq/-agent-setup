# Agent Setup

One-command setup and Windows sign-in updates for Antigravity and Codex. The repository stores installation scripts only, not credentials.

## Install on each Windows computer

Open PowerShell and run:

```powershell
irm https://raw.githubusercontent.com/ngotuantruong3110-wq/-agent-setup/main/quick-setup.ps1 | iex
```

Install Antigravity first. The script installs uv if needed, installs or refreshes Superpowers, Ponytail, and Graphify, then registers a per-user sign-in task. If Codex CLI is unavailable, install its plugins from the Codex app.

## After setup

At each Windows sign-in, a background task downloads the latest setup files and refreshes the installed tools. Logs are saved to `%LOCALAPPDATA%\AgentSetup\sync.log`. Run the one-line command again to install or refresh immediately.

GitHub sign-in alone does not install software. VS Code has its own built-in Settings Sync for settings and extensions. Never commit API keys, access tokens, or passwords here.

## Upstream projects

- [Graphify](https://github.com/Graphify-Labs/graphify)
- [Superpowers](https://github.com/obra/superpowers)
- [Ponytail](https://github.com/DietrichGebert/ponytail)
