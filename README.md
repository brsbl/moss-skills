# Skills for working with [mossnotes.app](https://www.mossnotes.app/)

<img width="1392" height="912" alt="Screenshot 2026-05-20 at 3 30 23 PM" src="https://github.com/user-attachments/assets/da7cf452-e37e-41d9-8bff-e4173723dd41" />

This repository provides standalone skills for creating and editing [Moss](https://www.mossnotes.app/) notes with coding agents. The skills teach Moss note structure, Markdown syntax, formulas and variables, comments, wiki links, frontmatter, and embedded HTML.

## What this repo is for

- Install Moss note-authoring skills into agents such as Codex, Claude Code, and other tools that support skills.
- Help agents write valid Moss notes under `~/Moss/Notes/**` without breaking note directories, sidecars, comments, wiki links, or embedded `moss-html` / `moss-canvas` blocks.
- Fork or customize the agent instructions while preserving Moss note syntax that the app expects.

### Important note ⚠️

If you customize these skills, do not change the Moss note syntax itself. The Moss app expects specific Markdown and sidecar shapes. You **can** customize how agents apply the syntax, such as whether they leave comments instead of editing directly or how they style embedded HTML.

Forking this repository only affects agents that install skills from it. It does not change the in-app Moss agent unless you separately update the app-bundled skills.

## Included skills

- [`moss-notes`](skills/moss-notes/SKILL.md): Start here when an agent needs to create or edit a Moss note. It explains note folders, the Markdown file, assets, sidecars, headings, tables, callouts, charts, `moss-canvas`, and `moss-html` blocks.
- [`moss-formulas-variables`](skills/moss-formulas-variables/SKILL.md): Use when a note needs formulas or variables, including editable anchors, derived values, bound references, display values, IDs, and table-cell usage.
- [`moss-frontmatter`](skills/moss-frontmatter/SKILL.md): Use when a note needs structured metadata at the top, such as tags, status, dates, or other searchable fields.
- [`moss-comments`](skills/moss-comments/SKILL.md): Use when adding or preserving inline review comments. It covers the body markers and matching `comments.json` metadata Moss needs.
- [`moss-wiki-links`](skills/moss-wiki-links/SKILL.md): Use when linking Moss notes and headings with `[[Note]]`, `[[#Heading]]`, aliases, or note-heading links.
- [`moss-html`](skills/moss-html/SKILL.md): Use when a note needs embedded HTML, such as a UI prototype, behavior demo, or focused interactive preview.

## Install with npx

List installable skills:

```bash
npx --yes skills add brsbl/moss-skills --list
```

Install the skills:

```bash
npx skills add brsbl/moss-skills
```

If your environment needs an explicit HTTPS URL:

```bash
npx skills add https://github.com/brsbl/moss-skills
```

## Claude Code Plugin

The Claude Code plugin is named `moss-skills`.

```bash
/plugin marketplace add brsbl/moss-skills
/plugin install moss-skills@moss-skills
```

Installed skills are namespaced by plugin name. For example:

```bash
/moss-skills:moss-notes
/moss-skills:moss-html
```

## Codex Plugin

The Codex app plugin is also named `moss-skills`. It exposes the Moss note skills listed above.

For marketplace install, add this repository as a Codex plugin marketplace, then install and enable `moss-skills`. The marketplace entry points at `./plugins/moss-skills`, the Codex plugin package root.

For local development, check out this repository and point the Codex app's local plugin or marketplace development flow at `./plugins/moss-skills`. Use the repository root only as the source checkout; do not point Codex at `./skills` when you want the intended app plugin package.

## License

MIT. See `LICENSE`.
