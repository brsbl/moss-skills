---
name: moss-formulas-variables
description: Create or edit Moss formulas and variables, including editable anchors, derived values, bound references, display values, IDs, metadata, and table-cell usage.
---

# Moss Formulas and Variables

Use this skill when creating or editing Moss formula/variable pills, especially when values should be named, reused, or derived from editable anchors.

## Formulas And Variables

Use formulas and variables for compact computed or labeled values displayed inline with surrounding text or table cells. The core use case is defining a small set of editable anchors, then deriving related values from those named anchors so the system updates together instead of becoming a set of disconnected numbers.

- `Formula` is an unnamed executable expression like `=2+2`.
- `Variable` is a named value — executable like `sum=2+2`, or symbolic like `timeline=6 weeks`. Any named variable can be referenced from other formulas through the cross-note lookup/typeahead, whether its value is executable or symbolic.
- Use variables when a value has a name or should become an editable anchor for related formulas; use formulas when a one-off computed result is enough.

Stored markdown syntax for both kinds of pills:

```markdown
{{source|display}}
```

- Writing `{{source|display}}` into a note creates a live pill. When showing the syntax as a code example in prose, wrap it in backticks.
- Put the source (expression or symbolic label) before the first `|`, the rendered display value between the first and second `|`, and any metadata after the second `|`.
- Variable names must start with a letter and contain only letters, digits, `_`, or `-`.
- Executable expressions support `+ - * / ( )`, decimals, `$`, thousands commas, `%`, and `k`/`m`/`b` suffixes; they do not support functions or exponentiation.
- Symbolic variables use the variable name as the source and the text value as the display, for example `{{timeline|6 weeks}}`.
- Named executable variables store the expression in the source and the name in metadata, for example `{{5000|5,000|name=budget}}`. Existing IDs, display formats, and stale flags may appear as `id=...;name=...;format=...;stale=1`; preserve them when editing.
- For related values written through the UI, Moss generates formula IDs. For direct Markdown edits, read the real containing note ID from Moss-provided context or existing metadata and generate a fresh UUID for every new formula or variable before writing. Do not create or edit app-owned metadata. If the real note ID is unavailable, do not construct a bound reference.
- Put bound variable references with those real IDs inside later variable expressions so the relationship is live; changing the anchor should show how the dependent values move.
- Bound references use `@(name#note-id#formula-id)`. Preserve them exactly. Create one only with a target formula name and IDs read from that formula; never use example placeholders.
- Keep pills inline; do not use them for multi-line calculations or chart data.
- Pipes inside pills are part of the syntax and do not split table cells.

## Common Patterns

### One-off formula

```markdown
{{2+2|4}}
```

Use for a computed value that does not need a reusable name.

### Editable anchor plus derived values

For a direct Markdown edit, assume the real containing note ID is `9e64c3df-c1e2-4a4d-8c07-91528f422413` and the writer generated three fresh formula IDs for this operation. The complete relationship is:

```markdown
{{28|28|id=b371c6db-70db-48f1-99e2-9ea1ef6f1151;name=h1_size}}
{{@(h1_size#9e64c3df-c1e2-4a4d-8c07-91528f422413#b371c6db-70db-48f1-99e2-9ea1ef6f1151)-6|22|id=c520e764-a784-48c5-81ca-f93ac6f4ad37;name=h2_size}}
{{@(h2_size#9e64c3df-c1e2-4a4d-8c07-91528f422413#c520e764-a784-48c5-81ca-f93ac6f4ad37)-4|18|id=d6189e20-8bca-4a44-a372-6c2473ec93b8;name=h3_size}}
```

The UUIDs above belong only to this worked example. For a real edit, use that note's real ID and newly generated formula IDs; never paste example IDs into another note.

### Weight scale

Use the same workflow: assign `normal_weight` a fresh formula UUID, then create `medium_weight` with another fresh UUID and a bound reference containing the real note ID plus the exact `normal_weight` formula ID.

## Tables

Formula and variable pills can appear inside table cells. Keep the row on one markdown line and do not escape the pipes inside the pill; they are part of the formula syntax, not table separators.

## Preservation Rules

- Preserve existing `id=...`, `name=...`, `format=...`, and `stale=...` metadata unless the user asks to rebuild the formula.
- Prefer variables for named or reusable anchors; prefer unnamed formulas for one-off computed values.
