<a id="top"></a>

# openclaw-governance-skills

[![GitHub stars](https://img.shields.io/github/stars/PLACEHOLDER/PLACEHOLDER?style=flat-square)](#)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

> A reusable governance skill pack for OpenClaw: memory layering, context hygiene, documentation structure, handoff flow, risk confirmation, ops checks, task framing, sync boundaries, mode selection, tool routing, asset placement, and reply shaping.

## 目录

[项目介绍](#intro) ·
[适用场景](#scenes) ·
[核心特性](#features) ·
[仓库结构](#structure) ·
[快速开始](#quickstart) ·
[最小示例](#minimal) ·
[配置说明](#config) ·
[FAQ](#faq) ·
[安全说明](#security) ·
[贡献与致谢](#contributing)

---

<a id="intro"></a>
## 📖 项目介绍

`openclaw-governance-skills` 是一套面向 OpenClaw 工作区的治理型 skill 集合。

它不改 OpenClaw 本体，而是在工作区层叠加一层更稳定的行为秩序，让 agent 在以下问题上更一致：
- 记忆该怎么分层
- 长回合怎么控制上下文
- 文档怎么整理和归档
- 什么时候该先确认风险
- 怎么做巡检、收尾、同步和回复

这套仓库参考了 Claude Code skill 体系的组织思路：
- 每个 skill 独立目录
- `SKILL.md` 使用结构化 frontmatter
- 细节拆到 `references/`
- 高频能力补 `scripts/` 模板资产

---

<a id="scenes"></a>
## 🎯 适用场景

适合：
- OpenClaw 工作区治理增强
- 个人 agent 行为规范沉淀
- skill / workflow / helper 仓库
- 想把“怎么记、怎么读、怎么回”做成稳定套路的人

不太适合：
- 纯代码库、完全不需要 agent 工作流治理的仓库
- 想直接替代 OpenClaw 本体能力的场景

---

<a id="features"></a>
## ✨ 核心特性

- 12 个职责单一的小 skill，触发更精准
- 支持 `when_to_use`、`allowed-tools`、`argument-hint`、`arguments`
- `references/` 分层，减少主 skill 上下文膨胀
- 高频 skill 附带 `scripts/` 模板资产，更像可复用工具
- 配套 `GOVERNANCE_SKILLS_GUIDE.md`，含用法、配置说明、OpenClaw/Codex 分工与 FAQ

当前 skill 清单：
- memflow
- ctxguard
- docflow
- handoff
- permflow
- opscheck
- taskview
- syncflow
- modeflow
- toolflow
- assetflow
- replyflow

---

<a id="structure"></a>
## 🗂️ 仓库结构

```text
openclaw-governance-skills/
├─ README.md
└─ skills/
   ├─ GOVERNANCE_SKILLS_GUIDE.md
   ├─ memflow/
   ├─ ctxguard/
   ├─ docflow/
   ├─ handoff/
   ├─ permflow/
   ├─ opscheck/
   ├─ taskview/
   ├─ syncflow/
   ├─ modeflow/
   ├─ toolflow/
   ├─ assetflow/
   └─ replyflow/
```

说明：
- 每个 skill 都是 `skills/<name>/SKILL.md`
- `references/` 放规则、清单、模板说明
- `scripts/` 放可复用模板或辅助脚本
- `GOVERNANCE_SKILLS_GUIDE.md` 是总说明文档

---

<a id="quickstart"></a>
## 🚀 快速开始

### 1️⃣ 复制 skill 到你的 OpenClaw workspace

把本仓库中的 `skills/` 目录内容复制到你的 OpenClaw 工作区里。

例如：

```bash
cp -r skills/* /path/to/your/openclaw-workspace/skills/
```

### 2️⃣ 把默认治理规则接进 `AGENTS.md`

在你的工作区 `AGENTS.md` 中加入类似这样的默认规则：

- memory governance → memflow
- context hygiene → ctxguard
- docs governance → docflow
- handoff / restart point → handoff
- risky action framing → permflow
- ops checks → opscheck
- task progress framing → taskview
- channel boundary decisions → syncflow
- dominant mode selection → modeflow
- tool routing → toolflow
- durable asset placement → assetflow
- response shaping → replyflow

### 3️⃣ 直接自然触发使用

你平时不需要死记 skill 名字，可以直接这样说：

```text
帮我整理一下最近记忆，别污染 MEMORY.md
这个排查太长了，先别全量读
README 太乱了，帮我分层
先留个停点，下次继续
巡检一下这台机器
```

### 4️⃣ 可选：使用参数化表达

如果你希望触发更稳定，也可以显式这样说：

```text
memflow compress 最近几天记忆
ctxguard strict 当前排查
handoff quick 当前任务
opscheck full openclaw
replyflow short technical
```

---

<a id="minimal"></a>
## 🧪 最小可运行示例

最小落地方式：

1. 放入至少这几个 skill：
   - `memflow`
   - `ctxguard`
   - `handoff`
2. 在 `AGENTS.md` 里补上默认偏好规则
3. 用自然语言测试触发：

```text
帮我整理一下这几天的记忆，别写脏 MEMORY.md
```

如果 agent 开始按“daily / MEMORY / topical / archive”分层思考，说明 `memflow` 已经生效。

---

<a id="config"></a>
## ⚙️ 配置说明

每个 skill 目前都包含这些关键 frontmatter：
- `name`
- `description`
- `allowed-tools`
- `when_to_use`
- 部分 skill 还有 `argument-hint` / `arguments`

其中：
- `when_to_use` 决定“什么时候该想到这个 skill”
- `allowed-tools` 决定“这个 skill 偏向什么能力边界”
- `references/` 用来放不适合堆进主 skill 的细节
- `scripts/` 用来放模板化资产

更完整说明请看：
- `skills/GOVERNANCE_SKILLS_GUIDE.md`

---

<a id="faq"></a>
## ❓ FAQ

### 1. 为什么不是一个总 skill？
因为拆成多个小 skill 触发更精准、维护粒度更细、上下文也更轻。

### 2. 为什么是一个目录一个 skill？
这是这套 skill 结构的基本识别方式：`skills/<name>/SKILL.md`。

### 3. Codex 能直接读取这套 skill 吗？
这套仓库首先是给 OpenClaw 工作区落地的。更现实的分工是：
- OpenClaw + governance skills：负责治理和组织
- Codex：负责具体编码与实现

---

<a id="security"></a>
## 🔐 安全说明

- 本仓库不包含 token、私钥、账号凭证
- 上传到公开仓库前，请再次确认没有把工作区中的私密配置一并复制进来
- `scripts/` 仅用于模板生成，不应包含敏感路径或隐私数据

---

<a id="contributing"></a>
## 🙌 贡献与致谢

欢迎 fork、提 Issue、提 PR。

这套仓库的设计思路参考了 Claude Code 的 skill 组织方式，并结合 OpenClaw 工作区实践做了适配。

<p align="right"><a href="#top">回到顶部</a></p>
