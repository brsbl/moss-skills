# Skills for working with [mossnotes.app](https://www.mossnotes.app/)

<img width="1392" height="912" alt="Screenshot 2026-05-20 at 3 30 23 PM" src="https://github.com/user-attachments/assets/da7cf452-e37e-41d9-8bff-e4173723dd41" />

This repository provides standalone skills for creating and editing [Moss](https://www.mossnotes.app/) notes with coding agents. The skills teach Moss writing guidelines, note structure, Markdown syntax, formulas and variables, comments, links, frontmatter, canvas, and embedded HTML.

## What this repo is for

- Install Moss note-authoring skills into agents such as Codex, Claude Code, and other tools that support skills.
- Help agents write valid Moss notes under `~/Moss/Notes/**` without breaking note directories, sidecars, comments, links, or embedded `moss-html` / `moss-canvas` blocks.
- Fork or customize the agent instructions while preserving Moss note syntax that the app expects.

### Important note ⚠️

If you customize these skills, do not change the Moss note syntax itself. The Moss app expects specific Markdown and sidecar shapes. You **can** customize how agents apply the syntax, such as whether they leave comments instead of editing directly or how they style embedded HTML.

Forking this repository only affects agents that install skills from it. It does not change the default behavior of the in-app Moss agent.

## Included skills

- [`moss-writing-guidelines`](skills/moss-writing-guidelines/SKILL.md): Read first when creating, editing, restructuring, or reviewing a note for quality. It covers reader-first structure, progressive disclosure, a node decision matrix, note archetypes, and a final review checklist.
- [`moss-notes`](skills/moss-notes/SKILL.md): Start here for syntax when an agent needs to create or edit a Moss note. It explains note folders, the Markdown file, assets, sidecars, headings, tables, callouts, charts, and when to use the focused Moss skills below.
- [`moss-formulas-variables`](skills/moss-formulas-variables/SKILL.md): Use when a note needs formulas or variables, including editable anchors, derived values, bound references, display values, IDs, and table-cell usage.
- [`moss-frontmatter`](skills/moss-frontmatter/SKILL.md): Use when a note needs structured metadata at the top, such as tags, status, dates, or other searchable fields.
- [`moss-comments`](skills/moss-comments/SKILL.md): Use when adding or preserving inline review comments. It covers the body markers and matching `comments.json` metadata Moss needs.
- [`moss-links`](skills/moss-links/SKILL.md): Use when a note needs wiki note links, heading links, aliases, Markdown links, YouTube links, or media-link preservation.
- [`moss-canvas`](skills/moss-canvas/SKILL.md): Use when a note needs rough diagrams, wireframes, flows, or spatial visual thinking in a canonical `moss-canvas` block.
- [`moss-html`](skills/moss-html/SKILL.md): Use when a note needs embedded HTML, such as a UI prototype, behavior demo, or focused interactive preview.

## Install with npx

```bash
npx skills add brsbl/moss-skills
```

## Claude Code Plugin

```bash
/plugin marketplace add brsbl/moss-skills
/plugin install moss-skills@moss-skills
```

## Codex Plugin

```bash
codex plugin marketplace add brsbl/moss-skills
```

## License

MIT. See `LICENSE`.
