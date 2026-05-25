# Review Reference

Read [../SKILL.md](../SKILL.md) first.

## Review Prompt

```text
Review only issues introduced or exposed by this change.

Scope:
Base/head:
Changed files:
Validation/evidence:
Risks to inspect:

Return findings as:
- P0: must fix before merge
- P1: should fix before merge
- P2: non-blocking improvement or follow-up
- Decision needed: requires manager/user choice

Also answer: does this follow existing patterns, or invent a new path without justification?
```

## Review Report Template

```markdown
# Review — <Scope>

## Verdict

PASS / BLOCKED / DECISION NEEDED

## Findings

| Priority | File/line | Issue | Fix |
| --- | --- | --- | --- |

## Validation checked

## Evidence checked

## Dispositions
```

## Finding Quality Bar

Findings should include file/line where possible, concrete failure mode, user impact, and smallest reasonable fix. Drop unrelated or pre-existing issues.
