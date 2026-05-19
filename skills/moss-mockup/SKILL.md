---
name: moss-mockup
description: |
  Minimal instructions for authoring interactive HTML mockups in Moss notes with moss-html fences.
type: guide
people: []
tags:
  - mockups
  - design
  - html
status: active
created_date: '2026-03-26'
tools: []
---

# HTML Mockups

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
- Keep HTML self-contained in the fence.
- Define intrinsic size on `body` or `html` with `width` and `height` or `min-height`.
- Multiple mockups should be separate fences.
- Scripts, forms, dialogs, popups, and CSS-only interactions can be used.
- If a control looks interactive (checkbox, toggle, tab, filter, menu, button), make it work with native controls and minimal script. Do not draw inert controls with plain `div`s.
- Do not use remote fonts.
- If the HTML contains literal triple backticks, wrap the fence with four or more backticks.
- Use Moss visual language: warm page background, Moss green accents, subtle borders/shadows, no emojis.
