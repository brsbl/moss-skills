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
people:
  - jane
---

# Note Title
```

- Put structured metadata in frontmatter, not in the body.
- Use a top-level YAML mapping. Prefer simple values and string lists; nested objects are read-only in Moss.
- Use `type`, `people`, `description`, `tags`, and `status` only when they help retrieval. For workspace notes, let Moss manage `created_date`.
- The note title comes from the leading `# H1`, not a frontmatter `title:` key.
- Omit the block when no metadata is needed.
- Do not duplicate frontmatter values as prose headings or bold labels.

## Editing Frontmatter

Keep YAML valid. Moss preserves malformed frontmatter but cannot edit it. When editing files, edit metadata inside the frontmatter block; in the app, use the Properties tab.
