---
name: bb-planning
description: Use when turning Moss notes, issues, specs, user prompts, PR feedback, screenshots, or bb manager context into scoped work with source-of-truth links, ownership, acceptance criteria, validation, evidence gates, and plan approval.
---

# Moss BB Planning

Use this skill to create the lightest useful plan for a Moss bb workstream or worker scope. Planning should prevent drift, file conflicts, hidden dependencies, and unclear acceptance criteria.

## Inputs

- Current bb thread instructions and manager decisions.
- Moss note path under `~/Moss/Notes/`, when provided.
- Repo docs such as `AGENTS.md` or `CLAUDE.md`, `docs/style-guide.md`, `docs/node-spec.md`, and `docs/data-model.md`.
- Existing bugs, issues, screenshots, QA notes, verification reports, PR feedback, code, and tests.

## Steps

1. Start from the strongest source of truth available.
2. Stop if an acceptance-critical artifact cannot be inspected; ask the manager to supply or verify it.
3. Choose the smallest sufficient plan depth: dashboard row, existing note addendum, lightweight plan, or full spec/design note.
4. Define objective, non-goals, owned files, forbidden files, dependencies, acceptance criteria, validation, and review risk.
5. Include Moss-specific invariants from `AGENTS.md` or `CLAUDE.md` for Lexical, Jotai, IPC, markdown layers, storage, or note-switch behavior when affected.
6. Require manager approval before implementation for medium, risky, cross-file, or user-facing work.

## Outputs

- Worker-ready scope, ownership, acceptance criteria, validation, and evidence requirements.
- Dependency order and stage grouping for implementation, verification, QA, review, and merge.
- Plan artifact under `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/plans/` when durable planning is useful.
- Dashboard rows or updates needed before workers start.

## Validation

- Every planned scope has exact write ownership and off-limits paths.
- Every acceptance criterion has a validation or evidence path.
- Evidence gaps are recorded as blockers instead of being paraphrased.
- Plan divergence requires manager approval before implementation continues.

## References

- Detailed planning depth, checklist, task decomposition, and plan template: [references/planning-reference.md](references/planning-reference.md).
- Shared workstream gates and manager flow: [../bb-workstream/references/manager-flow.md](../bb-workstream/references/manager-flow.md).
- Moss note authoring rules: [moss-notes](../../moss-notes/SKILL.md), [moss-frontmatter](../../moss-frontmatter/SKILL.md), [moss-comments](../../moss-comments/SKILL.md), [moss-wiki-links](../../moss-wiki-links/SKILL.md), [moss-mockup](../../moss-mockup/SKILL.md).
