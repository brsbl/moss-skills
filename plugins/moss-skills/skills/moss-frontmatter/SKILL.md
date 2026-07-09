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
- Any valid YAML key is allowed. The top level must be a YAML mapping (`key: value` pairs); a bare list or scalar is not treated as frontmatter.
- Use strings, numbers, booleans, ISO dates, or arrays. Nested objects round-trip but display read-only; prefer flat scalars and string lists.
- Moss recognizes `type`, `people`, `description`, `tags`, `status`, and `created_date`. `created_date` is system-managed — Moss adds it automatically and it is read-only in the app; do not add or edit it. `status` and `type` values are lowercased; `tags` are lowercased and clickable for search. Other keys are free-form custom fields.
- The note title comes from the leading `# H1`, not a frontmatter `title:` key.
- Use meaningful fields because Moss users can search/filter notes by frontmatter; keep values useful for retrieval and avoid excessive fields.
- Omit the block when no metadata is needed.
- Do not duplicate frontmatter values as prose headings or bold labels.

## How Moss Renders Frontmatter

- Frontmatter is persisted as YAML at the top of the markdown content file.
- On load, Moss splits the YAML block from the body before handing content to the editor.
- Moss renders and edits the frontmatter fields in the right-hand actions panel's Properties tab; the Lexical editor body never receives the raw YAML.
- Malformed YAML is preserved on disk but shows no editable properties.
- Edit metadata inside the frontmatter block. Do not restate the same values as prose, headings, or bold labels in the body.
