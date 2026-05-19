---
name: moss-wiki-links
description: |
  Minimal wiki link syntax for linking Moss notes and headings.
type: documentation
people: []
tags:
  - wiki-links
  - markdown
status: active
created_date: '2026-03-26'
tools:
  - Moss
---

# Wiki Links

Use wiki links only for notes that exist.

```markdown
[[Project Plan]]
[[#Local Heading]]
[[Project Plan#Scope]]
[[Project Plan|display text]]
```

- Use the exact note title.
- Verify the target note exists before adding a cross-note link.
- Do not escape brackets inside `[[...]]`.
- Brackets in titles are allowed; write the exact title.
- A `#Heading` suffix links to a heading.
- A pipe with non-ID text sets display text.
