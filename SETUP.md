# Set up this project

This repo was created from the Agent-Zero template. These steps turn it into the user's project.
They are written for a coding agent, but a person can follow them by hand.

## 1. Ask

Ask the user these questions together, in one message:

1. What is the project's name?
2. What does it do, in one or two sentences?
3. How do you build, test and run it? ("Not yet" is a fine answer.)
4. Will you run agents in an sbx sandbox? If so, which build output folders does the project
   write that tooling can't relocate, such as `dist` or `build`?
5. Which issue templates do you want: task, bug report, feature request? (Default: all three.)
6. Which license, and whose name goes on the copyright line? (Default: MIT. Answer "none" for a
   private project.)

## 2. Rewrite the project files

- **`README.md`**: replace the whole file with the project's name as the title and its
  description. Add build, test and run commands if the user gave them.
- **`CLAUDE.md`**: replace the title and the paragraph under it with the project's name and
  description. If the user gave commands, add a `## Commands` section after that paragraph,
  listing them. Leave every other section as it is.
- **`LICENSE`**: for MIT, set the copyright line to the current year and the name the user gave.
  For another license, replace the file with that license's standard text. For none, delete it.

## 3. Sandbox

**If the user runs sbx:** set `EXTRA_BIND_DIRS` at the top of `scripts/sandbox-dev-setup.sh` to
the folders they named, for example `EXTRA_BIND_DIRS=(dist)`.

**If not:** remove the sandbox setup:

- Delete `scripts/sandbox-dev-setup.sh`.
- Delete the `SessionStart` hook from `.claude/settings.json`. Keep the `UserPromptSubmit` hook.
- Delete the `## Sandbox builds` section from `CLAUDE.md`.
- Delete the `.sandbox-linux/` entry and its comment from `.gitignore`.

## 4. Issue templates

Delete the templates in `.github/ISSUE_TEMPLATE/` if the user doesn't want. If `bug_report.md`
stays, adapt its `Environment` fields to the project (for example browser for a web app, or
runtime version for a library).

## 5. Finish

1. Search the repo for "Agent-Zero" and fix anything left over, outside `docs/adr/`.
2. Delete this file.
3. Show the user a short summary of what changed, and suggest committing it as
   `first commit`.
