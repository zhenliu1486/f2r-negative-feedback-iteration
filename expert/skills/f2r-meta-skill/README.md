# F2R 负反馈规则迭代元技能压缩包

版本：1.0.0

这是一个“生产任何 Skill、SOP、流程、Agent 的总技能”。核心不是给模板，而是用负反馈把人的判断变成可判定规则，再通过小样本迭代和回归测试逐步收敛。

## 快速开始

1. 解压：
   `unzip f2r-meta-skill-v1.0.zip`
2. 阅读：
   `f2r-meta-skill/SKILL.md`
3. 为你的目标领域复制模板：
   - `templates/iteration_contract.md`：定义本轮迭代契约
   - `templates/feedback_table.csv`：收集人类负反馈
   - `templates/rule_card.md`：沉淀规则卡
   - `rules/rule_cards.md`：维护规则库
4. 新建一轮迭代：
   `cd f2r-meta-skill && bash scripts/new_cycle.sh cycle-001`
5. 每轮只跑 20～50 个样本；人类按“哪不好、为什么、什么情况下可以”反馈；AI 归因成规则 diff；回归通过后再进入下一轮。
6. 连续 3 轮无新规则类型、反馈重复、盲测通过后冻结版本，再全量执行。

## 红线

- 禁止把模板、公式、句式模板当作产出规则。
- 禁止从爆款结果直接反推模板。
- 人类反馈不完整时，先追问，不得臆造。
- 未通过回归测试，不得建议全量执行。

## 文件说明

- `SKILL.md`：总技能主文件
- `rules/rule_cards.md`：规则库 V1
- `templates/`：反馈表、规则卡、迭代契约
- `prompts/system_prompt.md`：可直接使用的系统提示词
- `agents/`：执行器、反馈审计器、规则迭代器、回归测试器、总控
- `tests/golden_cases.md`：黄金集模板
- `scripts/new_cycle.sh`：创建新一轮迭代目录
- `changelog.md`：版本记录
