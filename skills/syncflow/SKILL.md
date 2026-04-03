---
name: syncflow
description: "Multi-channel and memory-vs-message synchronization governance for OpenClaw. Use when information may exist across Telegram, WeChat, other chats, or workspace memory; when deciding whether to only store context, reply to the current channel, proactively notify elsewhere, or keep user-visible messaging separate from internal memory updates."
allowed-tools:
  - Read
  - message
  - memory_search
  - memory_get
when_to_use: "Use when the same topic may exist across multiple channels or memory layers, and the assistant must separate remembering from replying from proactive messaging. Example triggers: '微信那边也有', '这个要不要同步', '只记忆别发消息', '这条该回哪边', '多渠道怎么处理'."
---

# syncflow

Keep channels, memory, and user-visible replies from bleeding into each other.

## Core distinctions

Separate these decisions:
- should this be remembered?
- should this be replied to here?
- should this be proactively sent elsewhere?

## Rules

- Do not assume memory updates require outward messaging.
- Do not assume one channel's context should be echoed into another.
- In direct chats, keep the user-facing answer focused on the present request.
- Use memory to preserve context, not to replace communication.
