---
name: bb-cleanup
description: "Use to clean up bb workstream threads, environments, branches, and artifacts after completion/pause/cancellation while preserving dashboards, evidence, dirty worktrees, decisions, and useful history."
---

# Moss BB Cleanup

## When To Use

Use this only after useful evidence is preserved and merge/closeout state is clear.

## Read First
- ../WORKFLOWS.md
- references/cleanup-reference.md
- ../../moss-notes/SKILL.md for cleanup notes under ~/Moss/Notes/**

## Steps
1. Inventory active threads, environments, branches, worktrees, PRs, dashboards, and evidence.
2. Stop if active work, dirty files, missing evidence, or unresolved decisions remain.
3. Archive/close threads only when safe; delete only with explicit approval or clearly disposable state.
4. Preserve dashboards, plans, QA, verification, reviews, summaries, and decisions.
5. Record final cleanup state.

## Outputs
- Cleanup report or dashboard section
- Archived/stopped thread list
- Preserved dirty worktrees/evidence
- Remaining actions

## Validation
- No useful dirty or unmerged worktree is removed.
- All referenced evidence remains available.
- Destructive cleanup has approval.

## References
- Cleanup checklist: [references/cleanup-reference.md](references/cleanup-reference.md)
- Summary closeout: [../bb-summary/SKILL.md](../bb-summary/SKILL.md)
- Dashboard state: [../bb-dashboard/SKILL.md](../bb-dashboard/SKILL.md)
