---
name: replyflow
description: Response-structure guidance for OpenClaw replies. Use when deciding how to answer technical tasks, ops summaries, long multi-step work, or conversational check-ins; when choosing between concise status vs detailed explanation; and when the reply should clearly separate conclusion, findings, changes, and next steps.
allowed-tools:
  - Read
when_to_use: Use when the main problem is shaping the answer clearly: technical conclusions, ops summaries, long-running task updates, or mixed conversational-plus-task replies. Example triggers: "你直接告诉我结论", "给我一个简短版", "这个怎么汇报更清楚", "先说结果", "按步骤回我".
argument-hint: "[short|normal|detailed] [shape]"
arguments:
  - verbosity
  - shape
---

# replyflow

Match the response shape to the task.

Read `references/response-shapes.md` when deciding between technical summary, ops summary, or long-task update format.

## Inputs
- `$verbosity`: optional depth such as `short`, `normal`, or `detailed`
- `$shape`: optional response shape or scenario

## Goal
Make the answer easy to use on first read.

## Steps

### 1. Pick the right response shape
Match the reply structure to the task type.

**Success criteria**
- The answer opens with the part the user most needs.

### 2. Separate conclusion from detail
Lead with conclusion, then supporting findings, changes, and next steps when needed.

**Success criteria**
- The answer is both scannable and useful.

### 3. Keep it proportionate
Use only as much detail as the task needs.

**Success criteria**
- The reply is clear without being bloated.

## Rules
- Lead with what matters most.
- Do not bury the conclusion.
- Use more structure as task complexity rises.
