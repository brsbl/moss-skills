# Dashboard Reference

## Purpose

Use the dashboard to answer, at a glance:

- What is active, blocked, in QA or verification, in review, merged, or complete.
- Which worker owns which files and what each worker needs next.
- Which provider/model is assigned when known, without treating provider choice as a substitute for scope or evidence.
- What decisions are pending and who owns them.
- What plan divergence has been proposed, approved, redirected, or escalated.
- Where to find plans, QA, verification, reviews, screenshots, summaries, commits, and risks.

Aim for concise status sections, counts, evidence links, and a short history of decisions. Use the skeleton in "Dashboard Template" as a starting point, then remove sections that do not apply.

## Artifact Layout

Each workstream uses:

```text
~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/
  dashboard.md
  workers.md
  plans/
  qa/
  verification/
  reviews/
  summaries/
```

Keep detailed evidence in the matching subdirectory. Link it from the dashboard instead of embedding long logs.

Store this artifact tree under the Moss workspace (`~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/`), outside the repo checkout. Repo changes should contain only code/docs intended for commit.

## Required Sections

Start new dashboards with these sections, then remove irrelevant sections:

- Overview: current state, integration branch, latest manager decision, and next gate.
- Quick summary: counts by stage and high-level risk.
- Worker roster: worker, provider/model when known, thread, environment, owned files, stage, blocker, next output.
- Stage board: intake, planning, implementation, QA or verification, review, merge, summary, cleanup.
- Decision queue: pending user or manager decisions with owner and deadline when relevant.
- Plan divergence: proposed changes from approved plans, reason, status, and approver.
- Evidence index: plans, QA, verification, reviews, screenshots, logs, summaries, commits, PRs.
- Merge state: worker environments, merge status, integration validation, and remaining risks.

For parent managers, add a child-manager roll-up when work is delegated across managers:

- Child dashboards: link each child dashboard and summarize current stage.
- Child decision queues: list only decisions that need parent or user action.
- Cross-workstream risks: shared files, integration branch conflicts, common blockers, accepted risks, and merge readiness.

Existing dashboards can keep their current headings and table vocabulary if they already make those facts visible.

## Status And Roster Guidance

Use stable IDs for rows: task slug, worker label, thread ID, environment ID, PR number, or commit. Do not encode state in task titles. Put state in status columns and section placement.

Recommended roster columns:

| Worker | Provider / Model | Stage | Scope | Owned Files | Thread / Environment | Next Gate | Blocker | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Worker A | known provider/model or pending | implementation | concise objective | `path/a.ts` | thread and env IDs | focused validation | none | plan or diff |

Recommended decision columns:

| ID | Decision Needed | Owner | Affects | Status | Evidence |
| --- | --- | --- | --- | --- | --- |
| decision-slug | approve, redirect, supply artifact, accept risk | user or manager | workers/files | pending | link |

Recommended divergence columns:

| ID | Worker | Divergence | Reason | Impact | Status | Evidence |
| --- | --- | --- | --- | --- | --- | --- |
| scope-slug | Worker A | changed approach | why | files/validation | proposed | plan link |

## Update Rules

- Update the dashboard before starting workers, after implementation-plan approval, after each material worker delta, after every blocker, after plan divergence, after verification, after manager first pass, after same-environment readonly review, after QA/hard-gate status, after merge, and before final summary.
- Prefer delta updates over transcript summaries: what changed, what evidence proves it, what decision is next.
- Record provider/model when known, and record the override reason when a worker intentionally differs from the default provider selection.
- Preserve historical evidence links and decision notes unless the user asks for cleanup.
- Keep unresolved P0/P1 review findings and failed acceptance checks visible until fixed or explicitly accepted.
- Mark worker-reported completion separately from manager merge and final completion.
- Link to sibling artifacts instead of pasting long plans, logs, screenshots, or reviews.

## Context And Evidence Gate

If a dashboard row depends on evidence the manager cannot inspect, mark the item as blocked with the exact missing artifact and owner. The manager supplies or verifies the artifact when possible; otherwise ask the user immediately. Do not convert an acceptance-critical artifact into a paraphrased dashboard claim.

## High-Concurrency Dashboarding

