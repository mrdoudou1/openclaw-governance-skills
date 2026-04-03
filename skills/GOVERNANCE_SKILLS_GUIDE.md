# Governance Skills 使用文档、配置说明与 OpenClaw / Codex 使用方法

这份文档说明当前工作区新增的 12 个治理型 skill 是做什么的、什么时候会自动优先使用、它们如何接入到工作区规则链里，以及在 OpenClaw / Codex 场景下应该怎么理解和使用。

---

## 一、这套 skill 是什么

这套 skill 不是一个大一统的超级 skill，而是 12 个职责单一的小 skill。

这样设计的目的：
- 让触发更精准
- 避免一次性加载一大坨无关说明
- 后续可以只改某一个 skill，不影响整套
- 更贴近 Claude Code / OpenClaw 这种按目录加载 skill 的机制

当前总清单：

1. memflow
2. ctxguard
3. docflow
4. handoff
5. permflow
6. opscheck
7. taskview
8. syncflow
9. modeflow
10. toolflow
11. assetflow
12. replyflow

---

## 二、超短版索引（1 屏看完）

如果只想快速回忆这套 skill 是干什么的，看这一段就够了。

### 这套东西一句话是干嘛的

这 12 个 governance skills 用来给当前工作区补一层行为治理，不改 OpenClaw 本体，只约束和稳定：
- 怎么记
- 怎么读
- 怎么整理
- 怎么巡检
- 怎么收尾
- 怎么确认风险
- 怎么选工具
- 怎么回消息

### 12 个 skill 的超短记忆法

- `memflow`：记忆该落哪层
- `ctxguard`：长回合别把上下文撑爆
- `docflow`：文档怎么分层
- `handoff`：收尾和留停点
- `permflow`：这步要不要先确认
- `opscheck`：巡检机器和服务
- `taskview`：把多步任务讲清楚
- `syncflow`：多渠道和记忆边界
- `modeflow`：先判断当前是什么模式
- `toolflow`：先选最合适的工具路线
- `assetflow`：长期资产该写到哪
- `replyflow`：结果怎么回更清楚

### 平时怎么用最顺手

不用记 skill 名字，直接说目标：
- “别全量读，先挑重点”
- “这条别写进 MEMORY.md”
- “帮我整理文档结构”
- “先收个尾，留个停点”
- “这个动作要不要先确认”
- “巡检一下机器”

### OpenClaw 和 Codex 怎么分工

- OpenClaw + governance skills：负责治理、组织、判断、收尾
- Codex：负责具体编码和实现

一句话理解：
- **先定怎么做，再决定谁来做**

---

## 三、目录结构

当前每个 skill 都是独立目录，对应一个 `SKILL.md`：

```text
skills/
├── memflow/SKILL.md
├── ctxguard/SKILL.md
├── docflow/SKILL.md
├── handoff/SKILL.md
├── permflow/SKILL.md
├── opscheck/SKILL.md
├── taskview/SKILL.md
├── syncflow/SKILL.md
├── modeflow/SKILL.md
├── toolflow/SKILL.md
├── assetflow/SKILL.md
└── replyflow/SKILL.md
```

注意：
- 一个文件夹只对应一个 skill
- 不能把多个 skill 混在同一个目录里当成多个 skill 用
- 如果合并成一个目录，例如 `skills/governance/SKILL.md`，那它就只会变成 **一个总 skill**

---

## 四、每个 skill 的作用

### 1. memflow

作用：
- 记忆分层
- 判断内容该进 daily、MEMORY.md、TOOLS.md、项目文档还是不该存
- 处理旧记忆与新事实冲突
- 做记忆压缩、去重、归位

典型触发：
- “记住这个”
- “整理一下记忆”
- “这个不要写进 MEMORY.md”
- “这条该记到哪里”

---

### 2. ctxguard

作用：
- 控制上下文膨胀
- 大文件、大量工具调用时保持读取克制
- 优先 `memory_search -> memory_get`
- 在长回合收尾前重新确认最新用户消息

典型触发：
- “先别全量读”
- “这个排查太长了”
- “帮我控一下上下文”
- “挑重点看”

---

### 3. docflow

