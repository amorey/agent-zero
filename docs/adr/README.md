# Architecture Decision Records

An ADR captures **why** a design is the way it is: the forces, the alternatives rejected, and what
the decision costs us. `CLAUDE.md` captures **what is true now** — invariants, conventions,
commands, traps. Keeping those jobs apart is the whole point: rationale is read once, current state
is read on every task.

Rule of thumb: if a paragraph in `CLAUDE.md` explains *why* rather than *what*, or lists an option
we didn't take, it belongs here.

## Filenames

```
docs/adr/YYYY-MM-DD-short-slug.md
```

The date is when the ADR was **written** (for a decision made earlier, that's the day it was written
down — note the approximate original date in the body). Several ADRs can share a date. There is one
flat sequence for the whole repo, with no per-area directories. Scope is a frontmatter field
instead, so the index below can still be filtered by area.

## Referencing an ADR

Link by path, name it by slug, never by date alone:

```markdown
→ [ADR: store sessions in Redis](docs/adr/2026-01-15-store-sessions-in-redis.md)
```

## Status

- **Accepted** — in force. This is the only status `CLAUDE.md` may link to.
- **Superseded by [<slug>](<path>)** — kept for the record. Nothing outside `docs/adr/` links here.

Superseding is a normal change, not a failure. Write a new ADR, flip the old one's status, and
**update every `CLAUDE.md` link in the same commit** — a live doc pointing at a superseded ADR is
the one way this system rots.

**A later ADR may replace part of an accepted one.** The newer names what it replaces, the older
keeps its status — the rest of it is still in force, so `CLAUDE.md` may still link it — and gains
an `amended_by` frontmatter pointer, so a reader of the older one is not left believing a paragraph
that has been answered. Adding that pointer is a metadata edit, the same class as flipping a status;
the decision itself is never rewritten. When the whole decision goes, it is an ordinary supersede.

**A removed component's ADRs are deleted, not superseded.** Superseding says "we decided
differently"; removing a component ahead of a rebuild has decided nothing yet, and a Superseded
entry with no successor to point at is worse than no entry. Remove the files, their index rows, and
every inbound link in the same commit — git history keeps them — and write the replacements as the
new design lands. Superseding remains the rule everywhere else.

## Exemption from the "describe the present" rule

The writing standards in `CLAUDE.md` say code comments and docs describe the current design, not
its history or the alternatives rejected. **`docs/adr/` is the sole exemption.** ADRs are an
append-only historical log; recording what we rejected, what we replaced, and what we believed at
the time is their function. Edit an accepted ADR only to fix errors or flip its status — do not
rewrite its decision to match later reality. Write a new one.
A path or package name the code has moved from is updated in place: that is a fix, not a rewrite.

## Writing one

Copy [`TEMPLATE.md`](TEMPLATE.md). Keep it to a page. Prose over bullets where the reasoning is a
chain; the "Alternatives considered" section is not optional — an ADR with no rejected option is
usually just documentation in the wrong place.

## Index

| Date | ADR | Scope | Status |
| --- | --- | --- | --- |
