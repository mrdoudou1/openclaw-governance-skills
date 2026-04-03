---
name: memflow
description: Govern memory placement and memory hygiene for OpenClaw workspace sessions. Use when deciding whether information belongs in daily notes, MEMORY.md, topical docs, transcripts, archive, or nowhere; when compressing old notes; when current facts conflict with older memory; or when the user asks to remember, organize, promote, deduplicate, or clean memory.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - memory_search
  - memory_get
when_to_use: Use when the request is about remembering something, organizing memory, promoting or deduplicating notes, deciding whether something belongs in daily memory vs long-term memory vs a topical file, or resolving conflicts between older notes and newer verified facts. Example triggers: "remember this", "整理一下记忆", "别写进 MEMORY.md", "把旧记忆压缩一下", "这个该记到哪里".
argument-hint: "[store|promote|compress|dedupe|resolve] [scope]"
arguments:
  - action
  - scope
---

# memflow

Decide where information should live before writing it down.

Read `references/placement-rules.md` when the placement decision is subtle, conflicted, or spans multiple memory layers. Use `scripts/memory_decision_template.sh` when you want a fast reusable memory-decision template.

## Inputs
- `$action`: optional memory action such as `store`, `promote`, `compress`, `dedupe`, or `resolve`
- `$scope`: optional target such as a note range, topic, or memory layer

## Goal
Keep memory useful across sessions without polluting long-term memory.

## Steps

### 1. Classify the information
Decide whether the content is stable, temporary, domain-specific, historical, or not worth storing.

**Success criteria**
- The content has a clear tentative destination or is explicitly left unstored.

### 2. Choose the narrowest durable home
Prefer the smallest memory layer that preserves future usefulness.

**Success criteria**
- The chosen destination is one of: daily note, `MEMORY.md`, topical doc, archive, or no storage.

### 3. Resolve conflicts before writing
If older notes disagree with newer evidence, update toward the current verified fact and avoid leaving contradictory long-term memory behind.

**Success criteria**
- No unresolved contradiction remains in the final memory location.

### 4. Compress if needed
Turn process-heavy notes into conclusions, merge duplicates, and keep only the minimum context needed for future recovery.

**Success criteria**
- The stored result is shorter, clearer, and still useful.

## Rules
- Do not default everything into `MEMORY.md`.
- Daily notes are for process; `MEMORY.md` is for durable truth.
- Prefer current verified facts over old notes.
- If unsure, store narrowly first and promote later.

## Output style
Report only:
- what was stored
- where it was stored
- why that location was chosen