For many workers, group rows by stage and sort by next required manager action. Keep a separate ownership map in `workers.md` when the dashboard would become too wide.

Surface these high-concurrency signals:

- File ownership and dependencies that can cause merge conflicts.
- Workers waiting on manager action.
- Workers waiting on another worker.
- Workers missing context or verification targets.
- Decisions that block multiple scopes.
- Divergence from approved plans.
- Integration branch validation status.

## Validation

Before handing off a dashboard update:

- All active workers have scope, owner, next gate, and evidence.
- All blockers have owner and needed decision or artifact.
- All plan divergence has status and approver or escalation path.
- QA, verification, review, summary, and merge evidence is linked where applicable.
- Counts in the quick summary match the visible rows.
- The dashboard remains concise enough for user review without opening bb thread logs.

## Node Type Guidance

The dashboard is a Moss note. Pick node types that match each section's job; follow [moss-notes](../../../moss-notes/SKILL.md) for syntax and constraints.

- Tables for the worker roster, decision queue, and plan divergence — scannable rows with stable columns.
- Callouts (`info`, `warning`, `priority`) for the latest manager decision, active blockers, and items needing user action so they stand out from the prose.
- Tabs for large workstreams with multiple parallel stage boards, worker groups, or environments — keep to 2-4 tabs.
- Charts only when a trend or comparison is clearer than a small table; prefer `bar` or `line`.
- `moss-html` only when expansive interactivity is worth the cost (status maps, embeds); never as a substitute for the standard sections.
- Wiki links via [moss-wiki-links](../../../moss-wiki-links/SKILL.md) for cross-note references to plans, QA, verification, reviews, and summaries.
- Frontmatter via [moss-frontmatter](../../../moss-frontmatter/SKILL.md) when the dashboard needs queryable metadata; comments via [moss-comments](../../../moss-comments/SKILL.md) for inline annotations or follow-ups.

## Dashboard Template

Use this skeleton as a starting point. Remove sections that do not apply and keep cell contents short — link out instead of inlining long evidence. The outer fence below uses four backticks so the inner `moss-callout` block survives the example; in the real dashboard, use a single three-backtick fence per block.

````markdown
# <Workstream Slug>

## Overview

- Integration branch: `<branch>`
- Latest manager decision: <decision + date>
- Next gate: <what unblocks the next stage>

```moss-callout
priority
Active blocker or decision needing user action. Remove when resolved.
```

## Quick Summary

- Workers active: N | blocked: N | merged: N
- Risk level: <low | medium | high> — one-line reason

## Stage Board

- Intake / planning: <worker slugs>
- Implementation: <worker slugs>
- QA / verification: <worker slugs>
- Review: <worker slugs>
- Merge / summary / cleanup: <worker slugs>

## Worker Roster

| Worker | Provider / Model | Stage | Scope | Owned Files | Thread / Env | Next Gate | Blocker | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| <slug> | <provider/model> | <stage> | <objective> | `path/a.ts` | `thr_…` / `env_…` | <gate> | <none or owner> | <link> |

## Decision Queue

| ID | Decision Needed | Owner | Affects | Status | Evidence |
| --- | --- | --- | --- | --- | --- |
| <slug> | <approve / redirect / supply / accept> | <user or manager> | <workers/files> | pending | <link> |

## Plan Divergence

| ID | Worker | Divergence | Reason | Impact | Status | Evidence |
| --- | --- | --- | --- | --- | --- | --- |
| <slug> | <worker> | <change> | <why> | <files/validation> | proposed | <plan link> |

## Evidence Index

- Plans: <links>
- QA: <links>
- Verification: <links + screenshot/log paths>
- Reviews: <links + finding dispositions>
- Summaries: <links>
- Commits / PRs: <local paths or PR refs>

## Merge State

- Worker environments: <env IDs and merge status>
- Integration validation: `moss verify` <PASS | FAIL | NOT RUN> with evidence link
- Remaining risks: <one-line items>
````

For larger workstreams, wrap the per-stage detail in tabs to keep the page scannable:

```markdown
:::tabs
=== Implementation
<roster rows and decisions scoped to this stage>

=== QA / Verification
<rows, evidence links, blockers>

=== Review / Merge
<rows, dispositions, merge state>
:::
```
