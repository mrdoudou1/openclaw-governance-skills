---
name: ctxguard
description: Context hygiene and tool-heavy turn governance for OpenClaw. Use when a task is long-running, involves many tool calls, large files, multiple documents, or risks context bloat; when deciding memory_search vs memory_get; when deciding whether to read a whole file or sample; when preparing to compact/summarize context; or when you need to re-check the latest user message before finishing.
allowed-tools:
  - Read
  - Glob
  - Grep
  - web_fetch
  - web_search
  - memory_search
  - memory_get
when_to_use: Use when a task risks context bloat, involves large files or many tools, requires careful retrieval strategy, or needs an end-of-turn re-check of the latest user request. Example triggers: "别读太多", "先别全量看", "这个排查太长了", "帮我控一下上下文", "大文件先挑重点看".
argument-hint: "[light|normal|strict] [scope]"
arguments:
  - mode
  - scope
---

# ctxguard

Keep long turns safe, small, and correct.

Read `references/large-input-strategy.md` when dealing with large files, many attachments, or a long tool-heavy investigation.

## Inputs
- `$mode`: optional strictness level such as `light`, `normal`, or `strict`
- `$scope`: optional task area, file set, or investigation range

## Goal
Get the needed answer with the minimum context footprint that still preserves correctness.

## Steps

### 1. Choose the lightest retrieval path
Start with search, headings, structure, or sampled reads before full reads.

**Success criteria**
- The first pass gathers enough signal to decide whether deeper reading is needed.

### 2. Keep tool usage bounded
Batch related actions, avoid tight loops, and avoid redundant reads.

**Success criteria**
- Tool activity stays focused on the current question.

### 3. Re-check user intent before finishing
Look at the newest user message and verify the result still answers the actual request.

**Success criteria**
- The final answer matches the latest request, not an outdated intermediate goal.

### 4. Compact when needed
If the turn grows long, restate current goal, constraints, decisions, and next step in a smaller form.

**Success criteria**
- The remaining work can continue from a compact state.

## Rules
- Prefer targeted retrieval over whole-file loading.
- Use `memory_search` before `memory_get` for prior-work questions.
- Do not silently drift into unrelated file reads.
- Before finishing, re-check the newest user message.

## Output style
Use short operational updates:
- what is being checked
- what was found
- what changed
- what is still needed
