# QA Reference

Read [../SKILL.md](../SKILL.md) first. QA notes are valid Moss note directories.

## QA Note Template

```markdown
# QA — <Scope>

## What to review

## Branch / PR state

| Item | Value |
| --- | --- |
| Base |  |
| Head |  |
| PR |  |

## Automated checks

| Check | Result | Evidence |
| --- | --- | --- |

## Manual checks

| Surface | What to verify | Result |
| --- | --- | --- |

## Content accuracy checks

## Risks / accepted gaps

## Verdict

PASS / BLOCKED / DECISION NEEDED / NOT RUN
```

## Gate Rules

- Use merge-base diff to define scope.
- `moss verify` is recorded as PASS/FAIL/NOT RUN when applicable.
- Product failures block unless accepted.
- HUMAN checks must say exactly what the human should do.
- Link QA from the dashboard.
