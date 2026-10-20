# Agent-Zero

A GitHub template for starting AI-native projects.

## What you get

- **`CLAUDE.md`** — project instructions for coding agents: writing standards, and conventions for commits, pull requests and issues. `AGENTS.md` points other agents to it.
- **Writing-standards hook** — `scripts/writing-standards-hook.sh` restates the writing standards on every prompt, so they hold in long sessions. Wired in `.claude/settings.json`. Requires `jq`.
- **Sandbox build isolation** — `scripts/sandbox-dev-setup.sh` keeps Linux build output inside an sbx sandbox from colliding with the host's. It runs on session start and does nothing outside a sandbox or in clone mode.
- **Architecture decision records** — `docs/adr/` holds the *why* behind designs, so `CLAUDE.md` can stay about the *what*.
- **GitHub templates** — a pull request template and issue templates for tasks, bugs and feature requests.

## Using it

1. Click **Use this template** on GitHub, and clone the new repo.
2. Open it with your coding agent and say: **"Follow SETUP.md."**

The agent asks a few questions, then sets up the README, `CLAUDE.md`, the sandbox script and the issue templates for your project. `SETUP.md` deletes itself when done. You can also follow it by hand.

## Acknowledgments

- This template was built for [Kstack](https://github.com/kstackhq/kstack) - an AI-native monitoring and troubleshooting tool for Kubernetes

Made with 🧿 in Istanbul
