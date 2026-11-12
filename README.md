# 负反馈迭代 · 让 AI 越改越准

> 你嫌 AI 写得不对，改了十遍它还犯同一个毛病？这东西把你说的「哪里不对」变成一条条能照着判的规矩，越改越准。

它不是模板库，不给你「爆款开头三句式」。它只做一件事：**把人脑子里说不清的标准，一点点变成 AI 能判断对错、能复查、能复用的规则。**

一句话核心：**不学结果，学塑造；不喂模板，喂反馈；不改单稿，改规则。**

---

## 它治三件烦心事

**1. 改完这句，下句又犯同样的错**
你改了第 3 条文案的开头，第 8 条又写成老样子。因为改的是「这一句」，不是「为什么不该这么写」。这里要求每条意见都沉淀成规则卡，改一次，后面全部生效。

**2.「要高级一点」「要有网感」这种话，AI 根本听不懂**
不是 AI 笨，是这类话没法判断对错。这里会把它们拆成「什么情况下算对、什么情况下算错、什么时候可以例外」，让标准变成能打勾的东西。

**3. 在这边调好的提示词，换个 AI 又乱来**
本仓库给的是纯文字规则，不依赖任何平台。粘到 ChatGPT、Claude、Cursor、Gemini、任意聊天窗口都能用；WorkBuddy 里另有现成专家可以直接装。

## 它不干什么

- 不给爆款模板、句式公式，也不让你照着抄。
- 不替你判断好坏——「好不好」只有你能说，AI 只负责归因、整理、复查。
- 不保证一次到位。它靠小批量反复迭代（每轮 20～50 条），稳了才铺开用。
- 不处理纯安全合规硬红线，那类规则直接写死，不参与迭代。

---

## 先选一种用法

| 你是谁 | 用哪个 | 花多久 |
|---|---|---|
| 只用 ChatGPT / Claude / Cursor / Gemini / 任意 AI | **用法一**：复制一段文字 | 3 分钟 |
| 用 WorkBuddy，想在专家中心直接点开 | **用法二**：装专家 | 2 分钟 |

两种用法内容完全同源，规则改了记得两边同步。

---

## 用法一：任何 AI，三分钟开始

**第 1 步**：打开 [`universal/ALL-IN-ONE.md`](universal/ALL-IN-ONE.md)，全文复制。
只想要最简短的一段，就复制 [`universal/SYSTEM-PROMPT.md`](universal/SYSTEM-PROMPT.md)。

**第 2 步**：粘到系统提示词里；不能设系统提示词的，就作为第一条消息发出去。
ChatGPT 自定义 GPT 放「Instructions」，Claude 项目放「Project instructions」，Cursor 放 `.cursor/rules/f2r.md` 或 `AGENTS.md`，Gemini Gem 放指令框。更多平台见 [`universal/README.md`](universal/README.md)。

**第 3 步**：说清楚你要迭代什么。可以直接照抄这段：

```
我要迭代的是：短视频开头文案。
我评价好坏，你负责归因和整理规则。
先帮我列一份迭代契约，再按 7～15 条规则建一版 V1 规则库。
每轮只跑 20～50 条，回归没通过不要建议全量。
```

**第 4 步**：给它一批你不满意的产出，每条写清「哪不好、为什么、什么情况下可以」。它会回你四样东西：反馈归因、规则改动、回归结果、下一轮计划。回归通过、连着几轮提不出新意见了，就可以冻结规则，铺开用。

> 想看一轮完整长什么样，见 [`examples/一轮示例.md`](examples/一轮示例.md)。

---

## 用法二：WorkBuddy 里当专家用

**最省事**：在本仓库根目录跑一行

```bash
bash install.sh
```

脚本会把专家装到 `~/.workbuddy/plugins/marketplaces/my-experts/plugins/negative-feedback-iteration/`，并自动登记到专家列表。然后打开【专家中心 → 我的专家】，就能看到「负反馈迭代」。

