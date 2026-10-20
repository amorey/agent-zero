# Agent-Zero

*A starter template for AI-native coding projects*

<img width="300" alt="agent-zero" src="https://github.com/user-attachments/assets/334a7310-94ef-475e-ba9c-561666fcc43b" />

## Introduction

**Agent-Zero** is a minimal, *slightly* opinionated GitHub template that you can use when you're starting a new coding project. It provides the basic structure that I've used for projects that required high-quality agentic coding output (e.g. [kstack](https://github.com/kstackhq/kstack), [gochan](https://github.com/amorey/gochan), [gobus](https://github.com/amorey/gobus), [beehive](https://github.com/amorey/beehive)). The goal is to nudge agents to produce concise, idiomatic code using a simple CLAUDE.md file and to help them get stuff done inside a sandbox ([`sbx`](https://docs.docker.com/ai/sandboxes/)) and on GitHub (e.g. commits and PRs). All of the instructions and template files are easy to understand and can be customized by hand or with the help of an AI agent so you stay in control of the output at all times. I've had the best luck using this template with Opus and Fable-class agents thought Sonnet-class works too but requires more human supervision.

## What you get

<dl>
  <dt><code>SETUP.md</code></dt>
  <dd>A set of instructions for an agent to configure the template for a new project. The agent is instructed to delete the file after the setup is finished.</dd>

  <dt><code>CLAUDE.md</code></dt>
  <dd>Project instructions for coding agents: writing standards, and conventions for commits, pull requests and issues. `AGENTS.md` points other agents to it.</dd>

  <dt><code>scripts/writing-standards-hook.sh</code></dt>
  <dd>A short script that restates the writing standards on every prompt (~100 tokens), so they hold in long sessions. Requires `jq`.</dd>

  <dt><code>scripts/sandbox-dev-setup.sh</code></dt>
  <dd>A script that that agents run at the beginning of a session to keep Linux build output inside an `sbx` sandbox from colliding with the host's. It does nothing outside a sandbox or in clone mode.</dd>

  <dt><code>docs/adr/</code></dt>
  <dd>A directory to store Architectural Decision Records (ADRs) which hold the <em>why</em> behind designs, so `CLAUDE.md` can stay about the <em>what</em>.</dd>

  <dt><code>.github/pull_request_template.md</code></dt>
  <dd>A simple pull request template that contributors and agents can use to describe PRs in an easy-to-understand way.</dd>

  <dt><code>.github/ISSUE_TEMPLATE/{bug_report,feature_request,task}.md</code></dt>
  <dd>Simple templates for GitHub Issues that contributors and agents can use when opening new issues.</dd>
</dl>

## Using it

1. Click **Use this template** on GitHub, and clone the new repo.
2. Open it with your coding agent and say:
    ```console
    ───────────────────────────────────────────
    ❯ follow SETUP.md
    ───────────────────────────────────────────
    ```

The agent asks a few questions, then sets up the README, `CLAUDE.md`, the sandbox script and the issue templates for your project. `SETUP.md` deletes itself when done. You can also follow it by hand.

## Acknowledgments

- This template was built for [Kstack](https://github.com/kstackhq/kstack) - an AI-native monitoring and troubleshooting tool for Kubernetes

Made with 🧿 in Istanbul
