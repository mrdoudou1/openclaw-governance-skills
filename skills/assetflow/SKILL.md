---
name: assetflow
description: "Durable asset placement guidance for OpenClaw workspace knowledge. Use when deciding where to record long-lived domains, IPs, ports, service names, host aliases, repo locations, operational entry points, and other environment-specific assets, including whether they belong in MEMORY.md, TOOLS.md, project docs, or only daily notes."
allowed-tools:
  - Read
  - Write
  - Edit
  - memory_search
  - memory_get
when_to_use: "Use when durable operational facts such as domains, IPs, ports, host aliases, service names, repo locations, or environment-specific entry points need to be stored in the right workspace file. Example triggers: '这个域名记一下', '这个入口写到哪', '长期资产怎么存', '这个应该进 TOOLS 还是 MEMORY', '帮我归位这些服务信息'."
---

# assetflow

Put durable operational facts where future-you can find them.

## Placement hints
- `TOOLS.md`: environment-specific operational lookup info
- `MEMORY.md`: cross-session facts that affect how the assistant should think or operate
- project docs: service-specific technical detail
- daily notes: temporary state or one-off observations

## Rule

Prefer structured placement over scattering the same asset across many files.
