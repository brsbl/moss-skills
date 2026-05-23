---
name: bb-cleanup
description: Use to safely clean up Moss bb workstream state after completion, pause, or cancellation while preserving dashboards, worker rosters, plans, QA, verification, review, summaries, decision history, dirty worktrees, and useful evidence.
---

# Moss BB Cleanup

Use this skill to clean up bb workstream state only after useful evidence is preserved. Cleanup should archive by default and avoid deleting work that explains what shipped or why work stopped.

## Inputs

- Dashboard, worker roster, thread IDs, environment IDs, and worktree paths.
- QA, verification, review, summary, decision, and merge evidence.
- Current status: completed, paused, canceled, merged, intentionally abandoned, or still active.

## Steps

1. Verify no active worker or manager thread still depends on the environment.
2. Inventory threads, environments, and worktree status. Cleanup across many independent environments can run in parallel by environment group; keep one owner for the final cleanup report and dashboard update. See [Parallelization And Fanout](../bb-workstream/references/manager-flow.md#parallelization-and-fanout).
3. Stop cleanup when active work, dirty files, missing evidence, unresolved findings, or pending decisions remain.
4. Preserve dashboard, roster, approved plans, QA reports, verification screenshots/logs, review reports, summaries, and decision history.
5. Archive threads when safe; delete only with explicit manager/user confirmation that no useful history will be lost.
6. Do not invent environment deletion commands; confirm local bb help and policy first when environment removal is needed.
7. Record a cleanup result in the dashboard or final summary.

## Outputs

- Cleanup report with archived threads, preserved environments, dirty or unmerged worktrees, preserved evidence, and remaining manager/user actions.
- Dashboard or summary update explaining final state.

## Validation

- No useful dirty or unmerged worktree is removed.
- Referenced screenshots, logs, reviews, QA artifacts, summaries, and decisions remain available.
- Destructive cleanup has explicit approval unless the file is obviously disposable and unreferenced.

## References

- Detailed inventory commands, safety gates, evidence preservation, cleanup commands, and report checklist: [references/cleanup-reference.md](references/cleanup-reference.md).
- Moss note authoring rules: [moss-notes](../../moss-notes/SKILL.md), [moss-frontmatter](../../moss-frontmatter/SKILL.md), [moss-comments](../../moss-comments/SKILL.md), [moss-wiki-links](../../moss-wiki-links/SKILL.md), [moss-mockup](../../moss-mockup/SKILL.md).
