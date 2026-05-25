# Verification Reference

Read [../SKILL.md](../SKILL.md) first. Use this for UI/browser/Electron/user-flow evidence.

## Verification Report Template

```markdown
# <Verification Title>

## Target

| Item | Value |
| --- | --- |
| Branch/PR |  |
| Running app/URL |  |
| Scope |  |

## Checks

| Check | Expected | Result | Evidence |
| --- | --- | --- | --- |

## Findings

## Tooling blockers

## Verdict
```

## Evidence Checklist

- screenshots for visual/UI changes
- console/app logs for behavior failures
- DOM/ARIA snippets when accessibility or links matter
- exact account/workspace/fixture state
- browser/Electron target and launch command

## Failure Classification

| Type | Meaning |
| --- | --- |
| Product failure | App behavior is wrong; blocks unless accepted. |
| Tooling blocker | Environment/access/runtime failed; manager must fix or mark HUMAN. |
| HUMAN | Needs a human-only check with explicit reason. |
| Accepted risk | Known gap accepted by manager/user. |
