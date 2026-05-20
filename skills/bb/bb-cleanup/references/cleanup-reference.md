# Cleanup Reference

## Cleanup Rule

Do not delete useful workstream artifacts by default. Preserve dashboard, worker roster, approved plans, QA reports, verification screenshots and logs, review reports, summaries, and any decision history that explains what shipped or why work stopped.

Cleanup is allowed only after the manager verifies:

- no active worker or manager thread still depends on the environment
- no dirty or unmerged worker worktree contains useful changes
- required QA, verification, review, and summary evidence is preserved
- the dashboard records final status or the reason cleanup is happening

## Inventory

Start by listing worker and manager state:

```bash
bb thread list --parent-thread <manager-thread-id>
bb thread show <thread-id> --work-status
bb thread log <thread-id> --format json --limit 20
bb environment show <worker-env-id>
```

For each worker environment, also inspect the worktree path reported by bb:

```bash
git status --short
git branch --show-current
```

If a thread or environment cannot be accessed, record that as an access blocker in the dashboard and preserve the related worktree and evidence until the manager or user decides what to do.

## Safety Gates

Active work blocks cleanup unless the manager or user explicitly cancels it. Treat these as active-work signals:

- worker thread still running or waiting on manager input
- reviewer or verifier still running
- dashboard shows pending decisions or unresolved P0/P1 findings
- environment has dirty files
- worker output has not been squash-merged or intentionally abandoned
- verification, QA, review, or summary links are missing

Dirty or unmerged worktrees must be inspected before cleanup. If the changes are intended to ship, return to the implementation skill and use:

```bash
bb environment squash-merge <worker-env-id> --merge-base-branch <integration-branch>
```

If the changes are abandoned, preserve enough evidence to explain why.

## Preserve Evidence

Before removing any generated files or archiving threads, confirm the dashboard links to:

- worker roster and final status
- implementation plans that affected scope
- QA report, if used
- verification report with screenshots or logs, if used
- review report and finding decisions
- final summary or handoff

Do not remove referenced screenshots, logs, review notes, or QA artifacts. If evidence is large, move it only with explicit manager approval and update links in the dashboard.

## Cleanup Actions

Prefer archiving over deletion:

```bash
bb thread archive <thread-id>
```

Use permanent thread deletion only when the manager or user explicitly confirms that no useful history will be lost:

```bash
bb thread delete <thread-id> --yes
```

The local bb help for environments may not provide an environment delete command. Do not invent one. If environment removal is needed, confirm the current bb help and repository policy first, then verify the environment has no dirty or unmerged work.

Temporary files may be removed only when all are true:

- the path is inside the workstream or worker worktree being cleaned
- the file is not linked by dashboard, QA, verification, review, or summary artifacts
- `git status --short` shows no useful untracked or modified work
- the manager or user has approved destructive cleanup when the file is not obviously disposable

Never remove the integration branch, the manager's current worktree, unmerged worker worktrees, or preserved evidence as part of routine cleanup.

## Final Cleanup Report

Record a short cleanup result in the dashboard or final summary:

- threads archived or intentionally left open
- environments preserved or ready for external removal
- dirty or unmerged worktrees found
- evidence preserved
- anything that still needs manager or user action
