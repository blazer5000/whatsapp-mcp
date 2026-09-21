# WhatsApp MCP — Agent Instructions

Repository: `blazer5000/whatsapp-mcp`; default branch: `main`. Verify the actual `origin` before Git writes. Upstream links are provenance, not permission to submit changes to another fork.

## Sources and Ownership

`ROADMAP.md` owns product scope. `CONTRIBUTING.md` owns contribution workflow and verification commands. `README.md` owns user setup; `.env.example` and current code establish configuration. `docs/RELEASING.md` owns release procedure; workflow files and GitHub settings establish executable checks.

This file owns agent navigation and project-critical safeguards; `CLAUDE.md` is only a pointer. Personal global instructions are optional. Reuse loaded guidance and inspect the responsible code/tests, not the whole README or all historical releases for every task.

## Code Boundaries

| Responsibility | Entry point |
| --- | --- |
| WhatsApp event loop and REST | `whatsapp-bridge/main.go` |
| Bridge authentication/media containment | `whatsapp-bridge/auth.go`, `whatsapp-bridge/media_path.go` |
| Incoming-message webhook | `whatsapp-bridge/webhook.go` |
| MCP tools | `whatsapp-mcp-server/main.py` |
| Stored queries and bridge client | `whatsapp-mcp-server/whatsapp.py` |
| Audio conversion | `whatsapp-mcp-server/audio.py` |

The bridge owns `messages.db`; whatsmeow owns opaque `whatsapp.db` session/contact state. MCP reads must not require a live bridge. Resolve phone/LID identities through the existing mapping; preserve exact DM/group identities and unread semantics.

Use the bridge download contract, not constructed media paths. Preserve token authentication, localhost-safe binding and approved media roots. Linked-device limitations are not evidence that a requested provider capability exists.

## Change and Verification

Deliver one bounded, reviewable concern. Match existing interfaces; extract a touched cohesive responsibility only with preserved behaviour and focused tests. No broad reformatting, speculative abstractions, unrelated dependencies or arbitrary file-size refactors.

Follow CONTRIBUTING's checks and required GitHub gates. Security-sensitive auth, paths, network binding, command execution, identity or external effects need explicit negative/failure coverage. Do not weaken assertions or suppress failing checks. Report what ran and what did not; mocked results do not certify a live provider.

One owner integrates and verifies. Delegate only isolated work whose compact evidence repays the extra context/coordination. Optimize allocation per verified result, not raw tokens; personal model choices are not repository requirements.

## Protected Actions

Code changes and test fixtures do not authorize real messages, pairing/session resets, production webhook delivery, data deletion, credential changes, publication or releases. Use isolated synthetic data and disabled external effects for tests; never commit session stores, message databases, media, tokens or private logs.

Release Please owns generated changelog/version artifacts. Do not hand-edit `CHANGELOG.md`, package versions or release manifests; use the documented release workflow. Preserve upstream attribution and licensing. Ask before a consequential action outside the explicitly requested scope.
