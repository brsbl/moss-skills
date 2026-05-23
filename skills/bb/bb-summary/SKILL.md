---
name: bb-summary
description: Use to produce final Moss bb workstream summaries, PR or handoff notes, and manager-to-user status updates after dashboard, implementation, verification, QA, review, validation, risks, decisions, and merge evidence are available.
---

# Moss BB Summary

Use this skill to produce the final workstream summary, PR/handoff notes, or manager-to-user status update after implementation, verification, QA, and review evidence is available.

## Inputs

- Dashboard and worker roster.
- Implementation plans, changed-file scopes, merge-base diff, and commit log.
- QA report, verification reports, screenshots, logs, review report, and validation results.
- `moss verify` status, PR link or handoff target, decisions, accepted risks, tooling blockers, and `HUMAN` checks.

## Steps

1. Read the dashboard first; it is the canonical user review surface.
2. Stop if required evidence is missing; ask the manager to supply, move, verify, or escalate it.
3. Collect merge-base diff stats, changed-file list, and commit log.
4. Read only relevant implementation, QA, verification, and review artifacts.
5. Confirm gate status: verification before review when needed, QA gate, and `moss verify` hard gate.
6. Write the summary under `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/summaries/`. Default to a single summary owner; parallelize section drafting only when the workstream spans genuinely independent sub-workstreams or child managers, and reconcile through one final synthesis. See [Parallelization And Fanout](../bb-workstream/references/manager-flow.md#parallelization-and-fanout).
7. Link the summary, QA, verification, review, and PR/handoff artifacts from the dashboard.

## Outputs

- Final summary or handoff note with verdict, what changed, worker scopes, evidence, screenshots/logs, review disposition, risks, follow-up, and PR or handoff status.
- Updated dashboard links to the current summary and supporting evidence.

## Validation

- Missing evidence is not summarized as complete.
- Product failures, tooling blockers, accepted risks, and `HUMAN` checks are distinct.
- Local paths are used for private repo artifacts unless the manager/user asks for remote links.

## References

- Detailed access gate, diff basis, summary contents, workflow, and report template: [references/summary-reference.md](references/summary-reference.md).
- Moss note authoring rules: [moss-notes](../../moss-notes/SKILL.md), [moss-frontmatter](../../moss-frontmatter/SKILL.md), [moss-comments](../../moss-comments/SKILL.md), [moss-wiki-links](../../moss-wiki-links/SKILL.md), [moss-mockup](../../moss-mockup/SKILL.md).
