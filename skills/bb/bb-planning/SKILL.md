---
name: bb-planning
description: "Use when turning Moss notes, issues, specs, prompts, screenshots, PR feedback, or manager context into scoped plans with ownership, acceptance criteria, validation, evidence, and approval gates."
---

# Moss BB Planning

## When To Use

Use this to make work executable without drift, file conflicts, hidden dependencies, or vague acceptance criteria.

## Read First
- ../WORKFLOWS.md
- references/planning-reference.md
- ../../moss-notes/SKILL.md for plans/specs under ~/Moss/Notes/**
- ../../moss-mockup/SKILL.md for moss-html mockups
- ../../moss-wiki-links/SKILL.md for note links

## Steps
1. Start from the strongest source of truth and inspect acceptance-critical artifacts.
2. Choose the lightest useful plan depth: dashboard row, note addendum, plan, or full spec.
3. Define objective, non-goals, owned files, forbidden files, dependencies, acceptance criteria, validation, evidence, and review risk.
4. Search existing code/docs for precedent before proposing new effects or architecture.
5. Get manager/user approval before implementation for non-trivial work.

## Outputs
- Worker-ready scope
- Acceptance criteria and validation plan
- Dependency/parallelization plan
- Dashboard updates before workers start

## Validation
- Every scope has exact ownership and off-limits paths.
- Every acceptance criterion has validation/evidence.
- Evidence gaps are blockers, not guesses.
- Plan divergence requires approval before implementation.

## References
- Planning templates: [references/planning-reference.md](references/planning-reference.md)
- Worker handoff: [../bb-implementation/SKILL.md](../bb-implementation/SKILL.md)
- Workstream manager flow: [../bb-workstream/references/manager-flow.md](../bb-workstream/references/manager-flow.md)
