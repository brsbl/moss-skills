# Summary Reference

## Output Location

Write summary artifacts under:

```text
~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/summaries/
```

Use a dated file, for example `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/summaries/2026-05-18-handoff.md`. Link the current summary from `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/dashboard.md`. Follow the shared human-readable artifact guidance in [../../WORKFLOWS.md](../../WORKFLOWS.md).

## Access Gate

Before writing the summary, confirm access to:

- dashboard and worker roster
- implementation plan and changed-file scopes
- QA report under `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/qa/`
- verification reports, screenshots, and logs under `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/verification/`
- review report and disposition
- validation command results, especially `moss verify`
- PR link or handoff target when one exists

If required evidence is missing, stop and ask the manager to supply it, move it into the workstream, verify it directly, or ask the user. Do not summarize unknown state as complete.

## Diff Basis

Use a merge-base diff for the change summary:

```bash
BASE_BRANCH=${BASE_BRANCH:-main}
BASE_SHA=$(git merge-base "$BASE_BRANCH" HEAD)
git diff --stat "$BASE_SHA"..HEAD
git diff --name-only "$BASE_SHA"..HEAD
git log --oneline "$BASE_SHA"..HEAD
```

When the workstream used an integration branch, use that branch as `BASE_BRANCH`.

## What to Include

Cover:

- what changed and why it matters
- worker scopes and ownership
- validation evidence, including `moss verify`
- QA verdict and report link
- verification verdict plus screenshot/log links
- review disposition, including unresolved P0/P1/P2 or accepted risks
- product failures fixed during the loop
- tooling blockers and any `HUMAN` checks
- plan divergence and manager/user decisions
- PR status or handoff instructions

Use local paths for private repo artifacts. Avoid remote code links unless the manager/user asks for them.

## Workflow

1. Read the dashboard first; it is the canonical user review surface.
2. Collect merge-base diff stats and changed-file list.
3. Read only the relevant implementation, QA, verification, and review artifacts.
4. Confirm gate status: verification before review for UI/screenshot/user-flow work, QA first-class, and `moss verify` as the Moss hard gate.
5. Write the summary under `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/summaries/`.
6. Link the summary from the dashboard, then link QA, verification, review, and PR/handoff artifacts from the dashboard.

## Summary Shape

```markdown
# Handoff Summary: <workstream>

Dashboard: `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/dashboard.md`
Base: `<branch>` at `<merge-base-sha>`
Head: `<head-sha>`

## Verdict

PASS | BLOCKED | DECISION NEEDED | HANDOFF READY

## What Changed

- <user-facing or architectural change>

## Worker Scopes

| Worker | Scope | Status | Notes |
|---|---|---|---|

## Evidence

| Area | Status | Link |
|---|---|---|
| Validation | `moss verify`: PASS/FAIL/NOT RUN | <path or command log> |
| QA | PASS/BLOCKED/DECISION NEEDED/NOT RUN | `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/qa/...` |
| Verification | PASS/BLOCKED/HUMAN/NOT RUN | `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/verification/...` |
| Review | PASS/BLOCKED/DECISION NEEDED/NOT RUN | `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/reviews/...` |

## Screenshots and Logs

- <path>

## Review Disposition

- Fixed:
- Accepted:
- Deferred:

## Risks and Follow-Up

- Product risks:
- Tooling blockers:
- HUMAN checks:

## PR or Handoff

- PR:
- Merge readiness:
- Next owner:
```

## Manager Responsibilities

Before sending a summary, the manager must:

- Gather missing artifacts.
- Clarify ambiguous gate results.
- Distinguish product failures from tooling blockers.
- Link evidence paths from the dashboard.
- Escalate unresolved decisions to the user.
