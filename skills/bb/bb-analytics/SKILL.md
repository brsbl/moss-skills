---
name: bb-analytics
description: Use when creating a PostHog analytics runbook for a product area, dashboard, or question, or when running an existing runbook to produce a repeatable analytics report with findings, evidence, and prioritized follow-ups. Covers dashboard discovery via the PostHog API, saved-tile replay, HogQL fallback, optional no-code dashboard-change recommendations, and Moss artifact layout for runbooks and reports.
---

# Moss BB Analytics

Use this skill to (1) author a PostHog analytics runbook that a future agent can re-run unattended, or (2) execute an existing runbook to produce a dated analytics report with health calls, evidence, and prioritized follow-ups. Prefer the PostHog API over the browser; the API is the source of truth for tile inventory, saved queries, layout, and live results.

## Inputs

- The question or decision the analytics work must support (e.g. "is the latest release healthy enough to trust product metrics?", "did this week's downloads recover?").
- Product area, dashboard ID/URL, event schema, release/version filter, and date range when known.
- Existing runbook path under `~/Moss/Notes/Agent Workspaces/bb Workspace/Runbooks/` when running a report.
- Existing report template under `~/Moss/Notes/Agent Workspaces/bb Workspace/Templates/` when one applies.
- Workstream slug when this analytics work feeds a managed workstream.
- PostHog credentials from `.env` or `~/.claude/projects/*/memory/posthog.md`. Never paste raw tokens into notes.

## Workflow — creating a runbook

1. Frame the decision the runbook must support and the cadence (daily, weekly, ad hoc). Pick one dashboard as the canonical surface.
2. Fetch the dashboard definition via the PostHog API and list the tile inventory, saved queries, layout, and current live values.
3. Identify the daily-read surface (top to bottom): which saved tiles answer the core question, and in what order. Capture component tiles separately.
4. Define "what healthy looks like" using benchmarks the report can compare against (ratios, thresholds, version filters).
5. Recommend no-code dashboard changes (tile add/rename/reorder/description) when they reduce ad hoc HogQL in the daily read. Apply them only when the user explicitly requested or approved dashboard maintenance for this pass; record every applied change with date in a `## No-Code Changes Applied` log.
6. Write the runbook to `~/Moss/Notes/Agent Workspaces/bb Workspace/Runbooks/<Runbook Name>/` using the action-first runbook contract in [references/analytics-reference.md](references/analytics-reference.md).
7. Pair the runbook with a report template under `~/Moss/Notes/Agent Workspaces/bb Workspace/Templates/<Template Name>/`. The runbook's report contract names the action-first sections and required evidence.
8. Cross-link the runbook and template via wiki links per [moss-wiki-links](../../moss-wiki-links/SKILL.md).

## Workflow — running a runbook to produce a report

1. Read the runbook end-to-end. Fetch the dashboard via the PostHog API and replay each daily-read tile's `tile.insight.query` exactly.
2. Use ad hoc HogQL only when the dashboard does not already answer a required question. If ad hoc is needed for a core daily read, record that as a dashboard gap in `## Top Actions`.
3. Apply the runbook's "what healthy looks like" thresholds to assign a status per layer (e.g. green/yellow/red, or pass/fail).
4. Compare against the most recent prior report of the same kind for direction (improved, flat, declined) and capture the deltas explicitly.
5. Write the report under `~/Moss/Notes/Agent Workspaces/bb Workspace/PostHog Reviews/<Report Title>/` using the template the runbook names. Lead with `Bottom Line`, `Decision Table`, and `Top Actions` so the doc is easy to act on quickly.
6. State internal vs external activation, release version, or other runbook-required splits explicitly even when a value is zero or blocked on telemetry.
7. Record `## Dashboard Changes Applied` (usually `None`) and any user-approved no-code patches that improved the next run.
8. Save sanitized working artifacts (dashboard JSON, replay JSON, ad hoc HogQL) under `$TMPDIR/posthog_<runbook-slug>_<date>/` for reproducibility. Never write raw tokens.

## Outputs

- Runbook note with a fast path, decision rules, daily read surface, dashboard gaps, no-code change log, report contract, and API appendix.
- Report note with bottom line, decision table, top actions with exit criteria, what changed, evidence, dashboard changes applied, and blockers when needed.
- Sanitized working artifacts in a tmp directory for reproducibility, never tokens.
- When this work feeds a managed workstream: a link from `dashboard.md` to the report and any new follow-up rows in the decision queue.

## Validation

- Every claim in the report is backed by a saved tile replay, an ad hoc HogQL query recorded in the working artifacts, or a runbook reference.
- Required sections from the runbook's report contract are all present; missing data is marked as blocked, not paraphrased.
- Dashboard gaps (anywhere the core read required ad hoc HogQL) are listed in `## Top Actions`.
- No raw API tokens appear in the runbook, report, or any committed artifact. Credentials are read from `.env` or the documented memory path.
- For UI/dashboard evidence beyond what the API returns, capture a screenshot or write a `HUMAN-needed` blocker; do not imply evidence that does not exist.
- Runbook and report live under the Moss workspace, not in a repo checkout.

## Safety And Operational Rules

- Read-only by default. Do not edit, delete, or rename PostHog tiles, dashboards, insights, or actions unless the user explicitly requests a no-code dashboard change. Log any such change in the runbook's `## No-Code Changes Applied` section.
- Never create new PostHog dashboards or destructive actions (delete tile, change saved query) without explicit user approval and a recorded justification.
- Treat the personal API key as a secret. Source it from `.env` or `~/.claude/projects/*/memory/posthog.md`. Do not echo, log, paste into notes, or commit it.
- When date ranges, release filters, or version splits are part of the question, set them explicitly in every query and report them in the read so a future run is reproducible.
- For agent or release health, keep crash, IPC, and main-process surfaces in the daily read even when low volume.

## References

- Action-first runbook/report contracts, PostHog API pattern, no-code change rules, artifact layout, and quality bar: [references/analytics-reference.md](references/analytics-reference.md).
- Run analytics inside a managed workstream: [bb-workstream](../bb-workstream/SKILL.md).
- Link runbooks, reports, and dashboard gaps from the canonical status surface: [bb-dashboard](../bb-dashboard/SKILL.md).
- Use research to scope a new dashboard or metric before runbook creation: [bb-research](../bb-research/SKILL.md).
- Moss note authoring rules: [moss-notes](../../moss-notes/SKILL.md), [moss-frontmatter](../../moss-frontmatter/SKILL.md), [moss-comments](../../moss-comments/SKILL.md), [moss-wiki-links](../../moss-wiki-links/SKILL.md), [moss-mockup](../../moss-mockup/SKILL.md).
