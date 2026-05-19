---
name: moss-frontmatter
description: YAML frontmatter rules for Moss note metadata. Use when adding or editing the optional metadata block at the top of a note.
---

# Frontmatter

Frontmatter is an optional YAML block at the top of the note:

```markdown
---
status: active
tags:
  - project
date: 2026-01-15
---

# Note Title
```

- Put structured metadata in frontmatter, not in the body.
- Any valid YAML key is allowed.
- Use strings, numbers, booleans, ISO dates, or arrays.
- Omit the block when no metadata is needed.
- Do not duplicate frontmatter values as prose headings or bold labels.

## How Moss Renders Frontmatter

- Frontmatter is persisted as YAML at the top of the markdown content file.
- On load, Moss splits the YAML block from the body before handing content to the editor.
- A styled React header above the editor renders and edits the frontmatter fields; the Lexical editor body never receives the raw YAML.
- Edit metadata inside the frontmatter block. Do not restate the same values as prose, headings, or bold labels in the body.
