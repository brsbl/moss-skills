# Worker Lifecycle Reference

## Manager Contract

The manager is not a passive dispatcher. Keep each worker moving by providing context, environment access, file ownership, validation commands, and explicit exit criteria before implementation starts.

Select the implementation provider from [provider-selection](../../bb-workstream/references/provider-selection.md): Claude for UI/UX-related implementation, Codex for non-UI/UX implementation by default. Check current models with `bb provider models <provider>` and use the latest available model for the selected provider unless task fit, tooling, context, environment access, availability, cost, latency, or user preference calls for an override.

Before starting any worker, tell the user:

- worker objective
- provider default or override reason, when relevant
- owned files and forbidden files
- expected validation
- expected final output
- integration branch and merge plan

Keep `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/dashboard.md` current with worker status, blockers, decisions, validation links, review links, provider/model when known, and merge state. Use `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/workers.md` for worker thread, environment, provider/model, and worktree IDs.

## Worker Setup

Start from the integration branch chosen for the workstream. Check the current checkout before switching branches:

```bash
git branch --show-current
git status --short
```

If the checkout is dirty, missing, or not accessible, stop and record a blocker in the dashboard before switching branches or starting workers. Do not create implementation worktrees from an unknown or dirty base.

After the current checkout is clean, switch to the integration branch and verify it is clean and usable:

```bash
git checkout <integration-branch>
git status --short
command -v rg
pnpm --version
```

The manager runs the canonical architecture setup from [bb-workstream/references/architecture-setup.md](../../bb-workstream/references/architecture-setup.md) in a prepared main or integration checkout before assigning implementation workers. The default Apple Silicon session is native arm64 end to end. If intentionally using Rosetta/x64, run the x64 variant for the whole workstream.

Rules: check Node architecture before installing dependencies in the prepared source checkout; never reuse `node_modules` after switching architecture; rebuild the prepared dependency source when architecture changes; if setup fails, record an environment/tooling blocker and fix setup before continuing.

Fresh worker worktrees do not run fresh `pnpm install`, `pnpm rebuild`, or Electron installs by default. Workers use a prepared environment, receive a running app or URL, or link root dependencies from the prepared checkout:

```bash
rm -rf node_modules
ln -s <prepared-checkout>/node_modules node_modules
```

If `rg`, `node_modules`, package-manager access, repo bootstrap, package resolution, or architecture-consistent dependencies are missing, record an environment/tooling blocker and have the manager fix the prepared dependency source, provide a prepared environment, link dependencies, or provide a running app/URL. Do not start workers from a checkout that cannot support the assigned validation.

Start each implementation worker in a separate worktree with the selected provider.

Non-UI/UX default example:

```bash
bb thread spawn --new-environment worktree --base-branch <integration-branch> --permission-mode workspace-write --provider codex --model gpt-5.5 --reasoning-level xhigh --prompt "<worker prompt>" --json
```

UI/UX-related default example:

```bash
bb thread spawn --new-environment worktree --base-branch <integration-branch> --permission-mode workspace-write --provider claude-code --model 'claude-opus-4-7[1m]' --reasoning-level xhigh --prompt "<worker prompt>" --json
```

Record the returned thread ID, provider/model when known, environment ID, worktree path or name, base branch, owned files, validation command, and expected output in `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/workers.md`.

If spawn fails, record the exact command and failure. Common blockers are an invalid base branch, dirty source checkout, provider or host access, and environment creation failure. Fix the blocker or escalate to the user; do not continue with unclear ownership.

Confirm access when needed:

```bash
bb thread show <worker-thread-id> --work-status
bb environment show <worker-env-id>
```

For fresh worker worktrees, require an initial access report before implementation planning:

```bash
pwd
git branch --show-current
git status --short
command -v rg
uname -m
node -p 'process.platform + " " + process.arch'
file "$(command -v node)"
node -p 'process.versions.modules'
test -e node_modules
readlink node_modules || true
node -p "require.resolve('@electron-forge/cli/package.json')"
pnpm --version
```

The access report must match the architecture chosen in the shared setup reference. Mixed Node, esbuild, Electron, or native package architectures are environment/tooling blockers, not product failures.

Missing `node_modules`, missing `rg`, package resolution failures, package-manager access failures, Electron download/postinstall failures, Electron runtime launch failures, architecture mismatches, and missing provider or account access are environment/tooling blockers. The manager either fixes the prepared dependency source, supplies a prepared/shared environment, links dependencies into the worker worktree, gives the worker a running app or URL for verification, or escalates to the user. Workers escalate these failures instead of installing fresh dependencies in their worktree.

## Worker Handoff

Give the worker a concise prompt with:

- objective and done conditions
- owned paths and explicitly forbidden paths
- source context paths or notes
- integration branch: `<integration-branch>`
- validation commands to run
- expected final output: changed files, validation result, risks, and any evidence paths
- instruction to use bb thread coordination only

Workers must remember they are not alone in the repo. They may inspect surrounding code, but edits stay inside their owned paths unless the manager approves a scope change.

## Plan First

Every worker starts by reading context and returning a short implementation plan. The worker must wait for manager approval before editing files.

The manager reviews the plan for:

- file ownership conflicts
- missing context or acceptance criteria
- validation coverage
- UI or user-flow work that needs verification
- cross-worker dependencies

Approve, revise, or block the plan. Record approved plans under `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/plans/` when the workstream benefits from a durable artifact.

## Plan Divergence

If implementation needs to diverge from the approved plan, the worker stops and reports:

- what diverged
- why the original plan no longer works
- affected files
- risks and tradeoffs
- requested approval

The manager decides whether to approve the change, revise scope, ask the user, or return the worker to the original plan. Do not let workers drift silently.

## Execution Loop

During implementation, the manager watches for blockers instead of waiting passively:

- missing source context or product decisions
- dependency on another worker's files
- failed validation caused by environment setup
- unexpected dirty worktree state
- inability to access the worker environment

Resolve the blocker, route the dependency, or escalate to the user. Update the dashboard with each material change.

When the worker finishes, require:

- changed file list
- focused validation output
- `moss verify` result for Moss changes; this is the hard gate before merge
- UI verification evidence for UI or user-flow work
- unresolved risks or follow-up decisions

Use the QA and verification skills for their gates instead of duplicating those workflows here.

## Ready For Review

A worker is ready for manager first pass only after implementation validation has run or a blocker is recorded. For UI, screenshot, and user-flow work, run verification before code review.

The manager first inspects the diff, validation, evidence, and risk areas, then follows the review skill for same-environment readonly review. P0/P1 findings go back to the implementor. P2 and ambiguous findings require a manager or user decision before work continues.

## Merge

After focused validation, required verification, QA, and review gates are resolved, run the Moss hard gate before merge:

```bash
moss verify
```

`moss verify` must pass before squash merge. If it cannot run because of environment/tooling access, record the merge as blocked with the exact blocker, owner, and next action; do not merge on stale or missing hard-gate evidence.

When the hard gate passes, squash merge the worker environment into the integration branch:

```bash
bb environment squash-merge <worker-env-id> --merge-base-branch <integration-branch>
```

If the squash merge fails because of dirty, conflicting, or inaccessible state, keep the worker environment intact and return the issue to the implementor or manager. Do not manually copy changes between worktrees.

After a successful merge:

- update dashboard merge state
- preserve validation, verification, QA, and review links
- record the merge result in `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/workers.md`
- include the merged work in the final summary
