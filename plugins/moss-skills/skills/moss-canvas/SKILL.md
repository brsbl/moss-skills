---
name: moss-canvas
description: Create or edit Moss canvas blocks using the canonical moss-canvas fence for rough diagrams, wireframes, flows, and spatial visual thinking.
---

# Moss Canvas

Use `moss-canvas` for rough visual thinking inside Moss notes: ASCII-style diagrams, simple wireframes, flow charts, spatial layouts, and hand-drawn/diagrammatic sketches.

## ASCII Code Blocks vs moss-canvas

Use plain fenced code blocks for proposal visuals where **readable text matters**: option sketches, menu/dialog layouts, shortcut maps, before/after comparisons, acceptance criteria. ASCII wireframes render predictably and are easy to scan inline.

Use `moss-canvas` when the diagram is **spatial and meant to stay editable as canvas** — relative positions, connector flow, and rough shapes matter more than text fidelity. Grid characters become ink, not text; readable labels must be metadata overlays.

**Decision rule:** If a reader needs to read words in the diagram body, use a fenced code block. If the value is in spatial layout and labels can float as overlays, use moss-canvas.

### Structuring ASCII proposal visuals

Keep proposal diagrams compact in task/proposal notes:
- **Option card:** title + short wireframe + tradeoff bullets
- **Acceptance criteria** beside or below each wireframe
- When visuals grow long, link to a separate proposal note rather than bloating the task plan

```
Option A — Sidebar nav
┌──────┬─────────────┐
│ Nav  │  Content    │
│ ---- │             │
│ Home │  [editor]   │
│ Tags │             │
└──────┴─────────────┘
✓ Always visible   ✗ Eats horizontal space
```

## Syntax

````markdown
```moss-canvas
[rough diagram content]
```
````

- New content must use the canonical `moss-canvas` fence.
- Legacy `moss-sketch` fences still import as canvas for old notes, but do not create new `moss-sketch` blocks.
- The canvas uses a 120x60 grid.


## Authoring Reliable 120x60 Canvas Grids

Moss canvas is not a text diagram renderer. It stores a 120-column x 60-row boolean grid plus optional label metadata.

- Start new generated canvas blocks with `[moss:grid:v2]`.
- Use exactly 60 grid rows of up to 120 characters. Use `.` for empty cells.
- Any character other than `.` or a space imports as filled ink. Letters, arrowheads, and box-drawing glyphs do **not** render as text; they become filled cells.
- Put readable text in `[moss:labels:[...]]`, not in the grid. Labels are overlays with `col` and `row` grid coordinates.
- Keep labels short and place them inside clear whitespace, usually at least 2 cells from nearby strokes. If a label overlaps a line or box edge, move the label or simplify the drawing.
- Prefer sparse strokes: simple rectangles, vertical/horizontal connectors, and generous gaps. Avoid dense filled regions and long closed boxes whose interiors are crowded by connectors.
- Do not rely on ASCII arrowheads. Use line direction from layout and labels, or keep connectors as plain lines.
- When authoring by hand, generate the grid programmatically or count columns carefully; malformed row lengths are padded/truncated on import.
- Validate important canvas changes in the live Moss app with a screenshot. If you cannot validate, keep the diagram simpler or use image markdown / `moss-html` instead.

Example pattern:

````markdown
```moss-canvas
[moss:grid:v2]
[moss:labels:[{"id":"a","text":"Research","col":8,"row":8},{"id":"b","text":"Spec","col":42,"row":8}]]
........................................................................................................................
........................................................................................................................
....+-----------------------+.........+-----------------------+.........................................................
....|.......................|---------|.......................|.........................................................
....|.......................|.........|.......................|.........................................................
....+-----------------------+.........+-----------------------+.........................................................
........................................................................................................................
(continue to 60 rows total)
```
````

## Good Uses

- Rough UI wireframes.
- Flow diagrams and process maps.
- Spatial layouts where relative position matters.
- Lightweight sketches that should stay editable in Moss.

## Avoid

- Geographic maps.
- Precise charts or data visualizations; use `moss-chart` instead.
- High-fidelity UI prototypes or interactive behavior; use `moss-html` instead.
- Static screenshots or polished images; use image markdown and note-local assets.

## Review Checklist

- Fence is `moss-canvas`, not `moss-sketch`.
- Diagram fits the rough editable-canvas use case.
- Content does not pretend to be a precise chart, map, or interactive prototype.
- Existing legacy `moss-sketch` is preserved only when reviewing old content unless the user asks to migrate it.