**手动装也行**：下载 [f2r-expert-package.zip](https://github.com/zhenliu1486/f2r-negative-feedback-iteration/releases/download/v1.0.0/f2r-expert-package.zip)，解压出 `negative-feedback-iteration/` 文件夹，整个放进：

```
~/.workbuddy/plugins/marketplaces/my-experts/plugins/
```

再在 `~/.workbuddy/plugins/marketplaces/my-experts/.codebuddy-plugin/marketplace.json` 的 `plugins` 数组里补一条同名记录，刷新专家中心即可。

装好之后，直接问它：

- 「我有一批不满意的产出，帮我用负反馈迭代建一版 V1 规则库」
- 「把这几条反馈归因成规则改动，并给出下一轮小样本计划」
- 「跑一遍黄金集回归，判断这版规则能不能冻结」

---

## 每次反馈怎么写

一条能用的反馈，必须回答三个问题：**哪句/哪步不好 → 为什么不好 → 什么情况下可以这么写**。

| | 写法 | 能不能用 |
|---|---|---|
| ❌ | 「这句不好，改一下」 | 不能用，AI 只能瞎猜 |
| ❌ | 「要更有网感」 | 不能用，没法判断对错 |
| ✅ | 「第 2 句把结论放开头了，读者还没明白在讲什么就先被塞了个答案；当内容是先给悬念再揭晓时，结论可以放开头」 | 能用：有位置、有原因、有例外 |

你可以顺手直接改稿，但**改完的稿子必须回写到反馈表里**，否则这一轮白改——改的是单稿，不是规则。

---

## 一条规则长什么样

```
规则ID：R006
适用条件：写短视频开头，且内容靠悬念推进
判断标准：前 15 字直接给出结论 → 判为不符合
动作：把结论后置，先给具体场景或反常细节
正例：……
反例：……
例外：内容是「先抛结论再论证」的科普型，可以开头给结论
优先级：低于 R001（禁止模板化），高于 R005
证据：feedback.csv 第 7 行、样本 S012
版本：V2
```

八项缺一不可。写不出「例外」或「判断标准」，说明这条还不是规则，只是感觉。

---

## 下载哪个文件

| 想要什么 | 下哪个 |
|---|---|
| 在 WorkBuddy 装专家 | [f2r-expert-package.zip](https://github.com/zhenliu1486/f2r-negative-feedback-iteration/releases/download/v1.0.0/f2r-expert-package.zip)（含全部源码＋通用包） |
| 在别的 AI 上用，或想发给朋友 | [f2r-universal-package.zip](https://github.com/zhenliu1486/f2r-negative-feedback-iteration/releases/download/v1.0.0/f2r-universal-package.zip)（8 个纯文字文件，18KB） |
| 只想复制一段话 | [`universal/ALL-IN-ONE.md`](universal/ALL-IN-ONE.md) 或 [`universal/SYSTEM-PROMPT.md`](universal/SYSTEM-PROMPT.md) |
| 只想看方法论原文 | [`universal/METHOD.md`](universal/METHOD.md) |

## 仓库里都有啥

```text
f2r-negative-feedback-iteration/
├── README.md            这份大白话说明
├── install.sh           WorkBuddy 一键安装
├── LICENSE              MIT 许可
├── RELEASE.md           发布页文案
├── universal/           跨平台纯文字包（任何 AI 都能用）
│   ├── ALL-IN-ONE.md      单文件全量版，只能传一个文件就用它
│   ├── SYSTEM-PROMPT.md   精简系统提示词
│   ├── METHOD.md          方法论原文
│   ├── RULE-LIBRARY-V1.md 起始规则库 V1
│   ├── TEMPLATES.md       三张模板
│   ├── GOLDEN-SET.md      黄金集模板
│   ├── ROLES.md           五个角色定义
│   └── README.md          各平台怎么放
├── expert/              WorkBuddy 专家包源码
│   ├── .codebuddy-plugin/plugin.json
│   ├── agents/negative-feedback-iteration.md
│   ├── skills/f2r-meta-skill/   原始技能包 16 个文件，未删改
│   └── avatars/expert.png
├── examples/一轮示例.md  一轮完整过程
└── dist/                 两个现成 zip
```

---

## 常见问题

**Q：我只有十几条不满意的产出，够用吗？**
够起步。每轮 20～50 条是建议值，样本少就多跑几轮，别一上来就全量。

**Q：AI 会不会越改越死板？**
会，如果只加规则不删。所以每轮都要做「增、删、改、合并、降优先级」，还要检查有没有为一条样本硬造规则（过拟合）。连着 3 轮提不出新类型意见、反馈开始重复，就该冻结了。

**Q：为什么非要回归测试？我觉得新版明显更好啊。**
「明显更好」没法验证。回归就是拿历史上错过的、最好的、边界的和故意抬杠的样本再跑一遍，看旧错修没修、有没有冒出新错。跳过它省一轮，代价是全量产出可能整批返工，还查不出是哪条规则害的。

**Q：换个平台规则还准吗？**
规则本身是纯文字，平台无关。但不同模型执行一致性有差别，换平台时建议用黄金集再跑一次回归。

---

## 版本与来源

v1.0.0 · 源自 `f2r-meta-skill.zip`（F2R 负反馈规则迭代元技能），原始 16 个文件完整保留在 `expert/skills/f2r-meta-skill/`。

规则升级时记得同步两处：`universal/RULE-LIBRARY-V1.md` 和 `expert/skills/f2r-meta-skill/rules/rule_cards.md`，否则两个平台的行为会慢慢分叉。

许可：MIT，见 [LICENSE](LICENSE)。随便用、随便改，注明来源即可。
