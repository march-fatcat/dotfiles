# march-fatcat Hermes agents 配置

这是一个参照 [`lodekeeper/dotfiles`](https://github.com/lodekeeper/dotfiles) 组织方式整理的、面向 `march-fatcat` 的公开配置骨架，运行时使用 [Hermes Agent](https://github.com/NousResearch/hermes-agent)。

配置目标：

- 用文件化的 `AGENTS.md`、`IDENTITY.md`、`USER.md`、`TOOLS.md` 作为上下文入口；
- 通过 Hermes gateway 接入 Telegram 和 Discord；
- 通过 Hermes 的 subagent 能力执行并行工作；
- 凭据只从本机 `.env` /环境变量读取，不提交到 Git。

## 安装

```bash
cd march-fatcat-hermes-dotfiles
./scripts/setup-hermes.sh
cp .env.example ~/.hermes/.env
$EDITOR ~/.hermes/.env
hermes setup
hermes gateway setup
hermes gateway start
```

`setup-hermes.sh` 会把公开上下文文件复制到 `~/.hermes/workspace`，并在已有配置存在时停止，不覆盖现有 Hermes 配置。

## Telegram / Discord

在 `~/.hermes/.env` 填入：

```dotenv
TELEGRAM_BOT_TOKEN=...
TELEGRAM_ALLOWED_USERS=你的 Telegram 数字用户 ID
DISCORD_BOT_TOKEN=...
DISCORD_ALLOWED_USERS=你的 Discord 用户 ID
DISCORD_REQUIRE_MENTION=true
```

Telegram token 从 [@BotFather](https://t.me/BotFather) 获取。Discord 需要在 Developer Portal 开启 **Message Content Intent**，再使用 `hermes gateway setup` 生成邀请链接。建议先配置用户白名单；群聊保持 Discord @mention 门槛。

## Hermes agents

Hermes 的多代理入口由运行时提供。完成安装后可用：

```bash
hermes tools
hermes gateway status
hermes doctor
```

复杂任务由主 agent 使用 Hermes 的 subagent/delegation 能力拆分；每个 agent 共享此仓库中的上下文文件，但 token 和平台凭据留在本机。

## 安全边界

- `.env`、运行时数据库、会话日志、记忆目录不进入仓库；
- `IDENTITY.md` 和 `USER.md` 只包含公开占位信息；
- 不复制 lodekeeper 的个人 Telegram/Discord ID、GitHub 写权限或私有工作记忆。
