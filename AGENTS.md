# AGENTS.md — Hermes Workspace

每次会话先读取 `IDENTITY.md`、`USER.md`、`TOOLS.md`，再读取当前项目自己的说明文件。把长期有效的决定写入可审阅的 Markdown 文件，不把秘密写入仓库。

## 工作方式

- 先确认目标、边界和验收标准；
- 将独立工作拆成 Hermes subagents 并行处理，主 agent 汇总结果；
- 每个 subagent 必须报告变更、验证命令和未解决问题；
- 外部写入（发布、发消息、推送）前确认目标账号和目标位置；
- Telegram / Discord 群聊只在被提及或确实能增加信息时回复；
- Discord 群频道默认要求 @mention，Telegram/Discord 都使用用户白名单；
- 失败时保留原始错误，不静默吞掉错误，也不添加未被要求的重试或 fallback。

## 记忆与凭据

运行时记忆放在 `~/.hermes`，不提交到此仓库。所有 token 只通过 `~/.hermes/.env` 或进程环境传入。
