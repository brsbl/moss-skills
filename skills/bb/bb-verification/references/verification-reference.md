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

Link the current verification report from the dashboard and from QA when it supports manual/user-flow checks. Follow the shared human-readable artifact guidance in [../../WORKFLOWS.md](../../WORKFLOWS.md).

## Access Gate

Before verification starts, confirm the worker has:

- workstream name, base/integration branch, and feature scope
- exact long-lived app target: running URL, running Electron app, or launch command that stays available through verification
- test workspace expectations and any seed notes or attachments
- design references, expected states, and flows to exercise
- permission to use a shared/prepared long-lived verification environment when local launch is not available

If the running app target, reference, attachment, or required state is missing, stop. The manager supplies a running app/URL or long-lived app target, moves evidence into the workstream, verifies directly, or asks the user. If the manager cannot recover the context, bubble it up to the user.

## Running Target Default

Use a long-lived prepared app, running Electron target, or running URL as the default verification path. The target should stay available long enough for retries, screenshots, logs, console checks, and nearby regression checks. Prefer:

- a manager-provided running Electron app or local URL
- a prepared verification worktree with a launch command that stays alive
- a shared verification environment whose state can be inspected across the full check

## Fresh-App Fallback

Use `verify-fresh-app-screenshot.mjs` only as a fallback, legacy, or emergency check when no long-lived target is available and a one-shot clean-launch screenshot is still useful. It is not the default for UI/user-flow verification.

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

Before connecting to a running Electron target or running screenshot/user-flow checks, confirm the manager-prepared dependency source or runtime target from [bb-workstream/references/architecture-setup.md](../../bb-workstream/references/architecture-setup.md). Fresh worker worktrees do not run fresh `pnpm install`, `pnpm rebuild`, or Electron installs by default. Prefer a prepared long-lived verification environment, a manager-provided running app/URL, or a worktree whose `node_modules` links to the prepared checkout. Then record:

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

- ask the manager/user for a running app, running URL, or long-lived app target
- prefer a prepared/shared long-lived verification environment
- link `node_modules` from the prepared checkout when the manager approves it
- use the fresh-app verifier only as fallback/legacy/emergency evidence when no long-lived target is available
- record the blocker and exact failed command in the report

Do not mark a product failure from an inaccessible Electron runtime alone.

## Workflow

1. Read the implementation plan, dashboard, and changed UI/user-flow scope.
2. Create a verification report path under `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/verification/`.
3. Establish the long-lived running target and record launch/connect details.
4. Exercise the changed flows and nearby regressions. For editor work, include note loading, editing, saving, switching notes, markdown persistence, and affected decorator blocks when relevant.
5. Capture screenshots, logs, console output, and any ARIA or DOM snippets needed to explain failures.
6. Separate product failures from tooling blockers and `HUMAN` checks.
7. Update the dashboard with report path, screenshot/log paths, verdict, and blockers.
8. Hand off to review only after verification evidence exists or the manager records why verification is blocked.

## Report Shape

```markdown
# Verification Report: <workstream>

Target: <long-lived URL/app/command>
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

- Provide a long-lived runnable target, prepared environment, seed data, and references.
- Move screenshots and logs into the workstream.
- Classify tooling blockers separately from product failures.
- Keep dashboard links current.
