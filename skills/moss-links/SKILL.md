---
name: moss-links
description: Create or edit Moss links, including wiki note links, heading links, aliases, Markdown links, YouTube embeds, and media/link preservation rules.
---

# Moss Links

Use this skill when adding, editing, or reviewing links in Moss notes: note links, heading links, display aliases, Markdown links, YouTube links, and media references.

## Wiki Note Links

Wiki links connect notes and headings inside the Moss workspace.

```markdown
[[Project Plan]]
[[#Local Heading]]
[[Project Plan#Scope]]
[[Project Plan|display text]]
```

Rules:

- Use the exact note title for cross-note links.
- Verify the target note exists before adding a cross-note link.
- Use `[[#Heading]]` for a heading in the current note.
- Use `[[Note#Heading]]` for a heading in another note.
- Use `[[Note|display text]]` when the visible label should differ from the note title.
- Do not escape brackets inside `[[...]]`; brackets in note titles are allowed, so write the exact title.

## Markdown Links

Use standard Markdown links for web URLs, external references, and non-Moss destinations.

```markdown
[Website](https://www.mossnotes.app/)
[Repository](https://github.com/brsbl/moss-skills)
```

- Preserve existing URLs exactly unless the user asks to change them.
- Prefer descriptive link text over raw URLs in prose.
- Use wiki links for Moss note-to-note navigation; use Markdown links for external destinations.

## YouTube Links and Video

Moss treats YouTube URLs as video-capable references when written as image/video markdown.

```markdown
![Demo walkthrough](https://youtu.be/dQw4w9WgXcQ)
```

- Use image/video markdown when the user wants an embedded playable video preview.
- A bare standalone YouTube URL on its own line also becomes an embedded video.
- Use a named Markdown link like `[demo](https://youtu.be/...)` when the user only wants a text link to YouTube.
- Remote non-YouTube video files are not video nodes; use local video assets for `.mp4`, `.webm`, or `.mov`.

## URL Previews and In-App Browser

URLs in Moss can become previews that open in the in-app browser. Write a URL plainly for an inline browser preview, use `![Title](url)` when the URL should appear as a visual embed, and use `[Title](url)` for a normal text link.

```markdown
https://example.com/research
Research link: https://example.com/research
![Research board](https://example.com/research)
http://localhost:3000/prototype
[https://example.com/research](https://example.com/research)
[Research](https://example.com/research)
```

- Use a bare `http://` or `https://` URL anywhere in prose or table cells for an inline browser preview pill.
- Use `![Title](url)` for a visual embed. Images, local videos, YouTube URLs, and tweet status URLs keep their stronger media previews; browser-safe webpages render as webpage cards.
- Self-referential Markdown links such as `[https://example.com](https://example.com)` also become browser pills. Named links such as `[Example](https://example.com)` stay normal Markdown links.
- Public pages must use HTTPS. Loopback development URLs such as `localhost`, `*.localhost`, `127.0.0.1`, and `::1` may use HTTP or HTTPS because they open in the browser surface.
- Private network, link-local, `.local`, credentialed, and obvious downloadable-file URLs stay plain text or open externally instead of becoming browser previews.
- Standalone image URLs, YouTube URLs, and tweet status URLs route to their own image, video, or tweet nodes instead of browser pills; use a named Markdown link when you only want a text link.
- Browser pills save as regular URLs. Visual webpage embeds save as `![Title](url)`.

## Local Assets and Media Links

Use note-local assets for files stored with the note.

```markdown
![Screenshot](assets/screenshot.png)
![Demo recording](assets/demo.mp4)
```

- Prefer `assets/...` paths for note-local media.
- Do not use `file://` or absolute local paths in notes.
- Preserve existing asset paths unless relocating the asset is part of the task.

## Review Checklist

- Link type matches destination: wiki for Moss notes, Markdown for external URLs, image/video markdown for media.
- Cross-note wiki targets use exact note titles.
- YouTube embeds use image/video markdown only when an embedded video is intended.
- No accidental changes to existing URLs, aliases, heading fragments, or asset paths.
