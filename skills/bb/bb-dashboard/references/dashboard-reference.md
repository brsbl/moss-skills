# Dashboard Reference

Read [../SKILL.md](../SKILL.md) first. Dashboards are valid Moss note directories.

## Minimal Dashboard Template

```markdown
# <Workstream Title>

## Overview

| Item | Value |
| --- | --- |
| Goal |  |
| Stage |  |
| Branch/PR |  |
| Next action |  |

## Active Work

| Lane | Owner | Thread/env | Status | Next action | Blocker |
| --- | --- | --- | --- | --- | --- |

## Decisions

| ID | Decision | Owner | Status | Needed by |
| --- | --- | --- | --- | --- |

## Evidence

| Artifact | Link/path | Status |
| --- | --- | --- |

## Risks / Blockers

## Changelog
```

## Update Rules

- Update before workers start, after material deltas, after completions, and after PR/merge/check state changes.
- Link long plans/reviews/logs instead of pasting them.
- Keep worker completion separate from manager acceptance/merge.
- Use tables for status, callouts for blockers/decisions, tabs only for large parallel sections.

## Valid Path Example

```text
~/Moss/Notes/Agent Workspaces/bb Workspace/workstreams/<slug>/<Workstream Title>/<Workstream Title>.md
```

Do not create `dashboard.md` as a loose file in the folder.
