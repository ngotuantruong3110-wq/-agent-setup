# Agent Setup

Shared setup instructions for Antigravity and Codex. This repository stores installer scripts and setup notes, not credentials or copies of upstream projects.

## First setup on each Windows computer

Install Git, Antigravity CLI (`agy`), Codex CLI (`codex`), and Astral uv (`uv`). Clone this repository, then run PowerShell:

```powershell
git clone https://github.com/ngotuantruong3110-wq/-agent-setup.git
cd -agent-setup
.\install.ps1
.\enable-login-sync.ps1
```

The first script installs or refreshes Superpowers, Ponytail, and Graphify. The second registers a per-user Windows logon task.

## After setup

At each Windows sign-in, the task pulls the latest setup files from this repository, refreshes Antigravity plugins and Graphify, and refreshes Codex plugin marketplaces. The log is saved at `%LOCALAPPDATA%\AgentSetup\sync.log`.

Run `git pull` and `.\install.ps1` manually after changing prerequisites or adding a new tool. Set up the task once on every computer. Signing in to GitHub alone cannot install local software. VS Code has separate built-in Settings Sync for its settings and extensions.

## Upstream projects

- [Graphify](https://github.com/Graphify-Labs/graphify)
- [Superpowers](https://github.com/obra/superpowers)
- [Ponytail](https://github.com/DietrichGebert/ponytail)

Never commit API keys, access tokens, or passwords here.
