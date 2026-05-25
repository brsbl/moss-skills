---
name: bb-analytics
description: "Use when creating or running PostHog analytics runbooks/reports under ~/Moss/Notes/** with dashboard API replay, HogQL fallback, health calls, evidence, and prioritized follow-ups."
---

# Moss BB Analytics

## When To Use

Use this instead of the implementation pipeline for analytics dashboard/runbook/report work.

## Read First
- ../WORKFLOWS.md
- references/analytics-reference.md
- ../../moss-notes/SKILL.md for runbooks/reports under ~/Moss/Notes/**
- ../../moss-wiki-links/SKILL.md for runbook/report links

## Steps
1. Frame the decision, dashboard, date range, filters, and health thresholds.
2. Fetch dashboard/tile definitions via API and replay saved queries when possible.
3. Use ad hoc HogQL only for gaps and record those gaps.
4. Write an action-first report with bottom line, decision table, top actions, evidence, blockers, and follow-ups.
5. Never expose raw PostHog tokens.

## Outputs
- Runbook note
- Dated analytics report
- Sanitized query/evidence artifacts
- Dashboard follow-ups or no-code change recommendations

## Validation
- Every health call is backed by saved tile replay, HogQL artifact, or runbook rule.
- Raw tokens are absent.
- Dashboard gaps are explicit.

## References
- Analytics runbook/report templates: [references/analytics-reference.md](references/analytics-reference.md)
- Dashboard linkage: [../bb-dashboard/SKILL.md](../bb-dashboard/SKILL.md)
- Research handoff: [../bb-research/SKILL.md](../bb-research/SKILL.md)
