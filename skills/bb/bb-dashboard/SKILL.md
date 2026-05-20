---
name: bb-dashboard
description: Use when creating or updating ~/Moss/Agent Workspaces/bb Workspace/workstreams dashboard.md as the canonical user review surface for Moss workstream status, worker ownership, blockers, decisions, evidence, plan divergence, QA, verification, review, merge, and manager roll-up.
---

# Moss BB Dashboard

Use this skill to keep `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/dashboard.md` accurate and reviewable. The dashboard is canonical for user review; bb threads hold communication and execution details.

## Inputs

- Workstream goal, integration branch, and current manager decision.
- Worker roster, provider/model where known, thread IDs, environments, owned files, stage, blockers, and next gates.
- Plans, QA reports, verification reports, review reports, screenshots, logs, summaries, commits, PRs, risks, and decisions.

## Steps

1. Update the dashboard before starting workers and after each material worker delta.
2. Keep scope, owner, next gate, blocker, and evidence visible for every active worker.
3. Record provider/model when known without letting it replace scope or evidence.
4. Track plan divergence with reason, impact, status, and approver or escalation path.
5. Link sibling artifacts instead of embedding long plans, logs, screenshots, or reviews.
6. Keep unresolved P0/P1 review findings and failed acceptance checks visible until fixed or accepted.

## Outputs

- Scannable dashboard with overview, stage board, worker roster, decision queue, evidence index, and merge state.
- Parent-manager roll-up when child managers exist.
- Current blocker owners, decision owners, evidence paths, and next manager actions.

## Node Type Guidance

The dashboard is a Moss note; pick node types that fit each section's job. Follow [moss-notes](../../moss-notes/SKILL.md) for syntax; do not duplicate it here.

- Tables for the worker roster, decision queue, and plan divergence.
- Callouts (`info`, `warning`, `priority`) for the latest decision, active blockers, and items needing user action.
- Tabs (2-4) for large workstreams with parallel stage boards or worker groups.
- Charts only when a trend or comparison is clearer than a small table.
- `moss-html` only when expansive interactivity justifies the cost.

## Validation

- Counts match visible rows.
- All blockers have owner and needed artifact or decision.
- QA, verification, review, summary, and merge evidence is linked where applicable.
- Worker-reported completion is distinct from manager merge and final completion.

## References

- Detailed dashboard sections, table shapes, update rules, inline dashboard template, and node-type guidance: [references/dashboard-reference.md](references/dashboard-reference.md).
- Shared manager flow and artifact layout: [../bb-workstream/references/manager-flow.md](../bb-workstream/references/manager-flow.md).
- Moss note authoring rules: [moss-notes](../../moss-notes/SKILL.md), [moss-frontmatter](../../moss-frontmatter/SKILL.md), [moss-comments](../../moss-comments/SKILL.md), [moss-wiki-links](../../moss-wiki-links/SKILL.md), [moss-mockup](../../moss-mockup/SKILL.md).
