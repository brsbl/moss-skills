# Default bb manager workflow instructions

Use these instructions for Moss bb manager-led work. It describes the workflow the user expects managers to follow.

## Skill definitions

Canonical bb skill definitions live in the `moss-skills` repo:

- [bb-workstream](bb-workstream/SKILL.md)
- [bb-research](bb-research/SKILL.md)
- [bb-planning](bb-planning/SKILL.md)
- [bb-dashboard](bb-dashboard/SKILL.md)
- [bb-implementation](bb-implementation/SKILL.md)
- [bb-verification](bb-verification/SKILL.md)
- [bb-qa](bb-qa/SKILL.md)
- [bb-review](bb-review/SKILL.md)
- [bb-summary](bb-summary/SKILL.md)
- [bb-cleanup](bb-cleanup/SKILL.md)
- [bb-analytics](bb-analytics/SKILL.md)

Read the relevant `SKILL.md` before running that stage. Treat this file as workflow policy and the linked skills as the detailed stage definitions.

Moss note authoring rules live in the top-level Moss skills:

- [moss-notes](../moss-notes/SKILL.md)
- [moss-frontmatter](../moss-frontmatter/SKILL.md)
- [moss-comments](../moss-comments/SKILL.md)
- [moss-wiki-links](../moss-wiki-links/SKILL.md)
- [moss-mockup](../moss-mockup/SKILL.md)

When creating dashboards, plans, reports, summaries, or research notes, read the relevant Moss note skill instead of duplicating note syntax here.

## Core rule

Run meaningful work through the bb workflow instead of doing substantive work in the manager thread.

Large work must go through the full workflow:

1. `bb-workstream` - set up the workstream, integration branch, ownership model, and manager responsibilities.
2. `bb-research` - research product/feature ideas when external context, examples, best practices, APIs, or UI references would improve planning.
3. `bb-planning` - turn the request/source material into scoped work with acceptance criteria, owned files, validation, and evidence gates.
4. `bb-dashboard` - create or update the canonical dashboard before workers start.
5. `bb-implementation` - spawn workers only after the user has seen the worker plan list and approved non-trivial fanout.
6. `bb-verification` - verify behavior before review, including screenshots/user-flow evidence when UI-facing or interactive.
7. `bb-qa` - run the QA gate when the work is user-facing, multi-worker, high-risk, release-relevant, or otherwise needs a formal merge gate.
8. `bb-review` - do manager first pass, then dedicated same-environment readonly review for non-trivial work.
9. `bb-summary` - summarize what changed, validation, verification, QA, review, risks, decisions, and PR/handoff state.
10. `bb-cleanup` - archive/clean completed or stale workers only after preserving useful artifacts.

Small work can use an abbreviated workflow, but planning, verification, and review are still expected unless the user explicitly waives them.

## Analytics work

For PostHog analytics work, use `bb-analytics` instead of the implementation pipeline:

- Use `bb-analytics` when authoring a new runbook (decision-supporting "how to read this dashboard" note) or running an existing runbook to produce a dated analytics report.
- Pair every runbook with a report template in `~/Moss/Notes/Agent Workspaces/bb Workspace/Templates/` and store reports under `~/Moss/Notes/Agent Workspaces/bb Workspace/PostHog Reviews/`.
- Treat analytics output like research: link the report from `dashboard.md` and add any follow-ups to the workstream decision queue when the analytics work feeds a managed workstream.
- PostHog credentials come from `.env` or `~/.claude/projects/*/memory/posthog.md`. Never paste or commit raw tokens.

## Minimum workflow for small tasks

For small, low-risk tasks:

1. Plan the task inline or in the dashboard: objective, files/scope, acceptance criteria, validation, expected output.
2. Tell the user the worker plan before spawning a worker when a worker is needed.
3. Run focused implementation.
4. Verify the changed behavior with the smallest sufficient check.
5. Review the diff before merge. Use a dedicated review worker when the change is non-trivial, risky, cross-cutting, or user-facing.
6. Record the result in the dashboard or final update.

Do not skip verification just because code review is pending. Verification comes before review for UI-facing, screenshot, Electron, browser, or user-flow work.

## Manager responsibilities

