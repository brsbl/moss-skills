---
name: moss-comments
description: Comment annotation syntax for Moss notes. Use when adding, preserving, or editing note comments and their sidecar metadata.
---

# Comments

Root comments need both body markers and a matching `comments.json` entry. Reply IDs carry a `parentId`, live only in `comments.json`, and must be reachable from a root comment.

## Body Markers

Wrap the exact annotated range:

```markdown
The %%m:c1:start%%current layout%%m:c1:end%% needs work.
```

- IDs may contain letters, numbers, hyphens, and underscores.
- Start and end markers are both required.
- Multiple comments can share one range: `%%m:a,b:start%%text%%m:a,b:end%%`.

## Sidecar Metadata

For Moss workspace notes, write `comments.json` beside the note markdown file inside the note directory. If you are creating a note that already needs comments, create it as a note directory with a same-named markdown file rather than as a standalone `.md` file.

```json
{"c1":{"text":"Tighten this wording.","createdAt":1707900000,"updatedAt":1707900000,"source":"agent"}}
```

- Do not create `comments.json` or `assets/` beside a standalone `.md` file. Use a note directory for notes that need sidecars.
- For a standalone external `.md` file that is not a `<Title>/<Title>.md` note bundle, Moss reads comments from that note's mirror directory under `~/Moss/Notes/`, not beside the external file. Use the sidecar path Moss provides when one is available.
- Every body marker ID is a root comment and needs matching sidecar metadata.
- Every root comment ID needs matching body markers.
- Reply IDs with `parentId` live only in sidecar metadata and must be reachable from a root comment.
- When you create a comment or reply, set `source` to your execution context: `"agent"` for the in-app Moss agent, `"external"` for writers editing files outside Moss, and `"user"` only for human/UI-authored comments.
- Existing sidecars may include `source` or `resolvedBy` metadata. Preserve existing attribution fields unless the user explicitly asks to change them.
- Existing sidecars may omit `source`. Treat missing source as legacy/unknown; do not backfill it or infer it from context.
- Resolved comments keep their body markers and sidecar entries. Add `resolvedAt` (Unix timestamp in seconds), set `resolvedBy` to your execution context when known, and update `updatedAt` on the root comment and every descendant reply.

## Threading

Thread replies live in `comments.json`; body markers only anchor root comments.

```json
{
  "c1": {"text":"Original.","createdAt":1707900000,"updatedAt":1707900000,"source":"user"},
  "c1-r1": {"text":"Following up.","createdAt":1707900100,"updatedAt":1707900100,"source":"agent","parentId":"c1"}
}
```

- Only the root comment id appears in body markers. Reply ids at any depth live only in `comments.json` sidecar metadata.
- `parentId` is optional and may point at a root comment or another reply.
- A reply's `source`, when present, is independent of its parent's `source`.
- Do not create cycles or point `parentId` at a missing id.

## Placement

- Plain text: wrap the exact words.
- Inline nodes: wrap the entire token, for example `%%m:x:start%%[[Project Plan]]%%m:x:end%%`.
- Block nodes: put markers on standalone lines around the whole block.

```markdown
%%m:b1:start%%
![Demo](assets/demo.png)
%%m:b1:end%%
```

Do not place markers inside wiki links, formula/variable pills, color code pills, fenced block payloads, or raw HTML comments. Treat atomic inline pills as indivisible; wrap the whole node or surrounding phrase instead. For color literals such as `#4f8a6b`, `rebeccapurple`, or `rgb(72, 67, 60)`, prefer annotating the surrounding sentence or phrase rather than trying to split the literal itself.

## Resolving Comments

- Review every open comment before acting.
- If a comment is a question, ambiguous, asks for clarification, or needs user confirmation, reply or request clarification and leave it open.
- If a comment is clear and actionable, apply the requested change to the note.
- Once the requested change has been applied, resolve the whole thread by setting `resolvedAt`, `resolvedBy`, and `updatedAt` on the root comment and every descendant reply.
- Do not remove comment body markers or sidecar metadata when resolving. Resolved comments remain in `comments.json` and are hidden by default in the UI.
- Deleting a comment thread is a separate user-level action with confirmation. Delete removes the root body markers and sidecar entries for the root plus descendants.

## In-App Agent Comment Context

When the in-app Moss agent receives comment context from the prompt box, the prompt carries compact comment IDs instead of full quoted comment text.

- Look up the listed root IDs and message IDs in the active note's comments sidecar before editing.
- Use the active note body markers to locate the annotated ranges.
- Edit the note body to address the requested comments.
- Edit the active note's comments sidecar directly when adding replies, adding comments, or resolving threads. Keep valid JSON and preserve unrelated metadata.
- When adding a comment or reply from the in-app agent, set `source` to `"agent"`; external writers editing files outside Moss should set `"external"`.
- When the requested change is complete, resolve the root comment and every descendant by setting `resolvedAt`, `resolvedBy`, and `updatedAt`.
- If a comment is ambiguous or still needs clarification, reply in `comments.json` or leave it open; do not set resolved fields.
- The in-app agent may write only the active note's comments sidecar. External writers outside the app may edit sidecars directly when they have filesystem access.

## Image Attachments

Comments may include image attachments stored under the note's `assets/` directory:

```json
{"c1":{"text":"See screenshot.","createdAt":1707900000,"updatedAt":1707900000,"source":"agent","imageUrls":["assets/comment-abc.png"]}}
```

- Use the `imageUrls` array with note-relative paths under `assets/`.
- To read an attached image, resolve the path against the note's directory and read the file from `assets/`.

## @Mentions

Mentions in comment text are references to notes, files, or folders. Each displayed mention is wrapped with U+2063 (INVISIBLE SEPARATOR) before and U+2064 (INVISIBLE PLUS) after, e.g. `Re: ⁣@Project Plan⁤ scope`.

- When a comment asks you to use or inspect an @mention, use the available mention id/path or note sidecar metadata to resolve and read the referenced target before acting.
- Mentioned targets may be inside or outside the Moss notes directory; do not assume `~/Moss/Notes/`.
- If the mention cannot be resolved or multiple targets match, report the ambiguity instead of inventing a path.
- Preserve the wrappers verbatim when editing existing comment text — the renderer uses them to display the mention as a pill.
