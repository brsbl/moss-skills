# Verification Reference

## Output Location

Write verification artifacts under:

```text
~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/verification/
```

Keep screenshots and logs beside the report. For larger checks, use:

```text
~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/verification/<check-name>/report.md
~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/verification/<check-name>/screenshots/
~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/verification/<check-name>/logs/
```

Link the current verification report from the dashboard and from QA when it supports manual/user-flow checks.

## Access Gate

Before verification starts, confirm the worker has:

- workstream name, base/integration branch, and feature scope
- exact app target: running URL, running Electron app, or launch command
- test workspace expectations and any seed notes or attachments
- design references, expected states, and flows to exercise
- permission to use a shared/prepared verification environment when local launch is not available

If the app target, reference, attachment, or required state is missing, stop. The manager supplies the target, moves evidence into the workstream, verifies directly, or asks the user. If the manager cannot recover the context, bubble it up to the user.

## Moss Runbook

For fresh desktop verification, use the Moss runbook and implementation references:

- `scripts/README.md` section `verify-fresh-app-screenshot.mjs`
- `scripts/verify-fresh-app-screenshot.mjs`
- `packages/desktop/__tests__/fresh-app-screenshot-verifier.test.ts`

The fresh-app screenshot verifier launches a dev app with non-default renderer/CDP ports, a temporary workspace, and a temporary Electron user-data dir. It writes `fresh-app.png`, `manifest.json`, and `app.log` to the output directory without touching `~/Moss/Notes`.

Typical command:

```bash
pnpm verify:fresh-app-screenshot "$HOME/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/verification/fresh-app"
```

Managers may provide fixed ports for coordination:

```bash
MOSS_VERIFY_RENDERER_PORT=52173 \
MOSS_VERIFY_CDP_PORT=59335 \
pnpm verify:fresh-app-screenshot "$HOME/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/verification/fresh-app"
```

## Environment Blockers

Before launching Electron or running screenshot/user-flow checks, confirm the manager-prepared dependency source or runtime target from [bb-workstream/references/architecture-setup.md](../../bb-workstream/references/architecture-setup.md). Fresh worker worktrees do not run fresh `pnpm install`, `pnpm rebuild`, or Electron installs by default. Prefer a prepared verification environment, a manager-provided running app/URL, or a worktree whose `node_modules` links to the prepared checkout. Then record:

```bash
uname -m
node -p 'process.platform + " " + process.arch'
file "$(command -v node)"
node -p 'process.versions.modules'
test -e node_modules
readlink node_modules || true
node -p "require.resolve('@electron-forge/cli/package.json')"
node -e 'console.log(require("electron"))'
```

Use one architecture per workstream. Default to native arm64 on Apple Silicon; use the x64 variant only for an intentional all-Rosetta session. Never reuse `node_modules` after switching architecture. If architecture changes, the manager rebuilds the prepared dependency source before verification.

Missing `node_modules`, missing `rg`, package-manager access failures, package resolution failures, Electron download, postinstall, sandbox, permission, CDP, runtime launch failures, or Node/esbuild/Electron/native-package architecture mismatches are environment/tooling blockers unless the app actually launches and demonstrates a product defect.

When a worker branch lacks access:

- prefer a prepared/shared verification environment
- connect to a manager-provided running app or URL
- link `node_modules` from the prepared checkout when the manager approves it
- ask the manager to run the fresh-app verifier and place artifacts in the workstream
- record the blocker and exact failed command in the report

Do not mark a product failure from an inaccessible Electron runtime alone.

## Workflow

1. Read the implementation plan, dashboard, and changed UI/user-flow scope.
2. Create a verification report path under `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/verification/`.
3. Establish the target and record launch/connect details.
4. Exercise the changed flows and nearby regressions. For editor work, include note loading, editing, saving, switching notes, markdown persistence, and affected decorator blocks when relevant.
5. Capture screenshots, logs, console output, and any ARIA or DOM snippets needed to explain failures.
6. Separate product failures from tooling blockers and `HUMAN` checks.
7. Update the dashboard with report path, screenshot/log paths, verdict, and blockers.
8. Hand off to review only after verification evidence exists or the manager records why verification is blocked.

## Report Shape

```markdown
# Verification Report: <workstream>

Target: <URL/app/command>
Scope: <flows or components>
Dashboard: `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/dashboard.md`

## Verdict

PASS | BLOCKED | DECISION NEEDED | HUMAN

## Evidence

- Screenshots:
- Logs:
- Console:
- Manifest:

## Checks

| Flow or Screen | Expected | Result | Evidence |
|---|---|---|---|

## Failures

- Product failures:
- Tooling blockers:
- HUMAN checks:

## Review Handoff

- Behavior verified:
- Evidence for reviewers:
- Open risks:
```

## Manager Responsibilities

Before sending work to review, the manager must:

- Provide a runnable target, prepared environment, seed data, and references.
- Move screenshots and logs into the workstream.
- Classify tooling blockers separately from product failures.
- Keep dashboard links current.