The manager's core role is to keep workers unblocked and on-plan.

- Keep the dashboard as the canonical user review surface.
- Keep bb threads for communication and execution details.
- Before workers start, tell the user each worker's objective, files/scope, validation, expected output, and provider/model when relevant.
- For non-trivial fanout, pause for user approval before spawning workers.
- Require each worker to write a plan before edits. Review and approve, revise, or block the plan.
- Route blockers immediately. If a worker lacks source context, attachments, app access, account state, a running target, screenshots, or other acceptance-critical evidence, supply it, move the worker to an environment with access, verify it directly, or ask the user.
- Do not let workers proceed from guesses or paraphrases when original evidence is required for acceptance.
- Track plan divergence. Workers must report why they diverged, what files/behavior changed, and how validation is affected. The manager approves, redirects, or escalates.
- Merge only after required verification, QA when applicable, and review gates are resolved.

## Artifact location

Store durable workstream artifacts under the Moss workspace, not in the repo checkout:

```text
~/Moss/Notes/Agent Workspaces/bb Workspace/workstreams/<slug>/
  dashboard.md
  workers.md
  research/
  plans/
  verification/
  qa/
  reviews/
  summaries/
```

The dashboard links to the supporting artifacts. Keep long logs, screenshots, reports, and summaries in the matching subdirectories.

Repo changes should contain only code/docs/assets intended to be committed.

## Worker sandbox

The user controls the sandbox; managers have full latitude.

- Default `bb thread spawn` to `--permission-mode full` so workers can run `WebFetch` and `WebSearch` and write outside the project worktree (e.g. `~/Moss/Notes/`, `~/Moss/Agent Workspaces/`).
- Drop to `--permission-mode workspace-write` or `--permission-mode readonly` only with a concrete reason — a strictly-scoped readonly review pass, an untrusted external task, or a codebase-only edit where blast radius matters.
- If a worker reports it couldn't fetch a URL, run a search, or write to a Moss path, re-spawn with `--permission-mode full` instead of routing around the sandbox via staging + copy.

## Provider defaults

Stay provider-agnostic, but use these defaults unless availability, task fit, tooling, context, access, cost, latency, or the user says otherwise:

- Claude for managers, manager-of-manager threads, planning, QA, summaries, and UI/UX-related work.
- Codex for review workers, non-UI/UX implementation, cleanup, codebase analysis, mechanical docs/code work, **investigations, regressions, and bug fixes**.
- Always check `bb provider models <provider>` and use the latest/highest available model.
- Current example defaults:
  - Claude: `--provider claude-code --model 'claude-opus-4-7[1m]' --reasoning-level xhigh`
  - Codex: `--provider codex --model gpt-5.5 --reasoning-level xhigh`

## Dashboard expectations

Every active workstream needs a dashboard unless the task is truly trivial.

The dashboard should show:

- Goal and source context.
- Integration branch and PR/handoff state.
- Worker roster: thread ID, environment ID, worktree, provider/model, scope, owned files, stage, blocker, next action.
- Research, plan approvals, and plan divergence.
- Verification, QA, review, merge, and cleanup state.
- Decisions needed from the user.
- Links to research, plans, verification artifacts, QA reports, review reports, screenshots/logs, summaries, and relevant commits/PRs.

The dashboard is a Moss note. Prefer tables for rosters/queues/divergence, callouts for blockers and decisions, tabs for large parallel workstreams, charts only when trends/comparisons beat a small table, and `moss-html` only when extra interactivity is worth it. See [bb-dashboard](bb-dashboard/SKILL.md) for the full dashboard template and node-type guidance.

For many workers, group by stage and sort by next manager action. If one manager has too many active decisions or workers to unblock effectively, consider hiring a child manager for an independent scope.

## When to hire another manager

Hire or delegate to another manager instead of spawning more workers directly when:

- There are many workers with independent decision queues.
- The work has distinct product areas or release tracks.
- A child scope needs its own dashboard, blockers, QA/review routing, or merge readiness.
- The parent manager would otherwise become a bottleneck for unblocking workers.

The parent manager keeps the roll-up dashboard and owns cross-workstream decisions, shared-file conflicts, user escalations, accepted risks, and final PR/release state unless explicitly delegated.
