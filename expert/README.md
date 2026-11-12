# 负反馈迭代（Feedback-to-Rules Iteration）

把人的负反馈转成可判定规则卡，用小样本高频迭代与回归门禁收敛规则库，冻结后再全量执行。来源：`f2r-meta-skill.zip` v1.0.0，原包 16 个文件已完整迁入，内容未删改。

## 类型

Agent 型（单个 AI 专家） · 分类 04-DataAI（主要产出为提示词、规则库与 Agent 配置，属大模型应用与提示词工程）

## 目录结构

```
negative-feedback-iteration/
├── .codebuddy-plugin/plugin.json     专家配置与展示字段
├── agents/negative-feedback-iteration.md   主 Agent 定义
├── skills/f2r-meta-skill/           原始元技能包（完整保留）
│   ├── SKILL.md                      方法论全文
│   ├── rules/rule_cards.md           规则库 V1（R001–R005）
│   ├── templates/                    迭代契约 / 规则卡 / 反馈表
│   ├── tests/golden_cases.md         黄金集模板
│   ├── prompts/system_prompt.md      可直接使用的系统提示词
│   ├── agents/                       五个角色定义
│   ├── scripts/new_cycle.sh           新建一轮迭代目录
│   ├── changelog.md / VERSION / README.md
├── avatars/expert.png                头像
└── README.md
```

## 使用示例

- 我有一批不满意的产出，帮我用负反馈迭代建一版 V1 规则库
- 把这几条反馈归因成规则 diff，并给出下一轮小样本计划
- 跑一遍黄金集回归，判断这版规则能不能冻结

## 红线和门禁

禁止把模板、公式、句式模板写成产出规则；禁止从爆款结果直接反推模板；反馈缺「哪不好、为什么、什么情况下可以」先追问；回归未通过不得建议全量执行。

## 新建一轮迭代

```bash
cd skills/f2r-meta-skill && bash scripts/new_cycle.sh cycle-001
```

## 头像

`avatars/expert.png` 由 ImageGen 生成，可手动替换：PNG/JPG，512×512，≤500KB。

## 跨平台使用

本专家包为 WorkBuddy 专用格式。若要在其他 AI 平台使用同一套方法论，用仓库根目录 `universal/` 下的纯 Markdown 通用包（系统提示词 + 规则库 + 模板 + 使用说明），直接粘贴或作为知识文件上传即可。

## 安装与注册

在仓库根目录运行 `bash install.sh` 即可安装并自动登记到 `marketplace.json`；也可把本目录复制为 `~/.workbuddy/plugins/marketplaces/my-experts/plugins/negative-feedback-iteration/` 后手动登记。完成后在【专家中心 - 我的专家】中可见「负反馈迭代」。
