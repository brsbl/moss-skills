# Research Reference

## Scope The Pass

Start by writing the decision the research needs to support:

- What product, feature, technical approach, or workstream is being considered.
- What the manager or user needs to decide next.
- What is out of scope for this pass.
- What evidence would change the recommendation.

Prefer a small set of high-quality sources over broad collection. Stop when the report can support a planning decision and the remaining gaps are explicit. Follow the shared human-readable artifact guidance in [../../WORKFLOWS.md](../../WORKFLOWS.md).

If research includes a mockup, UI proposal, or prototype, use `moss-html` for that mockup portion when visual or interactive rendering helps humans understand it.

Use canvas/`moss-canvas` for wireframes, flows, and diagrams. Keep plain prose and evidence synthesis in Markdown.

## Source Targets

Use the tools available in the current environment. Prefer primary and current sources:

- Official documentation, API references, changelogs, specs, or standards.
- Product docs, pricing pages, onboarding flows, support docs, and release notes.
- Reference products, comparable workflows, open-source implementations, or public design systems.
- Best-practice articles from credible practitioners or vendors.
- Common pitfalls, failure modes, accessibility guidance, performance guidance, and security or privacy considerations.

For each source, record the title, URL or local path, publisher or owner when useful, and date accessed when the topic may change.

## UI And Screenshot Evidence

When researching interfaces, onboarding, dashboards, editors, collaboration, settings, or other user-facing flows:

- Use browser tooling to inspect the live product or reference when available.
- Capture screenshots for layout, states, empty states, error states, and interaction examples that influence the recommendation.
- Store screenshots under the same research directory, usually `research/screenshots/`.
- Link each screenshot with the source URL, capture date, and what it proves.

If browser tooling, account access, geography, paywalls, or app state prevents capture, write a blocker instead of implying evidence exists:

```markdown
HUMAN-needed: Could not capture <reference> because <tool/access blocker>. Needed to verify <specific UI claim or planning input>.
```

## Artifact Location

Research artifacts belong in the Moss workspace:

```text
~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/research/
```

Use dated filenames so multiple passes can coexist:

```text
YYYY-MM-DD-<topic>-research.md
screenshots/
```

When a `dashboard.md` or planning artifact already exists for the workstream, link the report from it. Do not create a dashboard or plan only to add a link unless the manager requested that artifact.

Do not store bb research reports, screenshots, browser exports, or scratch evidence in a repo checkout unless the user explicitly asks to commit them.


## Related Handoffs

- Use [bb-workstream](../../bb-workstream/SKILL.md) when research starts or changes a managed workstream.
- Use [bb-planning](../../bb-planning/SKILL.md) to convert recommendations, options, risks, and open questions into worker-ready scopes.
- Use [bb-dashboard](../../bb-dashboard/SKILL.md) to link the research report, screenshots, blockers, and decisions from the canonical workstream status surface.

## Report Template

```markdown
# Research: <topic>

Date: YYYY-MM-DD
Workstream: <slug>
Question: <decision this research supports>

## Recommendation

<recommended option and why>

## Options

| Option | Pros | Cons | Best Fit |
| --- | --- | --- | --- |
| <option> | <source-backed advantages> | <tradeoffs> | <when to choose it> |

## Evidence

| Source | Link | Used For | Confidence |
| --- | --- | --- | --- |
| <title> | <URL or path> | <claim or decision input> | high/medium/low |

## UI Or Reference Captures

| Capture | Source | Shows | Notes |
| --- | --- | --- | --- |
| `screenshots/<file>.png` | <URL> | <state or pattern> | <capture notes> |

## Assumptions

- <claim that is not directly proven>

## Risks

- <risk, impact, and mitigation or owner>

## Open Questions

- <question that blocks or shapes planning>

## Planning Inputs

- Scope implications:
- Acceptance criteria:
- Non-goals:
- Dependencies:
- Validation or QA needs:
- Follow-up research:
```

Remove irrelevant sections, but keep recommendation, options, evidence, risks, open questions, and planning inputs.

## Quality Bar

Before handing off research:

- Claims are tied to source links or marked as assumptions.
- Options are comparable and decision-oriented.
- The recommendation explains why it fits the stated constraints.
- Screenshot needs are satisfied or recorded as `HUMAN-needed`.
- Planning inputs are concrete enough for `bb-planning` or `bb-workstream`.
- Source limitations, stale information, account restrictions, and unresolved risks are visible.
