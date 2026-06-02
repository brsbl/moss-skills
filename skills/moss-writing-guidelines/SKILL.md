---
name: moss-writing-guidelines
description: Writing and scannability guidelines for Moss notes. Use when creating, editing, restructuring, or reviewing a note for reader-first structure, node choice, scannability, note quality, or writing guidelines.
---

# Moss Writing Guidelines

Write every Moss note for a reader who skims first and reads second. Lead with the answer, structure for scanning, and reach for a richer node only when it makes the note easier to scan.

Related skill: note structure and syntax (`moss-notes`).

## Summary First

- Open with the answer, decision, or takeaway — not background or process.
- The first line should stand on its own. A reader who stops there still gets the point.
- State conclusions before evidence; put caveats and supporting detail after.

## Progressive Disclosure

- Order sections most- to least-important. Front-load what most readers need.
- Use H2 for major sections, H3/H4 for subsections. Never add a second H1.
- Keep paragraphs short (2-4 sentences). Break walls of prose into lists, tables, or sections.
- Push deep detail, derivations, or side caveats into later sections, callouts, or comments.

## Choose the Right Node

Pick the lightest node that makes the content scannable. Match content shape to node:

| Content | Use |
| --- | --- |
| A few key points or steps | Bullet / numbered list |
| Structured comparison, status, or options across attributes | Table |
| Important caveat, warning, or priority aside | Callout |
| Trend or magnitude over an ordered axis | Chart |
| Code, commands, logs, or literal spaced text | Code block |
| Rough diagram, wireframe, or spatial layout | Canvas |
| Side context that shouldn't interrupt the body | Comment |
| Working UI, behavior demo, or interactive prototype | HTML block |
| 2-4 mutually exclusive views of one thing | Tabs |

Use rich nodes when they improve scanning, not gratuitously. A short list often beats a table; a table often beats a chart for a handful of values. When two nodes fit, choose the simpler one.

## Note Archetypes

- **Decision / proposal:** recommendation up top → options (table or tabs) → tradeoffs → next steps.
- **Plan / task list:** goal → checklist or numbered steps → owners and status in a table → open questions.
- **Research / analysis:** key findings first → supporting detail grouped by theme → sources at the end.
- **Reference / how-to:** one-line definition → steps or rules as lists → examples in code blocks.
- **Status / update:** headline status (callout) → what changed → what's next.

## Final Review Checklist

Re-read the whole note before finishing and confirm:

- The opening states the takeaway; a skimmer gets the point from headings plus first lines.
- Sections run most- to least-important; hierarchy is consistent (one H1, H2+ below).
- Every node earns its place and is the simplest fit for its content.
- No walls of prose, duplicated content, broken transitions, or inconsistent terms.
- Metadata (status, tags, dates) lives in frontmatter, not duplicated in the body.
