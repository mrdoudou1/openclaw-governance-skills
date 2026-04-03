---
name: handoff
description: "Session handoff and recovery governance for OpenClaw. Use when preparing to compact context, start a new session, pause work, end a long task, leave a recovery point, or hand ongoing work to a future session. Helps capture current goal, done state, next step, memory updates, and minimum restart context."
allowed-tools:
  - Read
  - Write
  - Edit
  - memory_search
  - memory_get
when_to_use: "Use when work is about to pause, a long task needs a restart point, context is getting too long, or a clean cross-session handoff is needed. Example triggers: '先收个尾', '帮我留个停点', '准备 /new', '压缩前整理一下', '下次继续'."
argument-hint: "[quick|full] [scope]"
arguments:
  - level
  - scope
---

# handoff

Leave work in a recoverable state.

Read `references/restart-note-template.md` when writing a restart note or compact handoff summary. Use `scripts/restart_note_template.sh` when you want a fast reusable handoff template.

## Inputs
- `$level`: optional handoff depth such as `quick` or `full`
- `$scope`: optional task, project, or session scope

## Goal
Capture the minimum restart context needed for the next session to continue cleanly.

## Steps

### 1. Freeze the current state
Identify the active goal, current progress, and exact stop point.

**Success criteria**
- The current task state is clear enough to resume without rediscovery.

### 2. Separate durable memory from restart notes
Write temporary stop points to daily notes and only promote durable facts to long-term memory.

**Success criteria**
- Restart context is preserved without polluting `MEMORY.md`.

### 3. Leave the next exact action
Record the next file, command, question, or decision needed to resume.

**Success criteria**
- The future session has a concrete first step.

## Rules
- Prefer compact restart notes over long narratives.
- Do not dump full transcript history into long-term memory.
- Always include the next exact action.

## Output style
Summarize only:
- current objective
- done
- current state
- next exact action
- blockers or open questions
