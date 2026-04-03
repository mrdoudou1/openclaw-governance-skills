---
name: taskview
description: "Multi-step task framing and progress reporting for OpenClaw work. Use when a request involves multiple phases, mixed tools, background tasks, or ongoing execution that benefits from clear status updates such as current goal, in-progress work, completed work, and next steps."
allowed-tools:
  - Read
when_to_use: "Use when work naturally spans multiple steps, tools, or phases and the assistant should keep a visible task state with current goal, progress, completed work, and next steps. Example triggers: '分步来', '这个任务有点多', '给我同步下进度', '你现在做到哪了', '一步步处理'."
argument-hint: "[simple|detailed] [task]"
arguments:
  - detail_level
  - task
---

# taskview

Turn messy work into a visible task state.

Read `references/status-template.md` when reporting progress for a long or multi-phase task. Use `scripts/status_template.sh` when you want a fast reusable status layout.

## Inputs
- `$detail_level`: optional reporting depth such as `simple` or `detailed`
- `$task`: optional task name or scope

## Goal
Keep multi-step work legible while it is happening.

## Steps

### 1. Establish the visible state
Restate the current goal and break the work into in-progress, done, and next.

**Success criteria**
- The task can be understood at a glance.

### 2. Update at useful boundaries
Report progress at meaningful step changes instead of every micro-action.

**Success criteria**
- The user stays oriented without being spammed.

### 3. Surface blockers early
If work is blocked, say what is blocked and what input is needed.

**Success criteria**
- The next decision or dependency is explicit.

## Rules
- Prefer visible progress over hidden long runs.
- Avoid noisy updates.
- Always make the next step clear.
