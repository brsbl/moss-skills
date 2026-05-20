---
name: bb-workstream
description: Use when managing a Moss bb workstream across worker threads or environments, including dashboard-as-canonical-surface, provider/model defaults, architecture setup, active manager unblocking, manager-of-manager coordination, gates, merge, summary, and cleanup.
---

# Moss BB Workstream

Use this skill to run a bb-managed Moss development effort from planning through cleanup. The manager's job is to keep workers unblocked, keep ownership and evidence visible, and make gate decisions explicit.

## Inputs

- User goal, PR, issue, Moss note, screenshot, or existing bb manager context.
- Integration branch and any branch restrictions.
- Worker scopes, owned files, forbidden files, acceptance criteria, and validation commands.
- Required source artifacts such as notes, attachments, app targets, accounts, logs, screenshots, or references.

## Workflow

1. Establish source of truth, scope, acceptance criteria, validation, and evidence gaps.
2. Create or update `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/dashboard.md` and `workers.md` before assigning workers.
3. Require each implementation worker to return a short plan and wait for manager approval before editing.
4. Route blockers, dependencies, and plan divergence immediately; record all material changes in the dashboard.
5. Run focused validation, then UI/user-flow verification when behavior is UI-facing or interactive.
6. Treat QA as a merge gate and `moss verify` as the Moss hard gate before merge.
7. Perform the manager first pass, then same-environment read-only review; UI/user-flow verification must exist or be recorded as blocked before review starts.
8. Squash-merge only after gates are resolved, then update dashboard, workers, summary, and cleanup state.

## Outputs

- Canonical dashboard with worker status, blockers, decisions, evidence, and merge readiness.
- Worker roster with thread IDs, environments, providers/models, file ownership, validation, and gates.
- Linked plans, QA reports, verification artifacts, review reports, summaries, and cleanup notes.
- Explicit user or manager decisions for accepted risks, plan divergence, and unresolved items.

## Validation

- Every active worker has scope, owner, next gate, and evidence.
- Every blocker has owner and needed artifact or decision.
- Verification precedes review for UI, screenshot, or user-flow work.
- QA and `moss verify` gate merge readiness.
- Final status links evidence instead of relying on bb thread transcripts.

## References

- Provider defaults and model checks: [references/provider-selection.md](references/provider-selection.md).
- Architecture setup and environment blockers: [references/architecture-setup.md](references/architecture-setup.md).
- Manager flow, worker setup, high-concurrency guidance, manager-of-manager rules, and merge gates: [references/manager-flow.md](references/manager-flow.md).
- Moss note authoring rules: [moss-notes](../../moss-notes/SKILL.md), [moss-frontmatter](../../moss-frontmatter/SKILL.md), [moss-comments](../../moss-comments/SKILL.md), [moss-wiki-links](../../moss-wiki-links/SKILL.md), [moss-mockup](../../moss-mockup/SKILL.md).