作用：
- 文档结构治理
- README / docs / archive 分层
- 去重、拆分、归档、加导航

典型触发：
- “整理文档”
- “README 太乱了”
- “这些文档怎么分层”
- “把旧文档归档”

---

### 4. handoff

作用：
- 收尾
- 留停点
- 为 /new、上下文压缩、下次继续做准备
- 生成最小恢复入口

典型触发：
- “先收个尾”
- “帮我留个停点”
- “准备 /new”
- “下次继续”

---

### 5. permflow

作用：
- 判断要不要先确认
- 风险操作如何呈现
- 是否要说明影响与回滚

典型触发：
- “这个能直接改吗”
- “要不要先问我”
- “这步风险大吗”
- “要不要重启服务”

---

### 6. opscheck

作用：
- 巡检机器/服务状态
- 看资源、进程、端口、服务、OpenClaw 运行情况
- 输出精简 ops 风格总结

典型触发：
- “巡检一下”
- “看下服务器状态”
- “查下资源占用”
- “openclaw 正常吗”

---

### 7. taskview

作用：
- 多步任务进度表达
- 固定成 Current goal / In progress / Done / Next 这种任务视图

典型触发：
- “分步来”
- “同步下进度”
- “你现在做到哪了”
- “一步步处理”

---

### 8. syncflow

作用：
- 多渠道同步边界控制
- 区分“写进记忆”和“回复用户”以及“是否需要主动发到别的渠道”

典型触发：
- “微信那边也有”
- “这个要不要同步”
- “只记忆别发消息”
- “这条该回哪边”

---

### 9. modeflow

作用：
- 先判断当前任务模式
- 再决定回复形态、工具强度、执行节奏

常见模式：
- chat
- memory governance
- documentation governance
- coding
- debugging
- ops
- cron/reminder
- cross-session coordination

---

### 10. toolflow

作用：
- 工具路线选择
- 决定该先搜、先读、先 fetch、还是开子会话
- 优先走最轻、最有效的工具路径

典型触发：
- “先别开重工具”
- “怎么选工具更合适”
- “这个要不要开子会话”
- “先搜还是先读文件”

---

### 11. assetflow

作用：
- 处理长期资产/服务信息归位
- 比如域名、IP、端口、服务入口、仓库位置等该写到哪里

典型触发：
- “这个域名记一下”
- “这个入口写到哪”
- “这个应该进 TOOLS 还是 MEMORY”
- “帮我归位这些服务信息”

---

### 12. replyflow

作用：
- 控制回复结构
- 决定技术任务、ops 总结、多步任务、聊天场景分别怎么答更清楚

典型触发：
- “直接告诉我结论”
- “给我简短版”
- “先说结果”
- “按步骤回我”

---

## 五、它们现在怎么自动生效

目前这套 skill 的自动优先使用，不是靠修改 OpenClaw 本体实现的，而是通过：

1. 每个 skill 自己的 `SKILL.md` frontmatter
2. `AGENTS.md` 里的默认治理 skill 规则

也就是：
- skill 自身声明“我是什么、什么时候该用”
- 工作区规则链再补一层“遇到这类问题优先想到哪个 skill”

这是一种 **不改本体、只叠工作流治理层** 的做法。

---

## 六、当前配置说明

### 1. 已配置项

每个 skill 当前都至少包含：
- `name`
- `description`
- `allowed-tools`
- `when_to_use`

含义如下：

#### `name`
skill 名称，对应目录名。

#### `description`
简要说明 skill 是做什么的。

#### `allowed-tools`
这个 skill 在设计上允许/偏向使用的工具集合。
注意：
- 这是 skill 级别的治理声明
- 不等于系统一定只允许这些工具
- 但它决定了这个 skill 的能力边界和风格

#### `when_to_use`
最关键的触发说明。
这里写的是：
- 什么时候该用这个 skill
- 用户常见怎么说
- 哪些场景属于它

---

### 2. AGENTS.md 中的默认触发规则

当前已经在 `AGENTS.md` 中加入了 `Default governance skills (auto-prefer)`，意思是：

当请求符合某类主题时，优先使用对应 skill：

