---
name: bb-implementation
description: "Use when a bb manager assigns scoped implementation to workers: clean base, explicit skills to read, file ownership, plan-before-edits, validation, evidence, divergence, review, and merge handling."
---

# Moss BB Implementation

## When To Use

Use this after planning is approved and before any worker starts edits.

## Read First
- ../WORKFLOWS.md
- references/worker-lifecycle.md
- ../bb-workstream/references/architecture-setup.md
- ../bb-workstream/references/provider-selection.md
- ../../moss-notes/SKILL.md when worker outputs are Moss notes

## Steps
1. Confirm integration checkout/base is clean and current.
2. Write a worker handoff with objective, done conditions, owned/forbidden files, validation, evidence, and coordination rules.
3. Include `Read first / Skills to apply` with the stage skill and artifact skills.
4. Require an access report and plan before edits.
5. Approve, redirect, or escalate divergence; then route to verification/QA/review/merge.

## Outputs
- Worker prompt
- Updated dashboard/worker roster
- Validation/evidence report
- Merged or intentionally blocked worker environment

## Validation
- No worker starts from unknown/dirty/inaccessible base.
- Required skills are named in the handoff.
- Workers wait for plan approval before edits.
- UI/user-flow work has verification before review.

## References
- Worker prompts: [references/worker-lifecycle.md](references/worker-lifecycle.md)
- Manager flow: [../bb-workstream/references/manager-flow.md](../bb-workstream/references/manager-flow.md)
- Provider commands: [../bb-workstream/references/provider-selection.md](../bb-workstream/references/provider-selection.md)
