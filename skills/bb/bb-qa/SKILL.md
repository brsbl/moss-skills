---
name: bb-qa
description: Use when a Moss bb workstream needs a first-class QA merge gate covering automated checks, moss verify, user-flow checks, verification evidence, product-vs-tooling classification, HUMAN checks, accepted risks, and dashboard-linked QA reports.
---

# Moss BB QA

Use this skill for a QA gate that covers automated tests, user flows, and validation evidence. QA is first-class work, not a final note after implementation.

## Inputs

- Workstream name, base/integration branch, current worker scope, dashboard, plans, and decisions.
- Merge-base diff, commit log, worker-owned files, and any plan divergence.
- Verification reports for UI, screenshot, or user-flow changes.
- Review findings that affect behavior or risk.

## Steps

1. Stop if required attachments, references, app state, running target, credentials, or verification evidence are missing.
2. Create a QA report under `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/qa/`.
3. Use merge-base diffs so QA covers exactly what the workstream introduced.
4. Draft automated checks and manual/user-flow checks from diff, plan, dashboard decisions, verification, and review findings.
5. Run focused checks where useful, then run `moss verify` as the hard gate.
6. Classify every issue as product failure, tooling blocker, `HUMAN`, or accepted risk.
7. Update the dashboard with report path, gate status, blockers, and needed decisions.

## Outputs

- QA report with base/head, scope, automated checks, user flows, hard gate status, blockers, risks, and verdict.
- Dashboard link to the current QA report and gate status.
- Clear merge-gate decision: PASS, BLOCKED, DECISION NEEDED, or NOT RUN.
- Report shape follows the shared written artifact guidance so gate status, blockers, decisions, and evidence are easy to scan.

## Validation

- `moss verify` is recorded as PASS, FAIL, or NOT RUN with evidence.
- Focused tests do not replace the hard gate.
- Product failures block until fixed or explicitly accepted.
- `HUMAN` checks include exact reason and what a human must check.

## References

- Detailed diff basis, checklist scope, gate rules, workflow, and report template: [references/qa-reference.md](references/qa-reference.md).
- Exact architecture setup commands: [../bb-workstream/references/architecture-setup.md](../bb-workstream/references/architecture-setup.md).
- Shared written artifact guidance: [../WORKFLOWS.md](../WORKFLOWS.md).
- Moss note authoring rules: [moss-notes](../../moss-notes/SKILL.md), [moss-frontmatter](../../moss-frontmatter/SKILL.md), [moss-comments](../../moss-comments/SKILL.md), [moss-wiki-links](../../moss-wiki-links/SKILL.md), [moss-mockup](../../moss-mockup/SKILL.md).
