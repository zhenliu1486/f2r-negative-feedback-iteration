# 负反馈迭代 · 跨平台通用包

来源：`f2r-meta-skill.zip` v1.0.0。全部为纯 Markdown / 纯文本，不依赖任何平台专有格式，任何 AI 都能读。

## 三步上手

1. 把 `SYSTEM-PROMPT.md` 全文粘到系统提示词（或第一条消息）。需要完整规则与模板时改粘 `ALL-IN-ONE.md`。
2. 说明你要迭代什么（文案、SOP、提示词、代码风格……），按 `TEMPLATES.md` 里的迭代契约补全信息。
3. 每轮给 20–50 个样本和「哪不好、为什么、什么情况下可以」的反馈；让 AI 输出归因表、规则 diff、回归结论和下一轮计划。回归通过才允许全量。

## 各平台怎么放

| 平台 | 放法 |
|---|---|
| 任意聊天窗口 / 任意 AI | 第一条消息粘贴 `ALL-IN-ONE.md`，再说需求 |
| ChatGPT GPTs | Instructions 填 `SYSTEM-PROMPT.md`；Knowledge 上传 `ALL-IN-ONE.md`、`RULE-LIBRARY-V1.md`、`TEMPLATES.md` |
| Claude Projects | Project instructions 填 `SYSTEM-PROMPT.md`；项目知识上传 `ALL-IN-ONE.md` |
| Claude Skills | 把 `ALL-IN-ONE.md` 复制为 `SKILL.md`，顶部加 `---\nname: f2r-iteration\ndescription: 用负反馈把人的判断转成可判定规则，迭代规则库并回归收敛\n---`，其余文件放 `references/` |
| Cursor / 支持 AGENTS.md 的编辑器 | 把 `SYSTEM-PROMPT.md` 内容放进 `.cursor/rules/f2r.md` 或项目根目录 `AGENTS.md` |
| Gemini Gems / 其他自定义助手 | Instructions 填 `SYSTEM-PROMPT.md`，需要模板时附 `ALL-IN-ONE.md` |
| 支持多 Agent 的平台 | 按 `ROLES.md` 拆成五个角色，由总控串起阶段 2–6 的循环 |

## 文件清单

| 文件 | 用途 |
|---|---|
| `ALL-IN-ONE.md` | **单文件全量版**：系统提示词＋方法论＋规则库＋模板＋黄金集＋角色，只能传一个文件就用它 |
| `SYSTEM-PROMPT.md` | 精简系统提示词，粘贴即用，语义块用 XML 标签隔离 |
| `METHOD.md` | 元技能方法论原文（F2R 收敛环、十项原则、质量门禁、编排伪循环） |
| `RULE-LIBRARY-V1.md` | 起始规则库 V1（R001–R005），可直接作为第一轮基线 |
| `TEMPLATES.md` | 迭代契约、规则卡、反馈表三张模板合订 |
| `GOLDEN-SET.md` | 黄金集模板（历史失败 / 最佳 / 边界 / 对抗四类） |
| `ROLES.md` | 五个角色的职责、输入输出与门禁定义 |

## 红线

禁止把模板、公式、句式模板写成产出规则；禁止从爆款结果直接反推模板；反馈缺三问先追问；回归未通过不得建议全量执行。

## 版本

1.0.0 · 与 WorkBuddy 专家「负反馈迭代」内容同源。规则升级时请同时更新本目录的 `RULE-LIBRARY-V1.md` 与仓库内 `expert/skills/f2r-meta-skill/rules/rule_cards.md`，避免两处不一致。