- 记忆治理 → memflow
- 上下文控制 → ctxguard
- 文档治理 → docflow
- 收尾/交接 → handoff
- 风险确认 → permflow
- 巡检/体检 → opscheck
- 多步任务 → taskview
- 多渠道同步 → syncflow
- 模式判断 → modeflow
- 工具路线选择 → toolflow
- 长期资产归位 → assetflow
- 回复结构选择 → replyflow

---

## 七、现在怎么使用

你平时不需要手动说“调用哪个 skill”。

直接自然说就行，例如：

- “帮我整理一下最近的记忆，别污染 MEMORY.md”
- “这个排查太长了，先别全量读”
- “把这堆文档重新分层一下”
- “先收个尾，留个停点给我下次继续”
- “这个动作风险大不大，要不要先确认”
- “帮我巡检一下这台机器”

只要表述落在对应主题上，就会优先走对应治理 skill 的思路。

---

## 八、和“一个总 skill”相比有什么区别

现在是 12 个小 skill，不是 1 个大 skill。

优点：
- 触发更精确
- 上下文更轻
- 后续好维护
- 某一个 skill 可以独立改进

如果改成一个总 skill：
- 只有一个入口
- 更像“总规章”
- 但自动触发会变粗
- 容易把不相关说明一起带进来

所以当前更适合治理层的方案，仍然是 **拆分 skill**。

---

## 九、后续还能怎么优化

如果后续继续优化，建议方向：

### 方向 1：继续精修触发描述
把 `when_to_use` 再往你的日常说话方式上贴。

### 方向 2：给少数 skill 增加参数
例如：
- memflow：支持 compress / promote / dedupe
- handoff：支持 quick / full
- replyflow：支持 short / detailed

### 方向 3：给高频 skill 增加 references 或模板
如果未来某些 skill 需要固定模板、清单、例子，可以在 skill 目录下继续加参考文件。

### 方向 4：基于真实使用继续收敛
实际跑几轮后，再看：
- 哪些 skill 最常触发
- 哪些边界重叠
- 是否有必要合并其中 2~3 个

---

## 十、OpenClaw 使用方法

这套 skill 当前是为 **OpenClaw 工作区** 落地的，核心思路是：

- 不改 OpenClaw 本体
- 不去重写底层运行时
- 通过 `skills/<name>/SKILL.md` + `AGENTS.md` 默认触发规则
- 给当前工作区叠一层“治理层”

### 1. 在 OpenClaw 里它怎么生效

OpenClaw 当前这边的实际工作方式是：

1. 每个 skill 自己声明：
   - `name`
   - `description`
   - `allowed-tools`
   - `when_to_use`
2. 工作区规则链（`AGENTS.md`）再补一层默认偏好：
   - 哪类请求优先想到哪个 skill

所以你平时不用手动说：
- “调用 memflow”
- “进入 ctxguard”

更自然的方式是直接说任务目标：
- “整理一下最近记忆，别污染 MEMORY.md”
- “这个排查太长了，别全量读”
- “帮我把这堆文档分层一下”
- “先帮我留个停点，下次继续”

我会优先走对应 skill 的治理逻辑。

### 2. 在 OpenClaw 里什么叫“配置完成”

如果满足下面几点，就可以认为这套 governance skills 已经接好了：

- `skills/<skill-name>/SKILL.md` 文件存在
- frontmatter 已写好 `name / description / when_to_use / allowed-tools`
- `AGENTS.md` 已加入 default governance skills 的自动优先规则
- skill 文件已纳入 git（方便迁移、回滚、换环境）

### 3. OpenClaw 里推荐的使用方式

推荐按“自然语言触发”来用，而不是死记 skill 名。

#### 例子：

**记忆治理**
- “这条先记到 daily，别进 MEMORY.md”
- “帮我压缩一下旧记忆”

**上下文治理**
- “别全量读，先挑重点”
- “这个排查太长了，控一下上下文”

**文档治理**
- “README 太乱了，帮我理一下 docs 结构”
- “把旧文档归档”

**收尾交接**
- “先收个尾”
- “帮我留个停点，准备 /new”

**运维巡检**
- “巡检一下这台机器”
- “openclaw 现在正常吗”

