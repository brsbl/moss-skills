# Analytics Reference

Runbooks define how to read a PostHog dashboard. Reports are dated runs of a runbook, written for the user.

## Scope

Before querying PostHog, capture:

- question / decision
- dashboard URL, `project_id`, `dashboard_id`
- date range, release/version filter, dimensions
- healthy threshold or comparison baseline
- workspace; use `bb Workspace`

## API Pattern

Prefer API over browser:

1. Fetch dashboard JSON.
2. Replay saved `tile.insight.query` exactly.
3. Use ad hoc HogQL only for gaps.
4. Record core-read gaps in report `Top Actions`.

```bash
curl -sS \
  -H "Authorization: Bearer $POSTHOG_PERSONAL_API_KEY" \
  "https://us.posthog.com/api/projects/<project_id>/dashboards/<dashboard_id>/"

curl -sS -X POST \
  -H "Authorization: Bearer $POSTHOG_PERSONAL_API_KEY" \
  -H "Content-Type: application/json" \
  "https://us.posthog.com/api/projects/<project_id>/query/" \
  --data-raw '{"query": <tile.insight.query>}'
```

Credentials come from `.env` or `~/.claude/projects/*/memory/posthog.md`. Never echo, paste, log, or commit tokens.

Working files go under `$TMPDIR/posthog_<slug>_<YYYY-MM-DD>/` (`dashboard.json`, `replay.json`, optional `adhoc.sql`).

## Discovery

For new questions, verify what production emits:

```sql
SELECT event, count()
FROM events
WHERE timestamp > now() - INTERVAL 30 DAY
GROUP BY event
ORDER BY count() DESC
```

Missing expected events are telemetry gaps, not proof of zero activity.

## Dashboard Changes

Read-only by default.

With explicit user approval, agents may add/rename/reorder tiles or update dashboard descriptions. Log applied changes in `## No-Code Changes Applied`.

Never without explicit approval and justification: delete tiles/dashboards, change saved queries, create dashboards, or alter sharing/permissions.

## Moss Paths

Only write `.md`; never write `meta.json`.

```text
Runbook:
~/Moss/Notes/Agent Workspaces/bb Workspace/Runbooks/<Runbook Name>/<Runbook Name>.md

Report template:
~/Moss/Notes/Agent Workspaces/bb Workspace/Templates/<Template Name>/<Template Name>.md

Report:
~/Moss/Notes/Agent Workspaces/bb Workspace/PostHog Reviews/<Report Title>/<Report Title>.md
```

## Runbook Contract

A runbook should make the next report fast. Put action logic before background.

Frontmatter: `status: runbook`, `type: reference`, tags `runbook`, `analytics`, `posthog`, product area, `agents`; `related` links to the report template.

Required sections, in order:

1. `## Fast Path` — 5-8 steps a fresh agent follows to produce the report. Include dashboard URL, `project_id`, `dashboard_id`, tile read order, required filters, and report destination.
2. `## Decision Rules` — thresholds for Green/Yellow/Red or Pass/Watch/Block. Include exact escalation triggers and what action each trigger implies.
3. `## Daily Read Surface` — only the tiles needed for the report, ordered top-to-bottom. For each tile: title, purpose, saved-query replay note, and how to interpret it.
4. `## Dashboard Gaps` — questions the report still needs ad hoc HogQL to answer. These become report `Top Actions` until fixed.
5. `## No-Code Changes Applied` — dated log, or `None`.
6. `## Report Contract` — report title format, template link, required sections, and any must-say splits such as internal/external activation or release version.
7. `## Appendix: API Details` — curl snippets, optional exploratory HogQL, and non-daily dashboard context.

Avoid long dashboard inventories unless they change decisions. Put historical or supporting tiles in the appendix.

## Report Contract

A report should answer quickly: **what is the status, what changed, what should happen next, and what evidence supports it?**

Frontmatter: `status: active`, tags `posthog`, product area, `review`; `related` links to runbook and template.

Required sections, in order:

1. `## Bottom Line` — 3 bullets max: status, main reason, immediate action.
2. `## Decision Table` — action-oriented layer table.

   | Layer | Status | Evidence | Action |
   | --- | --- | --- | --- |
   | Acquisition | Red/Yellow/Green | exact number + comparison | do / watch / ignore |

3. `## Top Actions` — only things worth doing next.

   | Priority | Owner | Track | Next step | Exit criteria |
   | --- | --- | --- | --- | --- |

4. `## What Changed` — prior -> current deltas for headline metrics. Say `new this run` when no prior exists.
5. `## Evidence` — saved tile replays and ad hoc HogQL used. Include date range, release/version filters, and `$TMPDIR` artifact path.
6. `## Dashboard Changes Applied` — changes made today, or `None`.
7. `## Blockers` — missing credentials, telemetry gaps, screenshot gaps, or access issues. Omit if empty.

Rules:

- Lead with actions, not methodology.
- Keep narrative short; tables carry status and next steps.
- Every P0/P1 action needs an exit criterion.
- If a dashboard gap forced ad hoc HogQL, add a `Top Actions` row to fix the dashboard/runbook.
- Do not bury the only important action in `Evidence` or `Blockers`.

## Quality Bar

- Every claim has a saved tile replay, recorded HogQL, or runbook basis.
- Date ranges, release filters, dashboard IDs, and prior-report comparisons are explicit.
- Dashboard gaps appear in `Top Actions`.
- No raw tokens or PII are stored in notes or repo files.

## Related Skills

- [bb-workstream](../../bb-workstream/SKILL.md)
- [bb-dashboard](../../bb-dashboard/SKILL.md)
- [bb-research](../../bb-research/SKILL.md)
