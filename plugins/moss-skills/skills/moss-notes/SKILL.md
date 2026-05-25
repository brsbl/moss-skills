---
name: moss-notes
description: Create or edit Moss notes under ~/Moss/Notes/ using canonical Moss markdown syntax, note directories, assets, charts, callouts, wiki links, comments, and HTML mockups.
---

# Moss Notes

Related skills: frontmatter (`moss-frontmatter`), comments (`moss-comments`), wiki links (`moss-wiki-links`), mockups (`moss-mockup`).

## Files

- Notes are directories under `~/Moss/Notes/`.
- Folders organize notes. Subfolders and nested folders under `~/Moss/Notes/` are valid; create them when grouping helps or when the user asks.
- Edit the existing markdown content file in the note directory.
- New notes: create a directory (nested folders allowed) and a markdown file with the first line as `# Title`.
- Do not create or edit app-owned sidecars such as `meta.json`, `.folder.json`, or `layout.json`; Moss writes these automatically, except when a task explicitly includes preserving or updating an existing app-supported table layout metadata mechanism.
- `comments.json` is a content sidecar: edit it only via the comments skill.
- `assets/` is note-local content storage for referenced media, not metadata.
- Use one H1 title only. Body headings start at H2.

## Layers

- Frontmatter is an optional YAML block at the top.
- The first H1 is the note title.
- Body markdown follows the title.
- Comments use body markers plus a sibling `comments.json`; see the comments skill (`moss-comments`).

## Core Syntax

### Headings

Use headings to structure note sections. H1 is reserved for the note title; use H2/H3+ for body hierarchy and scannable/collapsible sections.

### Tables

Use tables for structured comparisons, compact data, status matrices, or checklists where rows and columns make scanning easier than prose.

```markdown
| Column A | Column B |
| --- | --- |
| Value | Value |
```

- Keep each row on one line.
- Keep column counts consistent.
- Size table columns thoughtfully for the available space and content shape when the app/table layout supports it.
- Use narrow widths for compact columns such as status, owner, priority, dates, IDs, counts, and short labels.
- Use wider widths for description, evidence, decision, rationale, next action, notes, and other prose-heavy columns.
- Avoid equal-width tables when content clearly needs different proportions; do not waste space on tiny columns or cramp long-text columns.
- Cells may contain supported text-level syntax such as emphasis, links, wiki links, inline code, formulas, highlight, underline, and image markdown as cell content. Keep the table row structure valid.
- Escape literal table pipes as `\|`, except inside formulas.
- If app-supported table layout metadata exists in the artifact being edited (for example `layout.json`) and the task includes preserving or setting table layout, use that mechanism for sensible column widths.
- If no supported layout metadata is available, keep Markdown valid and let Moss/app layout handle widths.
- Do not encode widths in Markdown comments, raw HTML, or hidden hacks.

### Images And Video

Use images for visual evidence, diagrams, screenshots, and local media assets; use video for playable recordings or YouTube references.

```markdown
![Alt text](assets/file-name.png)
![Demo recording](assets/demo-recording.mp4)
![YouTube demo](https://youtu.be/dQw4w9WgXcQ)
```

- Images: PNG, JPG, GIF, WebP, SVG.
- Video: local `.mp4`, `.webm`, `.mov`, or YouTube URLs.
- Prefer note-local assets. Do not use `file://` or absolute local paths.
- Preserve existing URLs exactly unless asked to change them.
- Remote non-YouTube video files are not video nodes.

### Code Blocks

Use code blocks for source code, command snippets, logs, SQL, JSON/config, or literal text that should keep spacing. Use standard fenced code blocks with a language identifier:

````markdown
```sql
SELECT id, title FROM notes WHERE updated_at > '2026-01-01';
```
````

Bundled languages: `javascript` (`js`), `typescript` (`ts`), `jsx`, `tsx`, `python` (`py`), `json`, `sql`, `css`, `html` (`htm`), `markdown` (`md`), `bash` (`sh`, `shell`, `zsh`), `plaintext` (`text`, `txt`). Unknown identifiers fall back to plain text.

