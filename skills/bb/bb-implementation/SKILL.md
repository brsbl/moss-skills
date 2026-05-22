---
name: bb-implementation
description: Use when a bb manager assigns scoped Moss implementation work to worker environments, covering provider defaults, clean worktree setup, architecture checks, worker handoff, plan approval before edits, divergence handling, validation, verification-before-review, QA/review routing, moss verify, and squash merge.
---

# Moss BB Implementation

Use this skill to assign and drive scoped implementation work in a bb workstream. The manager remains active: context, environment access, file ownership, validation, and exit criteria must be clear before implementation starts.

## Inputs

- Approved or manager-ready scope, source context, integration branch, owned paths, forbidden paths, and acceptance criteria.
- Provider/model default or override reason.
- Validation commands, `moss verify` expectations, UI/user-flow verification targets, and expected final output.
- Dashboard and worker roster paths.

## Steps

1. Verify the integration checkout is clean and usable before creating worker environments.
2. Confirm architecture setup from the shared reference before assigning workers or running verification.
3. Start each implementation worker in a separate worktree from the integration branch.
4. Require an initial access report, then require a concise implementation plan before edits.
5. Approve, revise, or block the plan; record durable plans under `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/plans/` when useful.
6. Watch for blockers, shared-file dependencies, environment failures, and plan divergence during implementation.
7. Require changed files, focused validation, `moss verify` status, UI verification evidence when applicable, and unresolved risks.
8. Route ready work through verification, QA, manager first pass, same-environment review, hard gate, and squash merge.

## Outputs

- Worker prompt with objective, done conditions, owned files, forbidden files, validation, output format, and coordination rules.
- Updated dashboard and `workers.md` with thread IDs, environments, providers/models, worktree paths, blockers, plans, validation, and merge state.
- Merged or explicitly blocked worker environment with evidence links.
- Worker plans, dashboard updates, and handoff notes follow the shared written artifact guidance so decisions, blockers, next actions, and evidence are easy to scan.

## Validation

- No worker starts from an unknown, dirty, or inaccessible base.
- Workers wait for manager approval before editing.
- Plan divergence is approved, redirected, or escalated before drift.
- UI/user-flow work has verification evidence before review.
- `moss verify` passes before squash merge, or the blocker is recorded with owner and next action.

## References

- Detailed worker lifecycle, handoff prompts, access checks, and merge flow: [references/worker-lifecycle.md](references/worker-lifecycle.md).
- Provider defaults: [../bb-workstream/references/provider-selection.md](../bb-workstream/references/provider-selection.md).
- Exact architecture setup commands: [../bb-workstream/references/architecture-setup.md](../bb-workstream/references/architecture-setup.md).
- Shared manager flow: [../bb-workstream/references/manager-flow.md](../bb-workstream/references/manager-flow.md).
- Shared written artifact guidance: [../WORKFLOWS.md](../WORKFLOWS.md).
- Moss note authoring rules: [moss-notes](../../moss-notes/SKILL.md), [moss-frontmatter](../../moss-frontmatter/SKILL.md), [moss-comments](../../moss-comments/SKILL.md), [moss-wiki-links](../../moss-wiki-links/SKILL.md), [moss-mockup](../../moss-mockup/SKILL.md).
