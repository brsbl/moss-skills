---
name: moss-notes
description: Syntax and file rules for creating or editing Moss notes under ~/Moss/Notes/. Use when authoring or modifying notes, choosing a node type, or following Moss markdown conventions.
---

# Moss Notes

Related skills: writing guidelines (`moss-writing-guidelines`), frontmatter (`moss-frontmatter`), comments (`moss-comments`), links (`moss-links`), formulas and variables (`moss-formulas-variables`), canvas (`moss-canvas`), HTML (`moss-html`).

## Files

- Notes are directories under `~/Moss/Notes/`.
- Folders organize notes. Subfolders and nested folders under `~/Moss/Notes/` are valid; create them when grouping helps or when the user asks.
- Edit the existing markdown content file in the note directory.
- New notes: create a directory (nested folders allowed) and a markdown file with the first line as `# Title`.
- Do not create or edit app-owned sidecars such as `meta.json`, `.folder.json`, or `layout.json`; Moss writes these automatically.
- `comments.json` is a content sidecar: edit it only via the comments skill.
- `assets/` is note-local content storage for referenced media, not metadata.
- Use one H1 title only. Body headings start at H2.

## Layers

- Frontmatter is an optional YAML block at the top.
- The first H1 is the note title.
- Body markdown follows the title.
- Comments use body markers plus a sibling `comments.json`; see the comments skill (`moss-comments`).

## Writing Quality

Write notes for a reader who skims first: lead with the takeaway, order sections most- to least-important, and keep paragraphs short. Match the representation to the information's shape, hierarchy, and density: paragraph for one connective idea, bullets for several grouped points, table for repeated attributes, tabs as containers for peer views, ASCII code blocks for agent-generated diagrams and literal text, canvas only when the user asks for canvas, and scoped HTML for visual planning artifacts. Moss nodes compose — tabs can contain tables, callouts, charts, code, HTML, and commentable text. For the full reader-first structure, node composition guidance, note archetypes, and review checklist, see the writing guidelines skill (`moss-writing-guidelines`).

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
- Cells may contain supported text-level syntax such as emphasis, links, wiki links, inline code, formulas, highlight, underline, and image markdown as cell content. Keep the table row structure valid.
- Escape literal table pipes as `\|`, except inside formulas.
- Edit table markdown content only. Moss may preserve column widths in `layout.json` (app-managed); do not encode widths in markdown comments or HTML.

### Images, Video, And Webpage Embeds

Use images for visual evidence, diagrams, screenshots, and local media assets; use video for playable recordings or YouTube references; write a regular webpage URL as a bare standalone URL so Moss creates an inline web embed pill that opens in the in-app browser. See the links skill (`moss-links`) for YouTube, web-embed, and media-link behavior.

```markdown
![Alt text](assets/file-name.png)
![Demo recording](assets/demo-recording.mp4)
![YouTube demo](https://youtu.be/dQw4w9WgXcQ)
![Release thread](https://x.com/obsdmd/status/1580548874246443010)
https://linear.app/myteam/board
```

The `![alt](src)` syntax carries strong image intent; the `src` decides which node you get:

| `src` | Node |
| --- | --- |
| local video (`.mp4`/`.webm`/`.mov`) or a YouTube URL | video |
| tweet status URL | tweet card |
| any other URL, local/relative path, image URL, or known image host | image |

- Images: PNG, JPG, GIF, WebP, SVG.
- Video: local `.mp4`, `.webm`, `.mov`, or YouTube URLs.
- Do **not** write a regular webpage URL in `![…](…)` image syntax — it stays an image node and renders as a broken image. Use a bare URL in prose or on its own line so Moss creates a web embed pill instead.
- Web embed pills: public pages must use HTTPS; loopback development URLs (`localhost`, `127.0.0.1`, `::1`) may use HTTP. The legacy `?[text](url)` pill syntax still imports, but Moss exports pills as the raw URL. Details in `moss-links`.
- Prefer note-local assets. Do not use `file://` or absolute local paths.
- Preserve existing URLs exactly unless asked to change them.
- Remote non-YouTube video files are not video nodes.