### Charts

Use charts when visual comparison or trend shape is clearer than a short table/list.

````markdown
```moss-chart
{"type":"bar","data":[{"label":"Q1","value":100}]}
```
````

Use current chart types only: `bar`, `stacked-bar`, `line`, or `area`. Use `series` for multi-series charts except `stacked-bar`.

- `bar`: compare values across categories or rankings.
- `stacked-bar`: show part-to-whole composition across categories or compare category breakdowns.
- `line`: show change over time or an ordered sequence.
- `area`: show trend magnitude or volume over time.
- Do not use `donut` or `pie`.
- Avoid charts when a short list/table is clearer or data is too sparse or ambiguous.

### Callouts

Use callouts to separate high-signal notes from body prose: informational context, warnings, or priority items.

````markdown
```moss-callout
warning
Watch this before shipping.
```
````

First payload line is the type. The editor normalizes to this bare form on save, so do not write `type: ...`. Types: `info`, `warning`, `priority`.
Priority callouts can optionally put a level on the second line before the content.

### Canvas

Prefer `moss-canvas` for wireframes, flows, diagrams, ASCII-style diagrams, flow charts, rough spatial layouts, hand-drawn/diagrammatic visuals, and other rough visual thinking. Avoid it for geographic maps or precise visualizations. The canvas uses a 120x60 grid. Legacy `moss-sketch` fences still import as the same canvas; new content should write `moss-canvas`.

### HTML Mockups

Use `moss-html` fenced blocks when rendered HTML or interactivity is the right artifact, such as mockups, UI proposals, prototypes, and interactive design mockups. See the mockup skill (`moss-mockup`).

### Tabs

Use tabs for 2-4 alternate views, options, examples, or mutually exclusive variants that share the same context.

```markdown
:::tabs
=== Option A
Content here.

=== Option B
Other content.
:::
```

Use 2-4 tabs unless the user asks for more.

### Text-Level Syntax

Use text-level syntax for compact references and emphasis inside paragraphs, list items, or table cells. See the wiki-link skill for link details (`moss-wiki-links`).

| Format | Syntax |
|--------|--------|
| Wiki link | `[[Note Title]]` |
| Highlight | `<mark data-color="yellow">text</mark>` |
| Underline | `<u>text</u>` |

- Wiki links connect notes/headings or create navigable references in the Moss workspace; see the wiki-link skill for variants.
- Highlight marks important text, status, or attention within prose; use `<mark data-color="yellow">...</mark>` rather than `==...==`.
- Underline is for intentional emphasis where it will not be confused with a link.
- Color literals (`#rgb`, `#rgba`, `#rrggbb`, `#rrggbbaa`, `rgb()`/`rgba()`, `hsl()`/`hsla()`) in body text, inline code, and code blocks automatically get a hover swatch preview; write them plainly and do not wrap them in custom spans, HTML, or `data-*` attributes.

### Formulas And Variables

Use formulas and variables for compact computed or labeled values displayed inline with surrounding text or table cells.

- `Formula` is an unnamed executable expression like `=2+2`.
- `Variable` is a named value — executable like `sum=2+2`, or symbolic like `timeline=6 weeks`. Any named variable can be referenced from other formulas through the cross-note lookup/typeahead, whether its value is executable or symbolic.

Stored markdown syntax for both kinds of pills:

```markdown
{{source|display}}
```

- Writing `{{source|display}}` into a note creates a live pill. When showing the syntax as a code example in prose, wrap it in backticks.
- Put the source (expression or symbolic label) before the first `|` and the rendered display value after it.
- Keep pills inline; do not use them for multi-line calculations or chart data.
- Pipes inside pills are part of the syntax and do not split table cells.

## Avoid

- Raw HTML except supported `<mark>`, `<u>`, `<blockquote>`, and `moss-html` blocks.
- Mermaid as rendered diagrams.
- Placeholder image URLs.
- Duplicating frontmatter fields in the body.
