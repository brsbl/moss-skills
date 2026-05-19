---
name: moss-comments
description: Comment annotation syntax for Moss notes. Use when adding, preserving, or editing note comments and their sidecar metadata.
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
{"c1":{"text":"Tighten this wording.","createdAt":1707900000,"updatedAt":1707900000,"source":"external"}}
```

- Every marker ID needs matching sidecar metadata.
- Every sidecar key needs matching body markers.
- `source` values: `"external"` for comments written by an external agent (you), `"agent"` reserved for the in-app Moss agent, `"user"` for human comments. Missing `source` is treated as `"agent"` for backward compatibility — always set `"external"` explicitly.

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

## Image Attachments

Comments may include image attachments stored under the note's `assets/` directory:

```json
{"c1":{"text":"See screenshot.","createdAt":1707900000,"updatedAt":1707900000,"source":"external","imageUrls":["assets/comment-abc.png"]}}
```

- Use the `imageUrls` array with note-relative paths under `assets/`.
- To read an attached image, resolve the path against the note's directory and read the file from `assets/`.

## @Mentions

Mentions appear inline within the comment `text` string. Each mention's display title is wrapped with U+2063 (INVISIBLE SEPARATOR) before and U+2064 (INVISIBLE PLUS) after, e.g. `Re: ⁣Project Plan⁤ scope`.

- Preserve the wrappers verbatim when editing comment text — the renderer uses them to display the mention as a pill.
- To read the plain text of a mention, strip the U+2063/U+2064 characters.
- Mentions are display-only metadata; you cannot create new functional mentions by inserting these characters around arbitrary titles.
