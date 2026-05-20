# Manager Flow Reference

## Manager Job

The manager's core role is to keep workers unblocked and on a clear path to completion.

- Give every worker complete context, owned files, acceptance criteria, validation commands, and expected output.
- Keep file ownership, dependencies, blockers, decisions, evidence, and merge state visible in the dashboard.
- Route dependencies between workers quickly; do not let workers infer missing decisions or artifacts.
- Approve, redirect, or escalate plan divergence before work drifts from the approved path.
- Treat worker-reported completion as input. The manager owns review, QA routing, squash merge, and final status.

## Workstream Artifacts

Create one live artifact tree per effort:

```text
~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/
  dashboard.md
  workers.md
  plans/
  qa/
  verification/
  reviews/
  summaries/
```

Use `dashboard.md` as the canonical user review surface. Use bb threads for communication and execution details. Keep detailed plans, QA, verification, reviews, and summaries in their matching directories, then link them from the dashboard.

These artifacts live in the Moss workspace, not in the repo checkout. Do not store workstream dashboards, screenshots, QA reports, reviews, or summaries under the repository unless the user explicitly asks to commit them.

For manager-of-manager setups, the parent manager keeps a roll-up dashboard or section that links each child-manager dashboard, summarizes child decision queues, and surfaces only cross-workstream blockers, shared-file conflicts, user decisions, accepted risks, and merge readiness.

## Context And Evidence Gate

If a worker lacks a required attachment, reference file, app state, account access, branch, running app, screenshot target, or other acceptance-critical artifact, the worker must stop and report the blocker.

Manager response:

1. Supply, move, or verify the missing artifact when you have it.
2. Ask the user immediately when you do not have it.
3. Record the blocker and owner in `dashboard.md`.
4. Do not let workers proceed from a paraphrase when the original artifact is acceptance-critical.

Apply the same gate to the manager. If the manager cannot inspect the source of truth needed to make a decision, bubble it up to the user instead of guessing.

## Before Starting Workers

Before starting workers, tell the user:

- Worker objective: what each worker will deliver.
- Provider default or override reason, when relevant.
- Scope and files: exact owned paths, plus files explicitly off-limits.
- Validation: focused commands, `moss verify` expectations, screenshot targets, or manual QA evidence.
- Expected output: changed files, tests run, evidence paths, plan divergence, and remaining risks.

Then update `workers.md` and `dashboard.md` with the roster, file ownership, dependencies, stage, and next gate.

Before spawning fresh worker worktrees, bootstrap dependencies once in a prepared main or integration checkout using [architecture-setup](architecture-setup.md). Use one architecture for the whole workstream. If architecture changes, rebuild that prepared dependency source instead of having each worker reinstall.

For each worker, provide one dependency/runtime path:

- prepared environment access
- manager-provided running app or URL
- `node_modules` linked from the prepared checkout, for example `rm -rf node_modules && ln -s <prepared-checkout>/node_modules node_modules`

Fresh worker worktrees do not run fresh `pnpm install`, `pnpm rebuild`, or Electron installs by default.

Start implementation workers from the integration branch with the selected provider.

Non-UI/UX default example:

```bash
bb thread spawn --new-environment worktree --base-branch <integration-branch> --permission-mode workspace-write --provider codex --model gpt-5.5 --reasoning-level xhigh --prompt "<worker prompt>"
```

UI/UX-related default example:

```bash
bb thread spawn --new-environment worktree --base-branch <integration-branch> --permission-mode workspace-write --provider claude-code --model 'claude-opus-4-7[1m]' --reasoning-level xhigh --prompt "<worker prompt>"
```

Before assigning the work, require the fresh worktree to confirm checkout, tool access, dependency source/link, and package resolution. This is an access report, not a bootstrap script:

```bash
pwd
git branch --show-current
git status --short
command -v rg
pnpm --version
test -e node_modules
readlink node_modules || true
node -p "require.resolve('@electron-forge/cli/package.json')"
```

If `node_modules` is missing, package resolution fails, package-manager access is unavailable, Electron is missing, runtime launch fails, or Node/esbuild/Electron/native-package architecture does not match the prepared source, record an environment/tooling blocker and fix the prepared source or runtime target. Do not let workers classify those failures as product defects or self-install in their fresh worktrees without manager approval.

