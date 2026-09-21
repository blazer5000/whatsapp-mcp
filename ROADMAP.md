# Roadmap

This repository (`blazer5000/whatsapp-mcp`) retains the narrow product scope inherited from `verygoodplugins/whatsapp-mcp`. Current contribution targets and checks are owned by `CONTRIBUTING.md`; upstream names are provenance, not alternate PR destinations.

## North Star

A small, stable, observable, single-account WhatsApp-to-MCP bridge for a developer laptop or one self-hosted server. This is consumer-grade infrastructure, not a SaaS platform.

## In Scope

| Area | Accepted work |
| --- | --- |
| Bridge stability | Reconnect/recovery; phone/LID resolution; media download races, collisions, MIME types and captions; additive opt-in history flags; events already exposed by whatsmeow |
| MCP correctness | Input validation, useful errors, Unicode search, contact resolution, accurate tool descriptions and bounded/streaming result handling |
| Observability | Structured logs, health/version interfaces, bounded webhook retries and opt-in payload changes |
| Security | Localhost-safe defaults, file/path validation and dependency/security checks |
| Delivery | Reproducible builds, conventional commits, Release Please and the existing verification/security workflows |

## Out of Scope Without a New Decision

- Multi-account/multi-tenant operation, hosted SaaS or multi-user web UI; use independent single-account instances instead.
- Internal plugin systems, reimplementing whatsmeow, or bots/automations beyond existing MCP-client capabilities.
- Outbound call origination, video calling, payments, statuses or channels.
- Cloud-specific deployment kits such as Helm/Terraform; a simple Dockerfile remains acceptable.
- Broad framework, directory or no-behaviour refactors without a clear need and prior discussion.

An unlisted idea is not silently approved; establish its problem and smallest justified scope first. Preserve accepted behaviour while splitting larger work into independently reviewable changes.

## Release Direction

Quality determines cadence: fixes may ship as patches and meaningful features as minor releases; there is no fixed schedule. Conventional commits drive release automation: features normally produce minor versions, fixes patches, and explicit breaking changes major versions. Pre-1.0 breaking changes may use minor releases but still require clear disclosure.

Exact versioning, generated artifacts and release execution belong to `docs/RELEASING.md` and Release Please configuration. A roadmap entry is not permission to publish.
