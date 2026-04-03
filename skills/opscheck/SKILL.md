---
name: opscheck
description: Operational health-check and server inspection workflow for OpenClaw environments. Use when checking machine health, diagnosing server state, reviewing ports/processes/services/containers, checking OpenClaw status, or producing a concise operational summary with risks and next steps.
allowed-tools:
  - Read
  - exec
when_to_use: Use when inspecting machine health, server state, resource pressure, OpenClaw runtime status, service listeners, or deployment health, especially when the user wants a concise ops-style summary. Example triggers: "巡检一下", "看下服务器状态", "查下资源占用", "openclaw 正常吗", "帮我体检一下机器".
argument-hint: "[quick|full] [target]"
arguments:
  - level
  - target
---

# opscheck

Inspect systems in a stable order and report clearly.

Read `references/checklist.md` when you need the default inspection order or output shape. Use `scripts/report_template.sh` when you want a fast reusable ops report structure.

## Inputs
- `$level`: optional depth such as `quick` or `full`
- `$target`: optional host, service, or runtime target

## Goal
Produce a concise operational summary that surfaces health, abnormalities, and next action.

## Steps

### 1. Check resource pressure
Inspect disk, memory, and cpu/load first.

**Success criteria**
- Major capacity pressure is either ruled out or clearly identified.

### 2. Check processes, services, and listeners
Inspect relevant services, ports, and workers for the target system.

**Success criteria**
- Runtime state is clear enough to explain whether the service is up and reachable.

### 3. Summarize risks and next step
Turn raw inspection results into a concise operational conclusion.

**Success criteria**
- The user can see the state, the main abnormal findings, and the next recommended move.

## Rules
- Prefer concise conclusions over raw dumps.
- Follow a stable inspection order unless the request clearly requires otherwise.
- Highlight operational risk, not just raw numbers.
