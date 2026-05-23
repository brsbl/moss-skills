---
name: bb-verification
description: Use for Moss UI, screenshot, Electron, browser, or user-flow verification in bb workstreams, including app-target access gates, architecture checks, fresh-app screenshot evidence, logs, product-vs-tooling classification, and review handoff before code review.
---

# Moss BB Verification

Use this skill when changed behavior needs current UI, screenshot, or user-flow evidence. Verification comes before code review for UI/screenshot/user-flow work so reviewers inspect behavior with screenshots and logs in hand.

## Inputs

- Workstream name, integration branch, feature scope, implementation plan, and dashboard.
- Exact app target: running URL, running Electron app, or launch command.
- Seed workspace expectations, notes, attachments, design references, expected states, and flows.
- Permission to use a prepared/shared verification environment when local launch is unavailable.

## Steps

1. Stop if the app target, reference, attachment, required state, or account access is missing.
2. Confirm architecture setup or record an environment/tooling blocker.
3. Create a verification report under `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/verification/`.
4. Exercise changed flows and nearby regressions; for editor work include loading, editing, saving, note switching, markdown persistence, and affected decorator blocks when relevant. For multi-surface work, default to one verification worker per independent flow, platform, or evidence type (fresh-app screenshot, editor flow, IPC/log capture); keep tightly-coupled flows in a single worker. See [Parallelization And Fanout](../bb-workstream/references/manager-flow.md#parallelization-and-fanout).
5. Capture screenshots, logs, console output, manifests, and DOM or ARIA snippets needed to explain failures.
6. Separate product failures from tooling blockers and `HUMAN` checks.
7. Link the report, screenshot/log paths, verdict, and blockers from the dashboard.
8. Hand off to review only after evidence exists or the manager records why verification is blocked.

## Outputs

- Verification report with target, scope, verdict, evidence, checks, failures, and review handoff.
- Screenshot, log, console, and manifest artifacts next to the report.
- Dashboard update with current verification status and evidence links.

## Validation

- Verification uses current implementation state and a documented target.
- Tooling blockers are not reported as product failures.
- Evidence is sufficient for a reviewer or manager to inspect behavior without replaying the entire thread.

## References

- Detailed Moss runbook, command examples, environment blockers, workflow, and report template: [references/verification-reference.md](references/verification-reference.md).
- Exact architecture setup commands: [../bb-workstream/references/architecture-setup.md](../bb-workstream/references/architecture-setup.md).
- Moss note authoring rules: [moss-notes](../../moss-notes/SKILL.md), [moss-frontmatter](../../moss-frontmatter/SKILL.md), [moss-comments](../../moss-comments/SKILL.md), [moss-wiki-links](../../moss-wiki-links/SKILL.md), [moss-mockup](../../moss-mockup/SKILL.md).
