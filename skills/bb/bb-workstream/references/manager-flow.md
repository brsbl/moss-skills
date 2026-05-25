# Manager Flow Reference

Read [../../WORKFLOWS.md](../../WORKFLOWS.md) first. This file is copy/paste material for managers.

## Valid Moss Workstream Note Shape

New durable artifacts under `~/Moss/Notes/**` are note directories:

```text
~/Moss/Notes/Agent Workspaces/bb Workspace/workstreams/<slug>/
  <Dashboard Title>/<Dashboard Title>.md
  Workers — <Title>/Workers — <Title>.md
  plans/<Plan Title>/<Plan Title>.md
  qa/<QA Title>/<QA Title>.md
  verification/<Verification Title>/<Verification Title>.md
  reviews/<Review Title>/<Review Title>.md
  summaries/<Summary Title>/<Summary Title>.md
```

Use [../../../moss-notes/SKILL.md](../../../moss-notes/SKILL.md). Do not create flat `.md` files as durable Moss notes.

## Before Spawning Workers

Tell the user:

```text
Worker objective:
Provider/model:
Owned files:
Forbidden files:
Validation/evidence:
Expected final report:
```

Record in dashboard:

```text
Thread:
Environment:
Base/integration branch:
Stage:
Owner:
Next gate:
Blocker:
Evidence:
```

## Worker Handoff Skeleton

```text
Objective:
Done when:

Read first / Skills to apply:
- skills/bb/WORKFLOWS.md
- skills/bb/<stage>/SKILL.md
- skills/moss-notes/SKILL.md if writing under ~/Moss/Notes/**
- <repo docs, issue, PR, screenshot, spec, note, or external docs>

Owned files:
Forbidden files:
Source context:
Integration branch/base:
Validation:
Evidence/output:

Coordination:
- You are not alone in the repo; do not revert others' work.
- Return access report, then plan. Wait for manager approval before edits.
- Report changed files, validation, evidence, divergence, blockers, and risks.
```

## Spawn Snippets

Fresh worker:

```bash
bb thread spawn --new-environment worktree --base-branch <branch> --permission-mode full --provider codex --model gpt-5.5 --reasoning-level xhigh --prompt "<prompt>" --json
```

Readonly review in same environment:

```bash
bb thread spawn --environment <env-id> --permission-mode readonly --provider codex --model gpt-5.5 --reasoning-level xhigh --prompt "<review prompt>" --json
```

Merge a passed environment:

```bash
bb environment squash-merge <env-id> --merge-base-branch <integration-branch>
```

## Delta Update Request

```text
Report only what changed since your last update:
- plan/divergence
- files changed
- validation run/result
- blockers
- evidence paths
- risks or decisions needed
```

## Divergence Report

```text
What changed from approved plan:
Why:
Files/behavior affected:
Validation impact:
Manager/user decision needed:
```

## Completion Gate

- diff merged or intentionally dropped
- focused validation recorded
- UI/user-flow evidence linked when applicable
- QA/review findings resolved, accepted, or parked with owner/rationale
- `moss verify` status recorded when relevant
- dashboard/summary links evidence, commits, risks, and follow-ups
