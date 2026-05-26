---
name: moss-mockup
description: Author self-contained moss-html mockups, UI proposals, prototypes, and embedded designs in Moss notes.
---

# HTML Mockups

Use `moss-html` when rendered HTML or interactivity is the right artifact for mockups, UI proposals, prototypes, or embedded designs. Prefer semantic markdown, charts, callouts, `moss-canvas`, or images when those fit the request; see the notes skill for those node types (`moss-notes`).

Embed mockups directly in the note:

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
  html { background: rgb(253 250 246); }
  body {
    width: 1200px;
    min-height: 900px;
    margin: 0;
    padding: 40px;
    background: rgb(253 250 246);
    color: rgb(72 67 60);
    font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
  }
</style>
</head>
<body>
  <!-- mockup content -->
</body>
</html>
```
~~~

Rules:

- Use a plain `moss-html` fence line; do not add dimensions to the fence.
- Keep HTML self-contained in the fence. Inline CSS, JS, and images; workspace asset paths inside the fence do not resolve, and remote fonts, scripts, images, or other network assets are not reliable.
- The iframe sandbox allows scripts, forms, modals, and popups, but not same-origin access. Do not rely on `localStorage`, `sessionStorage`, cookies, same-origin fetches, parent/window APIs, or Moss internals.
- Define intrinsic size on `body` or `html` with `width` and `height` or `min-height`; Moss uses that footprint for the static PNG preview, defaulting to 1200x900 if omitted.
- Note view shows a static screenshot first, then a live iframe after activation. Design a meaningful initial state without depending on JS or network.
- Fullscreen mode exists, but the design should still read clearly within the note-view max height.
- Multiple mockups should be separate fences.
- Scripts, forms, dialogs, popups, and CSS-only interactions can be used.
- Initialize script behavior with `DOMContentLoaded`.
- If a control looks interactive (checkbox, toggle, tab, filter, menu, button), make it work with native controls and minimal script. Do not draw inert controls with plain `div`s.
- Keep `<meta name="moss-html-version" content="v1">` as the canonical Moss document marker. Moss may auto-wrap fragments and canonicalize the shell/head metadata on save; you own visible body content and any extra CSS/JS.
- If the HTML contains literal triple backticks, wrap the fence with four or more backticks.
- Use Moss visual language: warm page background, Moss green accents, subtle borders/shadows, no emojis.
