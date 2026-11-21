# Agent Setup

Shared setup instructions for Antigravity and Codex. This repository contains installer commands, not copies of the upstream projects or credentials.

## Install on Windows

Clone this repository, then run PowerShell:

```powershell
git clone https://github.com/ngotuantruong3110-wq/-agent-setup.git
cd -agent-setup
.\install.ps1
```

The installer expects Antigravity CLI (`agy`), Codex CLI (`codex`), and Astral uv (`uv`) to be installed and available on PATH. It installs or refreshes Superpowers, Ponytail, and Graphify for both agents.

## Updating

Run `git pull` in this repository and run `.\install.ps1` again on each computer. The installer asks each upstream tool to install or upgrade its latest version. Signing into GitHub by itself does not install tools or sync their local plugin files.

## Upstream projects

- [Graphify](https://github.com/Graphify-Labs/graphify)
- [Superpowers](https://github.com/obra/superpowers)
- [Ponytail](https://github.com/DietrichGebert/ponytail)

Never commit API keys, access tokens, or passwords here.
