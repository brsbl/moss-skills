# Moss Skills

Moss Skills packages the Moss note-writing skills for Claude Code and Codex.

The Moss app ships its in-app runtime skills from `packages/desktop/assets/skills/`. Those bundled app skills remain the runtime contract for the in-app Moss agent: Moss does not require this repository to run, and Moss does not dynamically load this repository.

External agents have two useful paths:

1. Installed Moss app/exported skills at `~/Moss/.moss/skills/`: useful for external agents working against a user's actual Moss workspace because they match the installed Moss app version.
2. This `moss-skills` repository: portable Claude Code/Codex plugin packaging, a demo/reference implementation, and a forkable customization starter.

This repository is for demonstration and allowing people to customize Moss skills to their liking. Customizing or forking it changes the external agents that install that customized plugin, not the in-app Moss agent.

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
./scripts/sync-plugin-skills.sh <moss-skills-checkout>
```

After syncing, verify each generated `skills/*/SKILL.md` file still matches its corresponding Moss asset before publishing a release.

## License

MIT. See `LICENSE`.
