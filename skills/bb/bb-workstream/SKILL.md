---
name: bb-workstream
description: "Use when managing a Moss bb workstream across threads/environments: source of truth, dashboard, worker roster, ownership, blockers, verification, QA, review, PR/merge state, and cleanup."
---

# Moss BB Workstream

## When To Use

Use this to run a bb-managed development effort end-to-end or to coordinate multiple managers/workers.

## Read First
- ../WORKFLOWS.md
- references/manager-flow.md
- references/provider-selection.md
- references/architecture-setup.md
- ../../moss-notes/SKILL.md when writing workstream artifacts under ~/Moss/Notes/**

## Steps
1. Establish source of truth, scope, acceptance criteria, constraints, and evidence gaps.
2. Create or update the canonical dashboard and worker roster before substantive work starts.
3. Split independent work into owned slices; sequence shared files.
4. Keep blockers, decisions, divergence, validation, and PR/merge state visible.
5. Route through planning, implementation, verification, QA, review, summary, and cleanup gates as needed.

## Outputs
- Canonical dashboard
- Worker roster and ownership map
- Decision queue, blockers, risks, evidence links
- Merge/PR and cleanup state

## Validation
- Every worker has owner/scope/next gate/evidence.
- Every blocker has owner and needed decision/artifact.
- Verification precedes review for UI/user-flow work.
- Final status links evidence, not just thread transcripts.

## References
- Provider commands: [references/provider-selection.md](references/provider-selection.md)
- Architecture/runtime blockers: [references/architecture-setup.md](references/architecture-setup.md)
- Manager prompts and checklists: [references/manager-flow.md](references/manager-flow.md)
