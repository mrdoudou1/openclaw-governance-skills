---
name: permflow
description: "Permission and risk-confirmation governance for OpenClaw actions. Use when deciding whether to ask first, how to present risky changes, whether an operation affects files, configs, services, remote hosts, scheduled tasks, public exposure, or external messaging, and how to describe rollback points before acting."
allowed-tools:
  - Read
when_to_use: "Use when the next action may be risky, user-visible, destructive, external, remote, or hard to roll back, and the assistant should decide whether to ask first and how to frame approval. Example triggers: '要不要先确认', '这步风险大吗', '要不要重启服务', '要不要先问我', '这个能直接改吗'."
argument-hint: "[low|medium|high] [action]"
arguments:
  - risk_level
  - action
---

# permflow

Ask at the right time, not too late and not for everything.

Read `references/risk-levels.md` when the action spans config changes, service operations, remote hosts, public exposure, or external messaging.

## Inputs
- `$risk_level`: optional hint such as `low`, `medium`, or `high`
- `$action`: optional action under evaluation

## Goal
Reduce surprise while preserving momentum.

## Steps

### 1. Classify the action
Decide whether the action is low risk, medium risk, or high risk.

**Success criteria**
- The action fits a clear approval class.

### 2. Decide whether to ask first
Ask first for destructive, external, user-visible, remote, or hard-to-roll-back actions.

**Success criteria**
- The approval boundary is clear before execution.

### 3. Frame approval concretely
If confirmation is needed, state what will change, likely impact, rollback path, and exact command or file target when relevant.

**Success criteria**
- The user can approve a concrete action, not a vague intention.

## Rules
- Do not ask vague permission.
- Be specific about impact and rollback.
- Read-only inspection usually does not need approval.
- External messaging always needs clear intent.
