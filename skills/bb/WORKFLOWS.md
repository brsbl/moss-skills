# Default bb manager workflow instructions

This is the canonical bb workflow policy for Moss manager-led work. Manager templates and `PREFERENCES.md` should point here instead of copying or overriding policy.

## Start Here: Choose Stage + Artifact Skills

Before doing work, choose both:

1. **Stage skill** — the bb stage you are running now.
2. **Artifact skill** — the skill for the thing you will create or edit.

| If the work is about... | Read this first |
| --- | --- |
| Workstream setup, managers, workers, gates | [bb-workstream](bb-workstream/SKILL.md) |
| Research, product examples, APIs, docs, prior art | [bb-research](bb-research/SKILL.md) |
| Plans, specs, worker scopes, acceptance criteria | [bb-planning](bb-planning/SKILL.md) |
| Status dashboards, worker rosters, decision queues | [bb-dashboard](bb-dashboard/SKILL.md) |
| Worker handoffs, implementation, merges | [bb-implementation](bb-implementation/SKILL.md) |
| App/browser/Electron screenshots or behavior evidence | [bb-verification](bb-verification/SKILL.md) |
| QA gates and release checklists | [bb-qa](bb-qa/SKILL.md) |
| Review findings and dispositions | [bb-review](bb-review/SKILL.md) |
| Final summaries, handoffs, PR summaries | [bb-summary](bb-summary/SKILL.md) |
| Archiving threads/worktrees/artifacts | [bb-cleanup](bb-cleanup/SKILL.md) |
| PostHog runbooks or analytics reports | [bb-analytics](bb-analytics/SKILL.md) |
| Anything under `~/Moss/Notes/**` | [moss-notes](../moss-notes/SKILL.md) |
| YAML frontmatter | [moss-frontmatter](../moss-frontmatter/SKILL.md) |
| Moss comments or `comments.json` | [moss-comments](../moss-comments/SKILL.md) |
| `[[wiki links]]` | [moss-wiki-links](../moss-wiki-links/SKILL.md) |
| `moss-html` mockups/prototypes | [moss-mockup](../moss-mockup/SKILL.md) |

If writing a dashboard, plan, report, QA note, review, summary, research note, or mockup under `~/Moss/Notes/**`, read the relevant bb stage skill **and** `moss-notes`. Add the Moss subskills only when the artifact uses their syntax.

These bb workflow skills are checked in for bb manager-led workstreams. They are not the Codex app plugin surface; Codex plugin packaging should expose the top-level Moss note skills, not `skills/bb/**`.

## High-Level Workflow

Large work goes through the full workflow:

1. `bb-workstream` — set up the workstream, integration branch, ownership model, and manager responsibilities.
2. `bb-research` — gather evidence when external context, examples, APIs, docs, or UI references improve planning.
3. `bb-planning` — turn source material into scoped work with ownership, acceptance criteria, validation, and evidence gates.
4. `bb-dashboard` — create/update the canonical user review surface before work starts.
5. `bb-implementation` — hand off approved scopes with required skills, files, validation, and reporting expectations.
6. `bb-verification` — verify behavior before review, especially for UI, screenshots, Electron, browser, or user flows.
7. `bb-qa` — run a formal merge/release gate when risk, release scope, or user-facing behavior warrants it.
8. `bb-review` — perform manager first pass and same-environment readonly review for non-trivial changes.
9. `bb-summary` — summarize what changed, validation, verification, QA, review, risks, decisions, and PR/handoff state.
10. `bb-cleanup` — archive/clean threads and environments only after preserving useful artifacts.

Small tasks can abbreviate this flow, but planning, verification, and review still apply unless the user explicitly waives them.

## Non-Negotiables

- **Delegation-first by default:** managers coordinate; workers do substantive coding, edits, investigations, and multi-step analysis unless the user explicitly says otherwise.
- **Fresh base:** before spawning workers from the repo, fetch/pull the intended base and pass the base branch explicitly.
- **Plan before edits:** workers report source access and a short plan before changing files.
- **Name required skills in handoffs:** every worker prompt includes a `Read first / Skills to apply` section with the stage skill and any artifact skills.
- **One owner per write area:** parallelize independent work; sequence shared files.
- **Verify before review:** UI/user-flow/screenshot/Electron/browser work needs evidence before review.
- **QA is a gate when risk warrants it:** product failures block unless accepted by the user/manager.
- **Dashboard/status stay current:** update after state changes, worker completions, blockers, PRs, merges, and scheduled check-ins.
- **5-minute manager check-ins:** when requested or scheduled, inspect active managers/workers once, update status/dashboard, and avoid polling loops.

## Investigation Before Fixes

For regressions, bugs, broken UI behavior, flaky tests, CI failures, visual defects, or user-reported wrong behavior, identify the root cause before fixing.

- Start with observed failure, reproduction path, expected behavior, and affected files/components.
- Capture root-cause evidence: file/line references, screenshots, logs, test output, or source links when relevant.
- Do not let workers jump straight to symptom edits.
- Implement the smallest fix that addresses the cause and verify against the original failure.

## Written Artifacts

Written artifacts are human-readable first: decisions, next actions, evidence, blockers, and risks should be easy to skim.

- Prefer tables for structured state, ownership, checks, decisions, and comparisons.
- Use callouts for blockers, warnings, decisions, accepted risks, and human-needed checks.
- Use tabs only for a few alternate views or large parallel sections.
- Use charts only when a trend/comparison is clearer than a list/table.
- Use `moss-html` for mockups/prototypes, not plain prose.
- Use `moss-canvas` for wireframes, flows, and diagrams.
- Consolidate updates into canonical docs; create new artifacts only for distinct deliverables such as formal QA, verification, review, or summary notes.

## Moss Artifact Location

Store durable bb workstream artifacts in Moss, not the repo checkout. New Moss notes are directories with a Markdown file inside:

```text
~/Moss/Notes/Agent Workspaces/bb Workspace/workstreams/<slug>/
  <Dashboard Title>/<Dashboard Title>.md
  plans/<Plan Title>/<Plan Title>.md
  qa/<QA Title>/<QA Title>.md
  verification/<Verification Title>/<Verification Title>.md
  reviews/<Review Title>/<Review Title>.md
  summaries/<Summary Title>/<Summary Title>.md
```

Do not create flat `.md` files as durable Moss notes. Do not edit app-owned sidecars such as `meta.json`, `.folder.json`, or `layout.json` unless a Moss skill explicitly says the task requires it.

## Manager Responsibilities

- Keep the dashboard as the canonical user review surface.
- Keep bb threads for execution details and communication.
- Tell the user worker objectives, scope, files, validation, and expected output before non-trivial fanout.
- Route blockers immediately; do not let missing evidence become guesses.
- Track plan divergence and approve, redirect, or escalate it.
- Merge only after required verification, QA, and review gates are resolved.
- Use child managers when coordination itself is the bottleneck.

## Provider Guidance

Stay provider-agnostic. Prefer Codex for manager-led work unless task fit, tooling, context, access, cost, latency, or the user says otherwise. See [provider-selection](bb-workstream/references/provider-selection.md) for current command snippets.
