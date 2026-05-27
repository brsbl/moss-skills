---
name: moss-canvas
description: Create or edit Moss canvas blocks using the canonical moss-canvas fence for rough diagrams, wireframes, flows, and spatial visual thinking.
---

# Moss Canvas

Use `moss-canvas` for rough visual thinking inside Moss notes: ASCII-style diagrams, simple wireframes, flow charts, spatial layouts, and hand-drawn/diagrammatic sketches.

## Syntax

````markdown
```moss-canvas
[rough diagram content]
```
````

- New content must use the canonical `moss-canvas` fence.
- Legacy `moss-sketch` fences still import as canvas for old notes, but do not create new `moss-sketch` blocks.
- The canvas uses a 120x60 grid.

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