### 4. OpenClaw 里它不是什么

这套 skill：
- 不是插件
- 不是 runtime patch
- 不是本体功能替代品
- 不是强制规则引擎

它更像：

**一层面向当前工作区的高层行为治理说明。**

也就是把“该怎么记、怎么读、怎么回、怎么收尾、怎么控风险”这类习惯，稳定沉淀下来。

---

## 十一、Codex 使用方法（如何理解这套 skill 与 Codex 的关系）

先说结论：

**这套治理型 skill 是按 OpenClaw 工作区落地的，不是直接给 Codex 原生读取的。**

但是它的设计思路，明显借鉴了 Claude Code / Codex 这一类 coding agent 的能力组织方式，所以对 Codex 仍然有两种实用价值。

### 1. 第一种用法：把它当“设计参考”

也就是说：
- OpenClaw 里直接使用这 12 个 skill
- Codex 那边不直接读取这些 skill 文件
- 但你可以把这套 skill 视为一套治理层模板

适合场景：
- 你以后想给 Codex 也做一套相似的行为规则
- 你想把这些 skill 的 frontmatter、步骤、边界进一步改造成更适合 Codex 的形式

### 2. 第二种用法：把 Codex 当执行器，把 skill 当治理层

这是更实用的理解：

- OpenClaw 负责：
  - 判断该用哪种治理逻辑
  - 组织上下文
  - 做模式选择
  - 控制风险与回复结构
- Codex 负责：
  - 具体编码
  - 修改文件
  - 跑命令
  - 执行复杂实现任务

也就是说：

**skill 负责“怎么组织这次工作”，Codex 负责“把工作做出来”。**

### 3. 适合交给 Codex 的场景

下面这些任务，很适合在 OpenClaw 判断后，再交给 Codex 执行：

- 新功能开发
- 多文件重构
- 大范围代码修改
- 需要探索项目结构的 coding work
- 需要较长执行链的实现任务

而下面这些，不一定要交给 Codex：

- 纯记忆治理
- 纯文档归档
- 简单说明性修改
- 很轻的小改动
- 单纯的回复结构调整

### 4. 如果你想在 OpenClaw 里用 Codex，推荐说法

你可以直接这样说：

- “这个改动交给 Codex 做”
- “用 Codex 帮我改这个项目”
- “这个任务开个 Codex 会话处理”
- “让 Codex 继续实现，先帮我整理上下文”

这种组合下，典型流程会变成：

1. 先由治理 skill 定调
   - modeflow 判断是 coding / debugging / ops 哪种模式
   - toolflow 判断该不该开 agent / codex
   - taskview 负责把任务拆清楚
2. 再把具体实现交给 Codex
3. 最后由 replyflow / handoff 负责收尾和汇报

### 5. Codex 不是直接读取这些 skill 的原因

因为当前这套 skill 是按 OpenClaw 工作区结构落地的：

- `skills/<name>/SKILL.md`
- `AGENTS.md` 默认触发规则

这是当前工作区的一层治理机制。

Codex 如果要“原生吃这套 skill”，通常需要：
- 单独适配 Codex 的上下文装载方式
- 或者把它们改造成 Codex 可直接读取/注入的 prompt 资产

所以现阶段更现实的定位是：

**OpenClaw 用这套 skill 做治理，Codex 做执行。**

---

## 十二、推荐工作流（OpenClaw + Codex 组合）

如果你后面想把这套东西真正用顺，我建议这样理解：

### 场景 A：非编码任务
直接由 OpenClaw + governance skills 处理。

例如：
- 记忆整理
- 文档治理
- 收尾交接
- 巡检汇报
- 渠道同步

### 场景 B：编码任务
先由 governance skills 定调，再决定是否交给 Codex。

建议路径：
- `modeflow`：先判断当前是不是 coding / debugging
- `toolflow`：决定是否开 Codex / agent
- `taskview`：整理任务进度结构
- `permflow`：有风险操作时先确认
- `replyflow`：最后汇报结果

### 场景 C：长任务 / 多轮任务
建议额外强调：
- `ctxguard` 控上下文
- `handoff` 留停点
- `memflow` 决定哪些信息该进 memory

---

