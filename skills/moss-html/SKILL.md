---
name: moss-html
description: Author self-contained moss-html blocks for HTML previews, embedded HTML, interactive prototypes, and behavior demos in Moss notes.
---

# Moss HTML

Use `moss-html` when the artifact needs browser behavior or high-fidelity UI rendering: clickable controls, tabs, filters, menus, forms, animated states, realistic spacing/styling, or a small prototype that demonstrates how an interaction should work. Do not use HTML for plain prose, tables, simple diagrams, static screenshots, or rough spatial thinking; use semantic markdown, charts, callouts, Canvas, or images for those instead. For rough wireframes, flows, and spatial diagrams, use the Canvas node with the canonical `moss-canvas` fence.

Embed HTML directly in the note:

~~~markdown
```moss-html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="moss-html-version" content="v1">
<style>
  * { box-sizing: border-box; }

  :root {
    --moss-surface-canvas: #FFFFFF;
    --moss-surface-canvas-bg: #F4F4F2;
    --moss-surface-panel: #F7F6F3;
    --moss-ink-default: #48433C;
    --moss-ink-muted: #615C55;
    --moss-border-subtle: #EDEAE4;
    --moss-accent-brand: #378055;
  }

  html {
    background: var(--moss-surface-canvas-bg);
  }

  body {
    width: 1200px;
    min-height: 900px;
    margin: 0;
    padding: 40px;
    background: var(--moss-surface-canvas);
    color: var(--moss-ink-default);
    font-family: "Inter", -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
  }
</style>
</head>
<body>
  <!-- HTML preview or prototype content -->
</body>
</html>
```
~~~

Rules:

- Use a plain `moss-html` fence line; do not add dimensions to the fence.
- Keep HTML self-contained in the fence. Inline CSS, JS, and images; workspace asset paths inside the fence do not resolve, and remote fonts, scripts, images, or other network assets are not reliable.
- The preview runs in an isolated data URL. Scripts, forms, modals, and popups work, but do not rely on `localStorage`, `sessionStorage`, cookies, same-origin fetches, parent/window APIs, or Moss internals.
- Define intrinsic size on `body` or `html` with `width` and `height` or `min-height`; Moss captures at least that footprint for the static PNG preview, defaulting to 1200x900 if omitted.
- Note view shows a static screenshot first, then a live iframe after activation. Design a meaningful initial state without depending on JS or network.
- Fullscreen mode exists, but the design should still read clearly within the note-view max height.
- Multiple HTML previews should be separate fences. Prefer several small focused blocks over one oversized all-in-one preview.
- Scripts, forms, dialogs, popups, and CSS-only interactions can be used.
- Initialize script behavior with `DOMContentLoaded`.
- If a control looks interactive (checkbox, toggle, tab, filter, menu, button), make it work with native controls and minimal script. Do not draw inert controls with plain `div`s.
- Keep `<meta name="moss-html-version" content="v1">` as the canonical Moss document marker. Moss may auto-wrap fragments and canonicalize the shell/head metadata when the note is opened; those shell changes persist on the next save. You own visible body content and any extra CSS/JS.
- If the HTML contains literal triple backticks, wrap the fence with four or more backticks.
- Use Moss visual language: light canvas surfaces, Moss green accents, subtle borders/shadows, no emojis.
