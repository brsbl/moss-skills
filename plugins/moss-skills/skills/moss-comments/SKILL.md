---
name: moss-comments
description: Comment annotation and sidecar rules for Moss notes. Use when adding, replying to, resolving, preserving, or editing comments and comments.json.
---

# Moss Comments

Use comments for explicit questions, decisions, approvals, or review points that need attention on exact evidence. Fix ordinary wording, duplication, and scannability issues directly instead of leaving editorial comments, except when annotating your own edits to an existing large note.

A root comment has body markers plus a matching `comments.json` entry. Replies exist only in the sidecar and connect through `parentId`.

## Execution Context

Use these attribution values:

| Writer | `source` / `resolvedBy` |
| --- | --- |
| Human using Moss UI | `user` |
| Moss's in-app agent | `agent` |
| Agent or tool editing files outside Moss | `external` |

Do not write `user` for agent-authored content. Preserve missing attribution as legacy/unknown instead of backfilling it.

## Body Markers

Wrap the exact annotated range:

```markdown
The %%m:c1:start%%current layout%%m:c1:end%% needs review.
```

- IDs may contain letters, digits, `_`, and `-`.
- Generate an ID that does not already exist in the body or sidecar; no particular prefix is required.
- Start and end markers are both required and use the same comma-separated IDs.
- Multiple roots may share a range: `%%m:a,b:start%%text%%m:a,b:end%%`.
- Only root IDs appear in body markers.

Wrap an entire inline pill rather than placing markers inside it. Put block markers on standalone lines around the whole image, chart, HTML block, code fence, or other block node. Never place markers inside wiki links, formulas, color pills, fenced payloads, or raw HTML comments.

## Sidecar Schema

`comments.json` is a JSON object keyed by comment ID. Required fields use Unix timestamps in seconds.

| Field | Required | Contract |
| --- | --- | --- |
| `text` | Yes | Comment or reply text. |
| `createdAt` | Yes | Finite Unix timestamp in seconds; do not change after creation. |
| `updatedAt` | Yes | Finite Unix timestamp in seconds; update when the entry changes. |
| `source` | New entries | `user`, `agent`, or `external`. |
| `parentId` | Replies only | Existing root or reply ID; no cycles or dangling targets. |
| `imageUrls` | No | Note-relative paths under `assets/`. |
| `resolvedAt` | Resolved thread | Finite Unix timestamp in seconds. |
| `resolvedBy` | When known | `user`, `agent`, or `external`. |

Complete user-root and external-reply example:

```json
{
  "c1": {
    "text": "Should this ship in the first phase?",
    "createdAt": 1707900000,
    "updatedAt": 1707900000,
    "source": "user"
  },
  "c1-r1": {
    "text": "The first phase is now reflected in the plan.",
    "createdAt": 1707900100,
    "updatedAt": 1707900100,
    "source": "external",
    "parentId": "c1"
  }
}
```

The app may retain legacy singular `imageUrl`; preserve it, but author new attachments with `imageUrls`.

## Location And Permissions

- Workspace note: use `comments.json` beside the Markdown content file.
- External note: use only the sidecar path Moss provides; do not invent one.
- The in-app agent may edit only the active note's sidecar.
- An external writer may edit an accessible sidecar directly while preserving unrelated entries.

## Annotating Your Own Edits

When you edit an existing large note, leave a comment at each location you changed, so the user can review the edit by reading the comments instead of re-reading the note. Treat a note as large when its Markdown body, as it exists before your edit, is roughly 100 lines or more.

- This applies to edits of an existing note. A note you author from scratch does not get these annotations.
- Below that size, edit directly and describe the change in your response instead.
- Annotate only a note whose `comments.json` you are permitted to write. The in-app agent may annotate only the active note; for any other note, edit directly and describe the changes in your response.
- Frontmatter and title changes are not annotated; comment markers live only in the body. Describe those changes in your response.
- Use the ordinary comment format: body markers around the changed range plus a matching `comments.json` entry. There is no separate annotation syntax, marker type, or sidecar field.
- Never leave body markers without their matching sidecar entry. An unmatched marker is dropped when the note loads, so the annotation is lost and the stored Markdown keeps stray marker text.
- Anchor each comment to the range you actually changed, following the placement rules above.
- For a deletion, anchor the comment to the nearest retained text before the removed content — or to the last remaining block when you removed the end of the note — and state that content was removed, so the highlight is not read as a change to the anchor text.
- Keep each comment to one or two sentences: what you changed and why.
- Use one comment per changed location, up to about five for one edit. Edits that share a rationale get a single comment on the block enclosing them, whether or not they are adjacent.
- When an edit needs more comments than that, or restructures the note, stop annotating per location: comment once on each section you reshaped and summarize the rest in your response. Forty highlights are harder to review than the note.
- Set `source` to your execution context and leave this pass's annotations open so the user sees them.
- Before annotating a later edit to a note you already annotated, resolve your earlier annotations on it so they do not accumulate.
- Your edit annotations are records, not requests. When asked to address a note's open comments, resolve your own annotations rather than acting on them.

These annotations are the one case where an editorial change also gets a comment.

## Replies, Resolution, And Deletion

- A root has no `parentId`; a reply may point to the root or another reply.
- Every reply must be reachable from a marked root through a non-cyclic parent chain.
- Leave ambiguous questions or requests needing confirmation open; reply when useful.
- After completing a clear request, set the same `resolvedAt` and appropriate `resolvedBy` on the root and every descendant, and update every affected `updatedAt`.
- Keep body markers and sidecar entries when resolving.
- Resolving must not change the user's selected comment visibility filter; continue through remaining actionable threads.
- Deletion is a separate confirmed user action that removes root markers plus every sidecar entry in the thread.

## Mentions And Images

Attachment paths are note-relative, for example `assets/comment-abc.png`. Resolve them against the note directory.

Mentions in comment text use U+2063 before and U+2064 after the displayed reference: `\u2063@Project Plan\u2064` for a note or `\u2063@folder:Launch assets\u2064` for a folder. When Moss knows the target's ID it appends it after a U+2062 separator — `\u2063@Project Plan\u2062<note-id>\u2064` — and that ID, not the title, is what resolves the link. Preserve existing wrappers and ID segments verbatim, and drop the ID segment when rendering a mention as plain text. Create mentions through Moss UI; an external writer must not invent a reference from display text alone.

- Comment text renders as plain text plus @mention pills. Wiki links (`[[Note]]`, `[[#Heading]]`) and Markdown links do not render in comment text; they stay literal text.
- To reference a note or folder in a comment you author, write the mention encoding: U+2063, then `@Note Title` (or `@folder:Folder Path`), then optionally U+2062 plus the target ID, then U+2064. A note mention without an ID resolves by title.
- Headings and sections cannot be mentioned; point at them with a plain-text description such as the section name plus the opening words of the target.

## Final Check

- Every marked root has one valid sidecar entry and every root entry has markers.
- Reply chains reach a marked root and contain no cycles.
- Attribution matches the actual writer.
- Timestamps and attachment paths use the documented formats.
- Resolution preserves markers, metadata, and the current visibility filter.
