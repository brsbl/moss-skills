# Skills for Claude Code and Codex with mossnotes.app

This repository provides Claude Code and Codex plugin packaging for working with mossnotes.app notes.

The Moss app bundles the same guidance for its in-app agent. This repository makes that guidance available as a portable plugin package for Claude Code and Codex, and as a reference for people who want to inspect, demo, fork, or customize it.

## What This Repo Is For

- Use this repository when you want Claude Code or Codex to understand Moss note folders, markdown, comments, wiki links, and mockups.
- Use the installed app/exported skills at `~/Moss/.moss/skills/` when Claude Code or Codex is working against your actual Moss workspace and should match your installed Moss app version.
- Fork or customize this repository when you want to change the Claude Code/Codex plugin package.

Changing this repository affects the Claude Code and Codex plugin package that installs from it. It does not change the in-app Moss agent.

## What Is Included

- `moss-notes`: how Moss note folders, markdown files, and supported note blocks work.
- `moss-frontmatter`: how Moss uses YAML frontmatter in note files.
- `moss-comments`: how to write and preserve Moss comment annotations.
- `moss-wiki-links`: how to link to notes and headings with Moss wiki links.
- `moss-mockup`: how to author interactive `moss-html` mockups.

## Claude Code

Add this repository as a Claude Code plugin marketplace, then install the plugin:

```bash
/plugin marketplace add brsbl/moss-skills
/plugin install moss-skills@moss-skills
```

Installed skills are namespaced by the plugin name. For example:

```bash
/moss-skills:moss-notes
/moss-skills:moss-mockup
```

## Codex

Use the repository as a Codex plugin marketplace or local plugin source, then enable the `moss-skills` plugin. Codex will load the same `./skills/` tree used by Claude Code.

The Codex manifest lives at `.codex-plugin/plugin.json`, and `.agents/plugins/marketplace.json` points at the repository root plugin with `source.path` set to `./`.

## Customizing

The Moss app bundles its own copy of this guidance for the in-app Moss agent. This repository packages that guidance for Claude Code and Codex.

You can fork this repository and edit the `skills/` directory, Claude Code plugin metadata, or Codex plugin metadata to customize the plugin package you install into those tools.

Changing this repository changes only the Claude Code/Codex plugin package installed from your fork. It does not change the in-app Moss agent or the skills bundled with the Moss app.

## License

MIT. See `LICENSE`.
