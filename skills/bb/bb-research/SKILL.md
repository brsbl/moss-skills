---
name: bb-research
description: Use when researching a product, feature, technical direction, or workstream idea before bb-planning or bb-workstream, including best practices, pitfalls, reference products, docs, UI examples, source links, options, risks, and planning inputs.
---

# Moss BB Research

Use this skill before planning when a product, feature, technical approach, or workstream needs source-backed context. Keep research bounded: gather enough evidence to guide the next planning decision, not an exhaustive market study.

## Inputs

- User idea, workstream goal, issue, PR feedback, note, screenshot, or manager question.
- Existing workstream slug or artifact path when one exists.
- Relevant product area, users, constraints, platform, integrations, and known decisions.

## Workflow

1. Frame the research question, scope, non-goals, and decision the research must support.
2. Use available search, fetch, docs, and browser tools to inspect high-quality sources.
3. Cover best practices, common pitfalls, popular or reference products, official docs or API references, and UI/reference examples when relevant.
4. Capture screenshots or browser evidence for UI/reference research when tooling and access are available. If not, record a clear `HUMAN-needed` or blocker note.
5. When research includes a mockup, wireframe, UI proposal, flow, or prototype, prefer `moss-html` for that mockup portion if visual or interactive rendering helps humans understand the recommendation; keep plain prose and evidence synthesis in Markdown.
6. Synthesize options with a recommendation, pros and cons, source links, assumptions, risks, open questions, and follow-up planning inputs.
7. Save durable research under `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/research/` using dated filenames.
8. Link the report from `dashboard.md` or planning artifacts only when those artifacts already exist.

## Outputs

- Source-backed research report with recommendation, options, pros and cons, risks, assumptions, open questions, and planning inputs.
- Evidence paths for screenshots, browser notes, source excerpts, or blockers.
- Explicit gaps where source quality, access, browser tooling, or account state limits confidence.
- Report shape follows the shared written artifact guidance so decisions, next actions, evidence, and gaps are easy to scan.
- Any mockup, wireframe, UI proposal, flow, or prototype uses `moss-html` for the mockup portion when that makes the research easier to understand.

## Validation

- Every key claim links to a source or is marked as an assumption.
- UI/reference claims include screenshot evidence when available or a `HUMAN-needed` blocker when not.
- Recommendation connects directly to planning choices, acceptance criteria, constraints, or follow-up questions.
- Research artifacts stay in the Moss workspace, not repo checkouts.

## References

- Research workflow, evidence rules, and report template: [references/research-reference.md](references/research-reference.md).
- Create/manage the broader workstream with [bb-workstream](../bb-workstream/SKILL.md).
- Turn research into scoped worker plans with [bb-planning](../bb-planning/SKILL.md).
- Link research reports from the canonical status surface with [bb-dashboard](../bb-dashboard/SKILL.md).
- Shared written artifact guidance: [../WORKFLOWS.md](../WORKFLOWS.md).
- Moss note authoring rules: [moss-notes](../../moss-notes/SKILL.md), [moss-frontmatter](../../moss-frontmatter/SKILL.md), [moss-comments](../../moss-comments/SKILL.md), [moss-wiki-links](../../moss-wiki-links/SKILL.md), [moss-mockup](../../moss-mockup/SKILL.md).
