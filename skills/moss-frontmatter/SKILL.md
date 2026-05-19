---
name: moss-frontmatter
description: |
  Minimal YAML frontmatter rules for Moss note metadata.
type: documentation
people: []
tags:
  - yaml
  - frontmatter
  - metadata
status: active
created_date: '2026-03-26'
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
