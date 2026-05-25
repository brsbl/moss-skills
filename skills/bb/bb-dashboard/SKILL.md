---
name: bb-dashboard
description: "Use when creating or updating a Moss workstream dashboard under ~/Moss/Notes/** as the canonical status surface for workers, blockers, decisions, evidence, QA, review, and PR/merge readiness."
---

# Moss BB Dashboard

## When To Use

Use this whenever workstream state must be visible to the user or a manager-of-managers.

## Read First
- ../WORKFLOWS.md
- references/dashboard-reference.md
- ../../moss-notes/SKILL.md (required for Moss dashboard notes)
- ../../moss-frontmatter/SKILL.md if adding metadata
- ../../moss-wiki-links/SKILL.md if linking notes

## Steps
1. Create/update the dashboard before workers start and after material deltas.
2. Show goal, current stage, active workers, blockers, decisions, evidence, and PR/merge state.
3. Keep long plans/logs/reviews in sibling notes and link them.
4. Record plan divergence and accepted risks visibly.
5. Keep counts/status rows consistent with reality.

## Outputs
- Canonical dashboard note
- Worker roster/decision queue/evidence index
- Current next actions and blockers

## Validation
- Dashboard is a valid Moss note directory.
- Rows/counts match active work.
- Every blocker has owner and needed action.
- Completion is distinct from merge/closeout.

## References
- Dashboard template: [references/dashboard-reference.md](references/dashboard-reference.md)
- Manager flow: [../bb-workstream/references/manager-flow.md](../bb-workstream/references/manager-flow.md)
- Moss note rules: [../../moss-notes/SKILL.md](../../moss-notes/SKILL.md)
