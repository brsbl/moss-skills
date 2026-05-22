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
4. Make every plan follow the human-readable written artifact guidance in [../WORKFLOWS.md](../WORKFLOWS.md): optimize for skimmability, decisions, next actions, evidence, and minimal cognitive load.
5. When a plan includes a mockup, UI proposal, or prototype, use `moss-html` for that mockup portion if visual or interactive rendering helps humans understand it.
6. Use canvas/`moss-canvas` for wireframes, flows, and diagrams.
7. Keep plain prose and planning details in Markdown.
8. Use emojis sparingly in human-facing plan Markdown only when they improve scanability or status recognition; pair them with clear words or labels.
9. Define objective, non-goals, owned files, forbidden files, dependencies, acceptance criteria, validation, and review risk.
10. Include Moss-specific invariants from `AGENTS.md` or `CLAUDE.md` for Lexical, Jotai, IPC, markdown layers, storage, or note-switch behavior when affected.
11. **Search for existing precedence before designing new effects.** If the work would introduce a new write, IPC channel, migration, lifecycle hook, transformer, decorator, atom, fs walk, or similar effect class, first grep the codebase for an existing framework that already handles that effect class (e.g. `note-markdown-migration-runner.ts` for markdown migrations, `ipcChannels.ts` for IPC, `tokens.css` for color tokens). The default is to register with the existing framework. Inventing a new path requires an explicit documented justification (what's wrong with the existing pattern for this case) in the plan.
12. Require manager approval before implementation for medium, risky, cross-file, or user-facing work.

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
- Shared written artifact guidance: [../WORKFLOWS.md](../WORKFLOWS.md).
- Moss note authoring rules: [moss-notes](../../moss-notes/SKILL.md), [moss-frontmatter](../../moss-frontmatter/SKILL.md), [moss-comments](../../moss-comments/SKILL.md), [moss-wiki-links](../../moss-wiki-links/SKILL.md), [moss-mockup](../../moss-mockup/SKILL.md).
