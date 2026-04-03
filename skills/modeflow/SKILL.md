---
name: modeflow
description: Task-mode selection guidance for OpenClaw. Use when deciding whether the current request is primarily chat, memory governance, documentation cleanup, coding, debugging, ops inspection, reminder/cron work, or cross-session coordination, and when the response/tool style should shift based on that mode.
allowed-tools:
  - Read
when_to_use: Use when the assistant should first decide what mode this task belongs to before choosing tool intensity, reply structure, and execution style. Example triggers: mixed chat-plus-task turns, ambiguous requests, requests that could be coding vs debugging vs ops, or situations where the reply style clearly needs to change with the mode.
---

# modeflow

Classify the task before optimizing the response.

## Common modes
- chat / companionship
- memory governance
- documentation governance
- coding
- debugging
- operations / health check
- reminders / cron
- cross-session coordination

## After choosing a mode
Adjust:
- reply structure
- tool intensity
- progress update frequency
- level of detail

## Rule

Pick one dominant mode first. Mix only when the task truly requires it.
