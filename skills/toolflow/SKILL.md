---
name: toolflow
description: "Tool selection governance for OpenClaw. Use when choosing between memory search, file reads, web fetch/search, browser automation, background tasks, subagents, or direct edits; when deciding whether to do a light read first; and when a task would benefit from a clear tool route instead of ad-hoc tool usage."
allowed-tools:
  - Read
  - Glob
  - Grep
  - memory_search
  - memory_get
  - web_fetch
  - web_search
  - sessions_spawn
when_to_use: "Use when a task has multiple viable tool routes and the assistant should choose the lightest effective one instead of improvising. Example triggers: '先别开重工具', '怎么选工具更合适', '这个要不要开子会话', '先搜还是先读文件', '给我走最轻路线'."
argument-hint: "[lightest|balanced|power] [task]"
arguments:
  - route
  - task
---

# toolflow

Choose the lightest effective tool path.

Read `references/selection-rules.md` when choosing between search, reads, browser automation, or agent-based execution.

## Inputs
- `$route`: optional bias such as `lightest`, `balanced`, or `power`
- `$task`: optional task or target scope

## Goal
Select the least heavy tool route that can still solve the actual problem.

## Steps

### 1. Choose the initial tool route
Pick the cheapest likely-success path first.

**Success criteria**
- The first tool choice is justified by the task, not habit.

### 2. Escalate only when needed
Move from light tools to heavier tools only after the lighter path stops being enough.

**Success criteria**
- Tool escalation is deliberate and explainable.

### 3. Keep route clarity
Be able to explain why this path was chosen over alternatives.

**Success criteria**
- The chosen route is understandable and reproducible.

## Rules
- Do not start with the heaviest tool by default.
- Prefer search before broad reads.
- Prefer direct edits for simple fixes.
- Prefer dedicated coding paths only for long or complex implementation work.
