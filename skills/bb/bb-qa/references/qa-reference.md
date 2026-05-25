# QA Reference

## Output Location

Write QA artifacts under:

```text
~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/qa/
```

Use one report per gate run, for example `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/qa/2026-05-18-report.md`. Link the current report from `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/dashboard.md`. Follow the shared human-readable artifact guidance in [../../WORKFLOWS.md](../../WORKFLOWS.md).

## Access Gate

Before QA starts, confirm the worker has:

- workstream name, base or integration branch, and current worker scope
- implementation plan or dashboard links
- any design references, screenshots, attachments, test accounts, or app targets needed for verification
- paths to verification evidence when UI or user-flow behavior changed

If an attachment, reference, app state, running target, or test credential is missing, the worker stops. The manager supplies it, moves it into the workstream, verifies the target directly, or asks the user. If the manager lacks the context, bubble it up to the user instead of guessing.

## Diff Basis

Use merge-base diffs so QA covers exactly what the workstream introduced:

```bash
BASE_BRANCH=${BASE_BRANCH:-main}
BASE_SHA=$(git merge-base "$BASE_BRANCH" HEAD)
git diff --stat "$BASE_SHA"..HEAD
git diff "$BASE_SHA"..HEAD
git log --oneline "$BASE_SHA"..HEAD
```

When the manager provides an integration branch, use that branch for `BASE_BRANCH`.

## Checklist Scope

Build the QA checklist from:

- merge-base diff and commit log
- accepted plan, task notes, and dashboard decisions
- worker-owned file scopes and any plan divergence
- verification reports for UI, screenshot, or user-flow changes
- review findings that affect behavior or risk

Group checks by user-facing behavior or system boundary. Prefer observable outcomes over implementation details. For Moss editor work, include performance, markdown round-trip, data integrity, IPC, note-switch cleanup, and local filesystem persistence when affected.

## Gate Rules

- `moss verify` is the Moss hard gate before merge.
- Focused tests are useful evidence, but they do not replace `moss verify`.
- Require verification evidence before review for UI, screenshot, and user-flow work; use the verification skill.
- Product failures block the gate until fixed or explicitly accepted by the manager/user.
- Before QA, confirm the prepared dependency source or runtime target from [bb-workstream/references/architecture-setup.md](../../bb-workstream/references/architecture-setup.md). Fresh worker worktrees do not run fresh `pnpm install`, `pnpm rebuild`, or Electron installs by default.
- Use one architecture per workstream. Default to native arm64 on Apple Silicon; use the x64 variant only for an intentional all-Rosetta session.
- Never reuse `node_modules` after switching architecture. If architecture changes, the manager rebuilds the prepared dependency source before QA or `moss verify`.
- Worker access reports verify dependency source/link and package resolution, for example `test -e node_modules`, `readlink node_modules || true`, and `node -p "require.resolve('@electron-forge/cli/package.json')"`.
- Missing `node_modules`, missing `rg`, package-manager access failures, package resolution failures, Electron download/postinstall failures, sandbox, permission, runtime access failures, or Node/esbuild/Electron/native-package architecture mismatches are environment/tooling blockers, not product failures. The manager provides a prepared/shared environment, a linked dependency source, a running app, or a URL when worker branches cannot launch the app.
- Mark `HUMAN` only when automation cannot reasonably verify the item. Include the exact reason and what a human must check.

## Workflow

1. Create the QA report in `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/qa/`.
2. Record base branch, merge-base SHA, head SHA, worker scopes, and changed-file groups.
3. Draft automated checks for tests/build/type/lint coverage. Include exact commands and expected results.
4. Draft manual/user-flow checks for behavior that needs app interaction. Link verification artifacts instead of repeating the full verification report.
5. Run focused checks where useful.
6. Run `moss verify` for the hard gate from a checkout with prepared dependencies or with manager-provided runtime support.
7. Classify every issue as product failure, tooling blocker, `HUMAN`, or accepted risk.
8. Update the dashboard with report path, gate status, blockers, and decisions needed.

## Report Shape

Use a compact report:

```markdown
# QA Report: <workstream>

Base: `<branch>` at `<merge-base-sha>`
Head: `<head-sha>`
Dashboard: `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/dashboard.md`

## Verdict

PASS | BLOCKED | DECISION NEEDED | NOT RUN

## Scope

- Changed groups:
- Worker scopes:
- Plan divergence:

## Automated Checks

| Check | Command | Result | Evidence |
|---|---|---|---|

## User Flows

| Flow | Expected Result | Status | Evidence |
|---|---|---|---|

## Hard Gate

- `moss verify`: PASS | FAIL | NOT RUN
- Evidence:

## Blockers and Risks

- Product failures:
- Tooling blockers:
- HUMAN checks:
- Accepted risks:
```

## Manager Responsibilities

Before accepting QA, the manager must:

- Provide targets or a prepared environment when QA cannot launch the app.
- Move required artifacts into the workstream and link them from the dashboard.
- Classify failures as product failures, tooling blockers, `HUMAN`, or accepted risks.
- Keep dashboard links current.
- Accept `PASS` only when the report evidence supports the verdict.
