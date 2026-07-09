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
- Executable expressions support `+ - * / ( )`, decimals, `$`, thousands commas, `%`, and `k`/`m`/`b` suffixes — no functions or exponentiation.
- Symbolic variables use the variable name as the source and the text value as the display, for example `{{timeline|6 weeks}}`.
- Named executable variables store the expression in the source and the name in metadata, for example `{{5000|5,000|name=budget}}`. Existing IDs, display formats, and stale flags may appear as `id=...;name=...;format=...;stale=1`; preserve them when editing.
- For related values, put bound variable references inside later variable expressions so the relationship is live. For example, define `{{28|28|id=H1_ID;name=h1_size}}`, then derive `{{@(h1_size#NOTE_ID#H1_ID)-6|22|id=H2_ID;name=h2_size}}` and `{{@(h2_size#NOTE_ID#H2_ID)-4|18|id=H3_ID;name=h3_size}}`; changing `h1_size` should show how the dependent values move.
- Formula references may serialize as bound tokens like `@(budget#NOTE_ID#FORMULA_ID)` inside the source. Preserve existing bound references; do not invent them unless the target formula ID is known.
- Note and formula IDs are 36-character UUIDs. `NOTE_ID`, `H1_ID`, and similar tokens in these examples are placeholders for real UUIDs — a bound reference whose IDs are not 36-character UUIDs is invalid and the pill will not render.
- Keep pills inline; do not use them for multi-line calculations or chart data.
- Pipes inside pills are part of the syntax and do not split table cells.

## Common Patterns

### One-off formula

```markdown
{{2+2|4}}
```

Use for a computed value that does not need a reusable name.

### Editable anchor plus derived values

```markdown
{{28|28|id=H1_ID;name=h1_size}}
{{@(h1_size#NOTE_ID#H1_ID)-6|22|id=H2_ID;name=h2_size}}
{{@(h2_size#NOTE_ID#H2_ID)-4|18|id=H3_ID;name=h3_size}}
```

Use when changing the anchor should show how related values move as a system.

### Weight scale

```markdown
{{400|400|id=NORMAL_ID;name=normal_weight}}
{{@(normal_weight#NOTE_ID#NORMAL_ID)+100|500|id=MEDIUM_ID;name=medium_weight}}
```

## Tables

Formula and variable pills can appear inside table cells. Keep the row on one markdown line and do not escape the pipes inside the pill; they are part of the formula syntax, not table separators.

## Preservation Rules

- Preserve existing `id=...`, `name=...`, `format=...`, and `stale=...` metadata unless the user asks to rebuild the formula.
- Preserve existing bound references like `@(name#NOTE_ID#FORMULA_ID)` when editing nearby prose.
- Do not invent bound references unless the target formula ID is known.
- Prefer variables for named or reusable anchors; prefer unnamed formulas for one-off computed values.
