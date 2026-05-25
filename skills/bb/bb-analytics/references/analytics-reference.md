# Analytics Reference

Read [../SKILL.md](../SKILL.md) first. Never paste or commit raw PostHog tokens.

## Runbook Template

```markdown
# Runbook — <Dashboard / Question>

## Fast path

## Decision rules

## Daily read surface

| Tile/query | Question | Healthy when |
| --- | --- | --- |

## Dashboard gaps

## Report contract

## No-code changes applied
```

## Report Template

```markdown
# Analytics Report — <Date / Scope>

## Bottom line

## Decision table

| Layer | Status | Evidence |
| --- | --- | --- |

## Top actions

## What changed

## Evidence

## Dashboard gaps

## Blockers
```

## API Pattern

- Fetch dashboard definition and tile inventory.
- Replay saved tile queries exactly when possible.
- Use ad hoc HogQL only for gaps; record the gap.
- Save sanitized working artifacts outside the repo.
