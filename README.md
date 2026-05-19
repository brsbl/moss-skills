# Moss Skills

Moss Skills packages the Moss note-writing skills for Claude Code and Codex.

All of these skills ship with the Moss app from `packages/desktop/assets/skills/`. This public repository contains identical copies in plugin-friendly `skills/<skill-name>/SKILL.md` folders so agents can install and use them outside the Moss app bundle.

## Included Skills

- `moss-notes`: Moss note directory, markdown, and node syntax rules.
- `moss-frontmatter`: YAML frontmatter rules for Moss note metadata.
- `moss-comments`: Comment annotation syntax for Moss notes.
- `moss-wiki-links`: Wiki link syntax for notes and headings.
- `moss-mockup`: Interactive `moss-html` mockup authoring rules.

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

This repository is also a Codex plugin. The Codex manifest lives at `.codex-plugin/plugin.json`, and `.agents/plugins/marketplace.json` points at the repository root plugin with `source.path` set to `./`.

Use the repository as a Codex plugin marketplace or local plugin source, then enable the `moss-skills` plugin. Codex will load the same `./skills/` tree used by Claude Code.

## Syncing From Moss

The Moss app keeps its bundled runtime copies under `packages/desktop/assets/skills/`. To refresh this repository from a Moss app source checkout, run the existing Moss sync script:

```bash
./scripts/sync-plugin-skills.sh /path/to/moss-skills
```

After syncing, verify each generated `skills/*/SKILL.md` file still matches its corresponding Moss asset before publishing a release.

## License

MIT. See `LICENSE`.