Record for every worker:

- Thread ID and title.
- Provider and model when known.
- Environment ID.
- Worktree path or environment location.
- Base/integration branch.
- Owned files and forbidden files.
- Plan path, validation commands, evidence paths, and current blocker.

If a spawn fails, do not assign the scope until the environment is reachable and the worker has confirmed its path, branch, and owned files. If a worker environment is dirty at handoff, inspect the diff, preserve evidence, and resolve ownership before review or merge.

## Review And Merge Commands

For read-only review in the implementor's environment:

```bash
bb thread spawn --environment <worker-environment-id> --permission-mode readonly --provider codex --model gpt-5.5 --reasoning-level xhigh --prompt "<review prompt>"
```

When gates pass, merge by environment ID:

```bash
bb environment squash-merge <worker-environment-id> --merge-base-branch <integration-branch>
```

After merge, update `dashboard.md`, `workers.md`, and the relevant plan, QA, verification, review, or summary links. Run integration validation appropriate to the blast radius.

## High-Concurrency Management

Maintain four working views:

- Worker roster: each worker's stage, environment, files, current blocker, and next expected output.
- Stage grouping: intake, planning, implementation, QA or verification, review, merge, summary, cleanup.
- Ownership map: files, modules, notes, branches, and dependencies owned by each worker or manager.
- Decision queue: user decisions, manager decisions, plan divergence, blocked evidence, and accepted risks.

Use delta-based updates. Ask workers for only what changed since their last update: diff summary, validation delta, blocker delta, evidence delta, and risk delta. Keep full logs in artifacts or thread history; keep the dashboard scannable.

Avoid parallel scopes that edit the same files unless the dependency is explicit and staged. For shared files, choose one: assign one owner, split the edits by sequence, or escalate to a manager decision before work starts.

## Plan Divergence

Workers must surface any divergence from the approved plan before implementing it unless the change is required to restore a broken build or unblock validation. Use this divergence report:

- What changed from the approved plan.
- Why the change is needed.
- Files and behavior affected.
- Validation impact.
- Whether the manager can approve or the user must decide.

The manager records divergence in `dashboard.md`, then approves, redirects, or escalates. User-visible behavior changes, scope expansion, acceptance criteria changes, or risky architecture changes require user approval.

## When To Hire Another Manager

Hire another bb manager instead of spawning more workers when coordination itself is the bottleneck:

- More active workers than one manager can unblock and review promptly.
- Independent product areas need separate decision queues, dashboards, or release timing.
- A second integration branch or validation environment is needed.
- The current manager cannot monitor worker evidence, plan divergence, and merges without delaying workers.
- A long-running workstream needs a dedicated owner while the current manager handles user-facing decisions.

Authority boundaries must be explicit. A hired manager gets a named scope, owned artifacts, worker authority, merge authority if granted, and escalation rules. The parent manager keeps cross-workstream decisions, shared-file conflicts, acceptance-critical user questions, and final release or PR status unless delegated in writing.

Do not claim that a plain `bb thread spawn` creates a true manager if the local bb CLI only exposes standard thread spawning. If hiring a true manager requires a supported manager creation or assignment flow, confirm that flow in local `bb --help` or project docs and use it. A standard spawn can still create a coordination thread, but its authority comes from the manager prompt and dashboard, not from an implicit bb manager role.

When assigning an existing manager/thread under a parent, use the parent-thread relationship only when appropriate:

```bash
bb thread update <child-thread-id> --parent-thread <parent-thread-id>
```

If a supported manager creation flow exists, use the manager default unless overridden:

```bash
bb thread spawn --provider claude-code --model 'claude-opus-4-7[1m]' --reasoning-level xhigh --prompt "<manager prompt>"
```

The parent manager rolls up child dashboards and decision queues instead of duplicating every worker detail. Child managers own their local dashboards, worker rosters, blockers, validation evidence, review routing, and merge readiness within the delegated scope.

## Completion Gates

Before marking work complete:

- Worker diff is merged or intentionally dropped.
- Required focused validation is recorded.
- UI, screenshot, or user-flow work has verification evidence linked from `verification/`.
- QA and review findings are resolved, accepted, or parked with owner and rationale.
- Plan divergence and user decisions are visible in the dashboard.
- Final summary links evidence, commits, risks, and follow-up work.
