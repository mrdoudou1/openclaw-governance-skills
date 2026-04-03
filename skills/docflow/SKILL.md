---
name: docflow
description: Workspace documentation governance for OpenClaw projects. Use when organizing docs/notes, separating README vs docs responsibilities, deciding what belongs in root docs vs per-project docs vs archive, reducing duplication, moving outdated notes, or creating navigable documentation structure.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
when_to_use: Use when the user asks to organize documentation, split README vs docs, clean duplicated notes, archive outdated material, or make project docs easier to navigate. Example triggers: "整理文档", "README 太乱了", "这些文档该怎么分层", "把旧文档归档", "帮我理一下 docs".
---

# docflow

Make workspace documentation easy to navigate and hard to rot.

## Document layers

### Root-level docs
Use for:
- entry points (what is this workspace?)
- global conventions
- links/indexes to sub-projects

Avoid storing deep technical dumps here.

### Project-level docs
Use for:
- project-specific setup
- architecture and runbooks
- API notes
- operational procedures

Prefer `docs/` within a project folder when content grows.

### Archive
Use for:
- superseded instructions
- historical debugging trails
- experiments that are no longer active

Archive should be searchable but not in the main path.

## README vs docs

- README: the front door
  - what it is
  - how to run
  - where the real docs live

- docs: the depth
  - detailed guides
  - troubleshooting
  - design notes

## What to fix first

When docs are messy, prioritize:
1) remove contradictions (pick current truth)
2) remove duplicates (single source of truth)
3) add an index (navigation)
4) move long content out of README into docs

## Typical actions

- Create a short README that links to:
  - docs index
  - config locations
  - common commands
- Split “how to run” vs “how it works”
- Move old logs into `archive/` or daily notes
- Add a small “Troubleshooting” section with the top 3 failures

## Output style

When doing doc governance, report:
- files moved/created/edited
- why the new structure is better
- any remaining ambiguity to confirm
