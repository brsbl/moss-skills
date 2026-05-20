# Planning Reference

## Source Inputs

Start from the strongest source of truth available:

- User instructions in the current bb thread.
- A Moss note path under `~/Moss/Notes/` when provided.
- Existing repo docs such as `AGENTS.md` or `CLAUDE.md`, `docs/style-guide.md`, `docs/node-spec.md`, and `docs/data-model.md`.
- Existing bugs, issues, screenshots, QA notes, verification reports, or PR feedback.
- Current code and tests.

For Moss note creation and editing rules, follow the Moss note skills instead of duplicating note-format instructions here: [moss-notes](../../moss-notes/SKILL.md), [moss-frontmatter](../../moss-frontmatter/SKILL.md), [moss-comments](../../moss-comments/SKILL.md), and [moss-wiki-links](../../moss-wiki-links/SKILL.md).

## Planning Depth

Choose the smallest sufficient planning level:

- One-pass task: small, clear, low-risk work with obvious files and validation. State scope, acceptance criteria, and validation directly in the worker prompt and dashboard row.
- Existing note as source of truth: when a Moss note already defines the task, cite that note and plan only the missing implementation details, dependencies, and validation.
- Lightweight implementation plan: medium work that needs file ownership, sequencing, or multiple gates. Save it under `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/plans/`.
- Spec or design note: ambiguous, cross-cutting, new product behavior, editor architecture changes, IPC contract changes, storage changes, or UI behavior that needs user approval before implementation.

Do not create formal planning artifacts for their own sake. Do create them when they prevent worker drift, file conflicts, hidden dependencies, or unclear acceptance criteria.

## Context And Evidence Gate

Planning stops when acceptance depends on an artifact the planner cannot inspect: attachment, reference note, screenshot, app state, test target, branch, account state, or running environment.

The planner reports exactly what is missing and why it affects acceptance. The manager supplies it, verifies it, moves it into the workstream artifacts, or asks the user. Do not plan from a summary when the original evidence is required to judge success.

## Plan Checklist

A useful Moss plan answers:

- Goal: user-facing outcome or internal correctness outcome.
- Non-goals: behavior or files that stay unchanged.
- Source of truth: notes, docs, files, screenshots, comments, or decisions used.
- Owned files: exact write scope and any off-limits files.
- Dependencies: sequencing, shared files, required decisions, and integration branch.
- Conflict risk: files or modules likely to overlap with other workers.
- Acceptance criteria: observable behavior, data integrity, performance, or API contract.
- Validation: focused tests, type checks, `moss verify` need, screenshot or user-flow verification, manual QA, or evidence path.
- Review risk: areas that need targeted review or same-environment inspection.
- Output: summary, changed files, validation results, evidence links, plan divergence, and risks.

For Lexical, Jotai, IPC, markdown layers, storage, and note-switch behavior, include the relevant Moss invariants from `AGENTS.md` or `CLAUDE.md` in the plan rather than relying on generic React or Electron assumptions.

## Task Decomposition

Split work into scopes a single worker can complete in one environment:

- Prefer one coherent module or feature slice per worker.
- Keep shared files under one owner or sequence the work explicitly.
- Separate investigation, implementation, QA, screenshot or user-flow verification, and review when they need different permissions or evidence.
- Give each scope a stable slug for filenames, dashboard rows, and evidence.
- Include dependencies only when one scope truly cannot start before another finishes.

Use stage groups for high concurrency: foundation work first, dependent implementation second, QA or verification third, review and integration last. Record stage membership in `dashboard.md`.

## Worker-Ready Plan Format

For medium or larger work, save a concise plan:

```markdown
# <Workstream>: <Scope>

## Objective
What this worker or stage must deliver.

## Scope
Owned files, forbidden files, dependencies, and source-of-truth links.

## Approach
The intended implementation or investigation path.

## Acceptance
Observable behavior, contracts, and non-goals.

## Validation
Commands, screenshot targets, QA evidence, and expected artifacts.

## Risks
Known conflict points, missing evidence, and review focus.
```

## Approval And Divergence

Workers must report divergence from the approved plan with the reason, affected files, behavior change, and validation impact. The manager records it in the dashboard and either approves, redirects, or escalates to the user. Any change to user-facing behavior, acceptance criteria, or file ownership needs explicit manager approval before continuing.

## Planning Output

Finish planning with:

- Workstream artifact path.
- Worker scopes and ownership.
- Dependency order and stage grouping.
- Required decisions and evidence gaps.
- Validation and review gates.
- Dashboard rows or updates needed before workers start.
