---
name: moss-wiki-links
description: Add or edit Moss wiki links like [[Note]], [[#Heading]], aliases, and note-heading references between existing Moss notes.
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
