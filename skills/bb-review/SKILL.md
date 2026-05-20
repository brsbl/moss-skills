---
name: bb-review
description: Use as the Moss bb review merge gate for worker environment changes, including verification-before-review, manager first pass, same-environment readonly review, Codex provider default checks, P0/P1/P2 findings, decision-needed items, and routing fixes back to implementors.
---

# Moss BB Review

Use this skill as the review gate for Moss work implemented through bb worker environments. Review is a merge gate, not a rewrite pass.

## Inputs

- Worker objective, owned files, worker thread ID, environment ID, integration branch, and changed file list or diff command.
- Manager first-pass notes.
- Focused validation, QA, and verification evidence links.
- Provider/model default or override reason.

## Steps

1. For UI, screenshot, or user-flow work, require verification evidence before code review.
2. Manager inspects the diff, validation, evidence, ownership, and high-risk Moss invariants before hiring a reviewer.
3. Start the reviewer in the worker environment with read-only permissions.
4. Ask for findings only on issues introduced or exposed by the worker change.
5. Synthesize manager and reviewer findings, dropping unrelated or pre-existing issues.
6. Route P0/P1 findings back to the implementor; decide whether P2 and ambiguous findings are fixed, accepted, deferred, or escalated.
7. Mark the review gate ready only when required validation, verification, QA, and finding dispositions are linked.

## Outputs

- Review report under `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/reviews/` or a dashboard entry for small reviews.
- Findings prioritized as P0, P1, P2, or decision needed.
- Verdict: PASS, BLOCKED, or DECISION-NEEDED.
- Dashboard update with findings, dispositions, and next gate.

## Validation

- Reviewer uses the implementor's exact environment and read-only permissions.
- Findings include file/line references where possible, concrete failure mode, and smallest reasonable fix.
- No unresolved P0/P1 findings remain before merge readiness.
- P2 and decision-needed items have recorded decisions.

## References

- Detailed review order, commands, finding priorities, synthesis, report template, and routing: [references/review-reference.md](references/review-reference.md).
- Provider defaults: [../bb-workstream/references/provider-selection.md](../bb-workstream/references/provider-selection.md).
