# TOOLS.md — Local Notes

本文件只记录本机环境中可公开描述的工具入口。主机路径、SSH 凭据、API token 和个人聊天 ID 放在 `~/.hermes/.env` 或本机私有文件中。

## Hermes

- 配置目录：`~/.hermes`
- 工作区：`~/.hermes/workspace`
- Gateway：`hermes gateway setup` / `hermes gateway start`
- 诊断：`hermes doctor`


## GitHub

- **Acting account:** `march-fatcat`
- **Authentication:** use the local `gh` credential store; never put tokens in this repository, `.env`, or chat.
- **Before any write:** run `gh auth status` and `gh api user --jq .login`; both must identify `march-fatcat`.
- **PR workflow:** work in a checkout, use a feature branch, run relevant checks, then create the PR with `gh pr create`.
- **Git transport:** run `gh auth setup-git` once if HTTPS pushes are not using the authenticated account.
