# Contributing

These instructions apply to `blazer5000/whatsapp-mcp`. Verify the actual repository and `origin`; upstream `verygoodplugins/whatsapp-mcp` and `lharries/whatsapp-mcp` references preserve provenance, not the destination for this fork's issues or PRs.

## Scope and Workflow

Read `ROADMAP.md` for scope and `AGENTS.md` for code ownership and safeguards. Discuss material new scope first; the existing approximately 300-line PR guideline is a review signal, not a source-file limit. An explicitly requested bounded change is already discussed scope.

Use one concern per branch/PR, with an observable outcome, reproduction or acceptance examples, focused regression proof and explicit exclusions. Features reference an issue. Keep changes independently reviewable; avoid drive-by formatting and unrelated dependency upgrades. State the justification for new dependencies.

Use conventional commit/PR titles: `feat`, `fix`, `chore`, `docs`, `ci`, `refactor`, `test` or `perf`; identify breaking changes explicitly. Stage intended files only. Before merge, review the complete diff, disclose security-sensitive changes, resolve introduced failures and satisfy configured required checks and review requirements. Merge/publication needs maintainer authorization.

## Verification Commands

Inspect current manifests and test setup; use synthetic data, not paired accounts or live messages. Focus checks while editing, then run the applicable component gate once after executable changes settle.

Go bridge:

```bash
cd whatsapp-bridge
go test ./...
go build ./...
golangci-lint run
```

Python MCP server:

```bash
cd whatsapp-mcp-server
uv sync --extra dev
uv run pytest -v
uv run ruff check .
uv run ruff format --check .
```

Run each block from the repository root. Bridge/MCP contract changes require both affected sides. Security-sensitive changes need relevant auth, path-containment, binding and rejected-input cases. No live send or session reset is authorized by this checklist.

For prose-only changes, review source accuracy, links, ownership and consistency; do not claim a new application test result. Do not bypass configured required GitHub checks. Full logs stay outside routine agent context; report exact commands/results and blocked or unverified coverage.

Workflow files under `.github/workflows/` and current branch rules own the actual CI gate; do not maintain a second stale job inventory here. Investigate informational security findings even when they do not block CI. Never waive an introduced failure merely because another job passed.

## Documentation and Releases

Update only documentation whose truth changed. Configuration examples belong in `.env.example` and user-facing README guidance; do not repeat environment tables in AGENTS. Keep current commands here, product scope in ROADMAP and release/version behaviour in `docs/RELEASING.md`.

Follow Release Please rather than editing generated versions or changelog entries. Use `SECURITY.md` for private vulnerability reporting; ordinary issues must exclude tokens, sessions, message content and other private information. Preserve upstream attribution and licence terms.