## 十三、常见问答（FAQ）

### Q1：为什么不是一个总 skill，而是 12 个？

因为当前这套治理层更适合拆分成多个职责单一的小 skill。

这样做的好处：
- 自动触发更准
- 不容易把一大堆无关说明带进上下文
- 后续可以单独改某一个 skill
- 更贴近 Claude Code / OpenClaw 这种一个目录对应一个 skill 的加载方式

如果做成一个总 skill，也不是不行，但会带来：
- 触发过粗
- 上下文更重
- 后续维护粒度变差

所以当前更适合“拆分治理层”，而不是“一个总规章”。

### Q2：为什么不是放在一个 skill 文件夹里多个文件？

因为现在这类 skill 的识别方式本身就是：

- `skills/skill-name/SKILL.md`

也就是：
- 一个目录 = 一个 skill

所以如果你放成：
- `skills/governance/memflow.md`
- `skills/governance/ctxguard.md`

它不会自动被当成多个标准 skill 来识别。

### Q3：为什么还要在 `AGENTS.md` 里再写一层默认规则？

因为仅有 skill 文件本身，只能告诉系统：
- 这个 skill 是什么
- 什么时候适合用

但 `AGENTS.md` 这一层可以额外表达：
- 在当前工作区里，遇到哪类请求，我默认更偏向哪种治理路线

简单理解就是：
- `SKILL.md` 是 skill 自我说明
- `AGENTS.md` 是当前工作区的默认使用偏好

两层叠加，触发会更稳定。

### Q4：为什么 Codex 不直接读取这套 skill？

因为这套 skill 目前是按 **OpenClaw 工作区** 的结构和规则落地的。

也就是说它依赖：
- `skills/<name>/SKILL.md`
- `AGENTS.md` 工作区规则链

这更像是当前工作区的一层治理逻辑。

Codex 如果要原生直接吃这套内容，通常还需要额外适配它自己的上下文装载方式。

所以当前更现实的关系是：
- OpenClaw 用这套 skill 做治理
- Codex 负责执行具体编码/实现任务

### Q5：什么时候该交给 Codex，什么时候不该？

适合交给 Codex：
- 新功能开发
- 多文件重构
- 较长的 coding / debugging 流程
- 需要读项目结构、改代码、跑命令的一整串实现任务

不一定要交给 Codex：
- 记忆治理
- 文档归档
- 回复结构整理
- 很轻的小修小改
- 单纯的巡检汇报

一句话理解：
- **治理和组织** → OpenClaw + governance skills
- **具体实现和编码执行** → Codex

### Q6：我平时要记住每个 skill 的名字吗？

不用。

最推荐的方式还是自然说任务目标，比如：
- “别全量读，先挑重点”
- “帮我整理记忆，别污染 MEMORY.md”
- “README 太乱了，帮我分层”
- “先帮我留个停点”

也就是说：
你记住“表达目标”就够了，不需要死记 12 个 skill 名字。

### Q7：现在这套还有没有继续优化空间？

有，但现在已经进入“精修阶段”，不是“从零搭建阶段”了。

优先建议：
1. 先真实跑几轮
2. 看哪些 skill 最常触发
3. 再继续精修它们的 `when_to_use`
4. 之后再决定要不要：
   - 给少数 skill 加参数
   - 给少数 skill 加 references / 模板
   - 合并极少数边界重叠的 skill

也就是说，下一步更应该基于使用反馈，而不是盲目继续加 skill。

---

## 十四、总结

这套 governance skills 的本质，不是替代 OpenClaw 本体，也不是替代 Codex，而是：

**在不改本体的前提下，给当前工作区加上一层更稳定的行为秩序。**

它主要解决的是：
- 怎么记
- 怎么读
- 怎么整理
- 怎么巡检
- 怎么收尾
- 怎么确认风险
- 怎么选工具
- 怎么同步渠道
- 怎么汇报结果

如果以后继续扩展，建议优先路线是：

1. 先在 OpenClaw 里真实使用几轮
2. 找出最常触发、最有价值的 skill
3. 再决定哪些继续精修
4. 如果确实需要，再考虑为 Codex 单独适配一层更贴近它的版本