### Code Blocks

Use code blocks for source code, command snippets, logs, SQL, JSON/config, ASCII wireframes, or literal text that should keep spacing. Use standard fenced code blocks with a language identifier:

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

Use `moss-canvas` for ASCII-style diagrams, simple wireframes, flow charts, rough spatial layouts, hand-drawn/diagrammatic visuals, and other rough visual thinking. See the canvas skill (`moss-canvas`) for detailed rules, including when to avoid canvas and when to use `moss-html` or `moss-chart` instead.

**ASCII code blocks vs moss-canvas:** If a reader needs to read words in the diagram body (option sketches, menu layouts, shortcut maps, before/after comparisons), use a plain fenced code block. If the value is in spatial layout and labels can float as overlays, use `moss-canvas`. For UI/UX proposal notes, use concise option cards with ASCII wireframes in code blocks when they clarify the decision; keep task plans concise and link to a separate proposal note when visuals get long.

### HTML

Use `moss-html` fenced blocks for scoped visual planning artifacts — prototypes, mockups, state boards, data-flow diagrams, explainers, behavior demos, and clickable UI states — as well as focused embedded HTML previews. Keep each block scoped to one job rather than one giant block, and ground UI HTML in the real product design. See the HTML skill (`moss-html`).

### Tabs

Use tabs as an outer container for 2-4 peer views, options, examples, personas, modes, or states that share one context and are best inspected one at a time.

```markdown
:::tabs
=== Option A
Content here.

=== Option B
Other content.
:::
```

Use 2-4 tabs unless the user asks for more. Tab panels may contain normal Moss content: headings, paragraphs, lists, tables, callouts, charts, code blocks, `moss-html`, media, links, formulas, and comment markers where those nodes are valid. Use a table or matrix instead when the reader needs to compare all peers side by side; use scoped HTML instead when seeing the whole visual state/layout at once is the point.

### Text-Level Syntax

Use text-level syntax for compact references and emphasis inside paragraphs, list items, or table cells. See the links skill (`moss-links`) for wiki links, Markdown links, YouTube links, and media-link behavior.

| Format | Syntax |
|--------|--------|
| Wiki link | `[[Note Title]]` |
| Highlight | `<mark data-color="yellow">text</mark>` |
| Underline | `<u>text</u>` |

- Wiki links connect notes/headings or create navigable references in the Moss workspace; see the links skill (`moss-links`) for variants and other link types.
- Highlight marks important text, status, or attention within prose; use `<mark data-color="yellow">...</mark>` rather than `==...==`.
- Underline is for intentional emphasis where it will not be confused with a link.
- Color literals in prose become atomic color pills and still export as plain text. Supported forms are 6-digit hex `#rrggbb` plus the functional `rgb()`/`rgba()` and `hsl()`/`hsla()` forms. Hex-like strings of any other length stay plain text — 3-, 4-, 7-, and 8-digit hex (`#456`, `#4567`, `#11223344`) and issue/PR-style refs are never turned into color pills. CSS named colors (e.g. `rebeccapurple`, `transparent`) and `currentColor` are not converted.
- Color literals inside inline code or fenced code blocks stay code. They get code-only preview affordances, not prose color pills. Write color values plainly and do not wrap them in custom spans, HTML, or `data-*` attributes.

### Formulas And Variables

Use formulas and variables for compact computed or labeled values displayed inline with surrounding text or table cells. The core use case is defining editable anchors, then deriving related values from those anchors so a note can show how a system changes together.

For detailed authoring rules — editable anchors, derived values, bound references, IDs, display values, and table-cell usage — use the formulas and variables skill (`moss-formulas-variables`).

## Avoid

- Raw HTML except supported `<mark>`, `<u>`, `<blockquote>`, and `moss-html` blocks.
- Mermaid as rendered diagrams.
- Placeholder image URLs.
- Duplicating frontmatter fields in the body.
