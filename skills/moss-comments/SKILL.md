---
name: moss-comments
description: |
  Minimal comment annotation syntax for Moss notes. Use when adding, preserving, or editing note comments.
type: documentation
people: []
tags:
  - comments
  - annotations
  - markdown
status: active
created_date: '2026-03-26'
tools:
  - Moss
---

# Comments

Comments require both body markers and `comments.json`.

## Body Markers

Wrap the exact annotated range:

```markdown
The %%m:c1:start%%current layout%%m:c1:end%% needs work.
```

- IDs may contain letters, numbers, hyphens, and underscores.
- Start and end markers are both required.
- Multiple comments can share one range: `%%m:a,b:start%%text%%m:a,b:end%%`.

## Sidecar Metadata

Write `comments.json` beside the note markdown file:

```json
{"c1":{"text":"Tighten this wording.","createdAt":1707900000,"updatedAt":1707900000,"source":"agent"}}
```

- Every marker ID needs matching sidecar metadata.
- Every sidecar key needs matching body markers.
- Use `"source":"agent"` for comments you create.

## Placement

- Plain text: wrap the exact words.
- Inline nodes: wrap the entire token, for example `%%m:x:start%%[[Project Plan]]%%m:x:end%%`.
- Block nodes: put markers on standalone lines around the whole block.

```markdown
%%m:b1:start%%
![Demo](assets/demo.png)
%%m:b1:end%%
```

Do not place markers inside wiki links, formulas, fenced block payloads, or raw HTML comments.
