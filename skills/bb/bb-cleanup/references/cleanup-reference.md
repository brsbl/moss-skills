# Cleanup Reference

Read [../SKILL.md](../SKILL.md) first.

## Inventory Commands

```bash
bb thread list --parent-thread <manager-id>
git status --short
git branch --show-current
```

## Cleanup Checklist

- active workers/managers are complete or intentionally stopped
- dirty worktrees inspected and preserved/dropped intentionally
- dashboards, plans, QA, verification, reviews, summaries, screenshots, and decisions are linked
- PR/merge state recorded
- branches/worktrees not needed by follow-up work

## Cleanup Report Template

```markdown
# Cleanup — <Workstream>

## Archived / kept / stopped

| Item | Action | Reason |
| --- | --- | --- |

## Preserved evidence

## Dirty or retained worktrees

## Remaining actions
```

Archive by default. Delete only with explicit approval or clearly disposable, unreferenced state.
