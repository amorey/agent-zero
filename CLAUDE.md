# Agent-Zero

A GitHub template for starting AI-native projects. If `SETUP.md` exists, this project has not been set up yet: offer to follow it before starting other work.

## Writing standards

Applies to every hand-written file. Not to generated output.

1. **Code — simple, idiomatic, easy for a human to follow.** Prefer the boring construction. Match the idiom of the file you are in over the one you would pick on a blank page. Cleverness that needs a comment to survive review is usually the wrong trade.
2. **Comments — terse, necessary, easy for a human to read.** Say what the code cannot: the *why*, the invariant, the trap that made this shape necessary. Never restate what the line already says. A comment justifying a choice the code no longer contains is dead weight — state the current design, don't argue against the alternatives you rejected (that is what `docs/adr/` is for).
3. **Documentation — simple, concise, easy for a human to read.** Lead with what is true now. One idea per sentence.

Watch for comments addressed to a *reviewer* rather than a reader opening the file cold; the tell is a comment that spends its length on the option **not** taken.

A `UserPromptSubmit` hook (`scripts/writing-standards-hook.sh`, wired in `.claude/settings.json`) restates this every turn. Keep its short form in sync with this section.

## Sandbox builds

Inside an sbx sandbox in direct mode, `scripts/sandbox-dev-setup.sh` runs on session start and keeps Linux build output apart from the host's. It bind-mounts `node_modules` and each folder in its `EXTRA_BIND_DIRS`, and moves the pnpm store, Cargo target and uv venv through `/etc/sandbox-persistent.sh`. Add any new build output folder that tooling can't relocate to `EXTRA_BIND_DIRS`.

## Commits, pull requests and issues

- **Commits are terse conventional commits**: `type(scope): subject` — `feat`/`fix`/`perf`/`refactor`/`test`/`docs`/`chore`, scope only when it adds information, `!` for breaking. Subject imperative, lower-case, no period, ≤72 chars, says what the change does (`feat(auth): refresh the session token before it expires`). No body unless the why isn't obvious — then 1–3 plain sentences, no bullets; longer rationale is an ADR the body links.
- **Pull requests follow [`.github/pull_request_template.md`](.github/pull_request_template.md)**: keep `Summary` (why), `Key Changes` (what), `Checklist`. The title is a natural, capitalized title (not a conventional-commit heading) led by the change type's emoji — 🎣 bug fix, 🐋 new feature, 📜 documentation, ✨ general improvement.
- **An issue describing work to be done follows [`.github/ISSUE_TEMPLATE/task.md`](.github/ISSUE_TEMPLATE/task.md)**: keep `Summary` and `Done when`. Title imperative, capitalized, no emoji. A bug not yet understood uses `bug_report.md`; a request with no plan, `feature_request.md`.
