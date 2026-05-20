# Review Reference

## Review Order

For UI, screenshot, or user-flow work, run verification first and link the report, screenshots, logs, and known limitations from the dashboard. Code review inspects the verified behavior and the implementation behind it.

For non-UI work, require the worker's focused validation first. Use QA when the workstream has a QA checklist or release gate.

Default review workers to the latest available Codex model unless overridden. Check current models with `bb provider models codex`; the current valid example is `--provider codex --model gpt-5.5 --reasoning-level xhigh`. `xhigh` is the bb CLI value for extra-high. This is a default provider selection, not a requirement: the manager may use any available provider, model, or reasoning/thinking level when review fit, tooling, context, environment access, availability, cost, latency, or user preference calls for it.

## Manager First Pass

The manager reviews the worker output before starting a read-only reviewer:

- read the changed file list and validation output
- inspect the diff against the integration branch
- identify high-risk areas and ownership boundaries
- note questions, suspected bugs, missing tests, and Moss-specific performance or granularity risks

Useful diff scope:

```bash
git diff <integration-branch>...HEAD -- <owned-files>
```

Record first-pass notes in `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/reviews/` or in the dashboard if the review is small.

## Same-Environment Read-Only Review

Start the reviewer in the worker's environment so the reviewer sees the exact implementation state, but make the review read-only:

```bash
bb thread spawn --environment <worker-env-id> --permission-mode readonly --provider codex --model gpt-5.5 --reasoning-level xhigh --prompt "<review prompt>" --json
```

Include in the review prompt:

- worker objective and owned files
- reviewer provider default or override reason, when relevant
- integration branch
- worker thread ID and environment ID
- diff command or changed file list
- manager first-pass notes
- validation, QA, and verification evidence links
- instruction to report ambiguous product choices as decision-needed items

The reviewer may inspect files and run safe read-only commands or validation commands requested by the manager. The reviewer must not edit, stage, commit, or merge.

## Finding Priorities

Use findings only for issues introduced or exposed by the worker change.

- P0: blocks release or risks data loss, security, corruption, severe performance regression, or a broken hard gate
- P1: user-facing regression, important correctness bug, missing required validation, or high-risk maintainability issue
- P2: minor bug, edge-case risk, cleanup, or optional test improvement
- Decision needed: product, design, scope, or tradeoff question that the manager cannot safely decide alone

For each finding, include file and line references when possible, the concrete failure mode, and the smallest reasonable fix approach.

## Synthesis

The manager owns the final review result:

1. Deduplicate manager and reviewer findings.
2. Drop findings that are clearly pre-existing or unrelated.
3. Sort by P0, P1, P2, then decision-needed.
4. Confirm each finding has an actionable fix or an explicit decision path.

Review report format:

```markdown
# Review: <worker objective>

- Worker thread: <worker-thread-id>
- Worker environment: <worker-env-id>
- Reviewer provider/model - <provider and model when known>
- Integration branch: <integration-branch>
- Verification: <link or not applicable>
- QA: <link or not applicable>

## Findings

| Priority | Finding | Files | Required action |
|---|---|---|---|
| P1 | <problem> | <path:line> | Return to implementor |

## Decision Needed

| Question | Options | Needed from |
|---|---|---|
| <question> | <options> | manager/user |

## Verdict

<PASS, BLOCKED, or DECISION-NEEDED>
```

If no findings remain, state `Verdict: PASS` and note any residual risk or test gap.

## Routing Findings

P0 and P1 findings go back to the implementor by default:

```bash
bb thread tell <worker-thread-id> "<finding summary and required fix>"
```

The implementor fixes the issue in the same worker environment, reruns focused validation, and reports the changed files and evidence. The manager decides whether another read-only review pass is required based on the risk and size of the fix.

P2 findings and ambiguous items require a manager or user decision before implementation. Record whether each item is fixed now, deferred, accepted as risk, or converted into follow-up work.

## Gate Decision

The worker environment is review-ready for merge only when:

- no unresolved P0 or P1 findings remain
- P2 and decision-needed items have recorded decisions
- required validation is linked
- UI or user-flow verification is linked when applicable
- QA gate status is linked when applicable

Then return to the implementation skill for the squash merge command and merge bookkeeping.
