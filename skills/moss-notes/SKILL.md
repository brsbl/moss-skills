---
name: moss-notes
description: |
  Minimal syntax and file rules for creating or editing notes in a Moss Notes workspace.
type: documentation
people: []
tags:
  - moss
  - markdown
  - notes
status: active
created_date: '2026-03-26'
tools:
  - Moss
  - YouTube
---

# Moss Notes

## Files

- Notes are directories inside the user's Moss Notes workspace.
- Edit the existing markdown content file in the note directory.
- New notes: create a directory and a markdown file with the first line as `# Title`.
- Never create or edit `meta.json`.
- Use one H1 title only. Body headings start at H2.
- Put local media in the note's `assets/` directory and reference it with relative paths.

## Layers

- Frontmatter is an optional YAML block at the top.
- The first H1 is the note title.
- Body markdown follows the title.
- Comments use body markers plus a sibling `comments.json`; see `comments.md`.

## Core Syntax

### Tables

```markdown
| Column A | Column B |
| --- | --- |
| Value | Value |
```

- Keep each row on one line.
- Keep column counts consistent.
- Escape literal table pipes as `\|`, except inside formulas.

### Images And Video

```markdown
![Alt text](assets/file-name.png)
![Demo recording](assets/demo-recording.mp4)
![YouTube demo](https://youtu.be/dQw4w9WgXcQ)
```

- Images: PNG, JPG, GIF, WebP, SVG.
- Video: local `.mp4`, `.webm`, `.mov`, or YouTube URLs.
- Prefer note-local assets. Do not use local-file URLs or absolute local paths.
- Preserve existing URLs exactly unless asked to change them.
- Remote non-YouTube video files are not video nodes.

### Charts

````markdown
```moss-chart
{"type":"bar","data":[{"label":"Q1","value":100}]}
```
````

Use `bar`, `line`, `area`, or `stacked-bar`. Use `series` for multi-series charts.

### Callouts

````markdown
```moss-callout
warning
Watch this before shipping.
```
````

First payload line is the type, not `type: ...`. Types: `info`, `warning`, `priority`.
Priority callouts can optionally put a level on the second line before the content.

### Sketches

Use `moss-sketch` only when the user asks for a sketch or hand-drawn diagram. Do not use it just to satisfy a broad request for varied node types, and do not use it for geographic maps or precise visualizations. It is a 60-column by 30-row text grid.

### HTML Mockups

Use `moss-html` fenced blocks for interactive mockups. See `mockup.md`.

### Tabs

```markdown
:::tabs
=== Option A
Content here.

=== Option B
Other content.
:::
```

Use 2-4 tabs unless the user asks for more.

### Inline

| Format | Syntax |
|--------|--------|
| Wiki link | `[[Note Title]]` |
| Formula | `{{expr\|result}}` |
| Highlight | `<mark data-color="yellow">text</mark>` |
| Underline | `<u>text</u>` |

## Avoid

- Raw HTML except supported `<mark>`, `<u>`, `<blockquote>`, and `moss-html` blocks.
- Mermaid as rendered diagrams.
- Placeholder image URLs.
- Duplicating frontmatter fields in the body.
