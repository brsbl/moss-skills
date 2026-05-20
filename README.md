# Skills for working with [mossnotes.app](https://www.mossnotes.app/)

<img width="1392" height="912" alt="Screenshot 2026-05-20 at 3 30 23 PM" src="https://github.com/user-attachments/assets/da7cf452-e37e-41d9-8bff-e4173723dd41" />

This repository provides skills for agentically working with [mossnotes.app](https://www.mossnotes.app/) notes, packaaged as Claude Code and Codex plugins.

The Moss app bundles these same skills for its in-app agent, and this repository makes them available as plugins to use with Claude Code and Codex directly. Use these plugins as is, or fork and customize them.

## What This Repo Is For

- Use this repository when you want Claude Code or Codex to read and write Moss markdown, folders, comments, wiki links, HTML mockups, and more.
- Use the installed app/exported skills at `~/Moss/.moss/skills/` when Claude Code or Codex is working against your Moss workspace and you want the skills to match your installed Moss app version.
- Fork this repository when you want to customize how Claude Code/Codex interacts with your Moss workspace.

### Important Note
If you customize these skills, do not change the Moss note syntax that's included in them. The Moss app expects specific syntax in markdown notes to work propertly and this currently can't be customized. You **can** customize how you want your agents to read/write this syntax (eg what workflow you want to use for resolving comments, styling of the HTML mockups embedded in your notes, etc.)

Forking this repository only affects the Claude Code and Codex plugins that are installed from it. It will not change the behavior of the in-app Moss agent.

## What Is Included

### Moss note skills

These skills are included in the Claude Code and Codex plugins.

- [`moss-notes`](skills/moss-notes/SKILL.md): how Moss note folders, markdown files, and supported note blocks work.
- [`moss-frontmatter`](skills/moss-frontmatter/SKILL.md): how Moss uses YAML frontmatter in note files.
- [`moss-comments`](skills/moss-comments/SKILL.md): how to write and preserve Moss comment annotations.
- [`moss-wiki-links`](skills/moss-wiki-links/SKILL.md): how to link to notes and headings with Moss wiki links.
- [`moss-mockup`](skills/moss-mockup/SKILL.md): how to author interactive `moss-html` mockups.

### Moss as an agentic workspace

This repository also includes reference workflow skills for using Moss as an agentic workspace for building with coding agents. With these skills, Moss becomes the durable command center for long-lived context, plans, decisions, research, reviews, and handoffs, while coding agents work in isolated development environments.

The bb workflow references live under [`skills/bb/`](skills/bb/) and are not part of the Claude Code or Codex plugin skill bundle. They are written for the agent orchestration platform and IDE [bb](https://github.com/ymichael/bb), but can be adapted to other coding-agent workflows.

- [`bb-workstream`](skills/bb/bb-workstream/SKILL.md): orchestrates a Moss development effort end-to-end, from setup and worker coordination through merge, summary, and cleanup.
- [`bb-research`](skills/bb/bb-research/SKILL.md): researches product ideas, APIs, best practices, competitors, and UI references so planning starts from evidence instead of guesses.
- [`bb-dashboard`](skills/bb/bb-dashboard/SKILL.md): creates the shared status surface where the user and managers can see workers, blockers, decisions, evidence, and merge readiness.
- [`bb-planning`](skills/bb/bb-planning/SKILL.md): turns prompts, notes, issues, PR feedback, and screenshots into clear worker scopes with acceptance criteria and validation steps.
- [`bb-implementation`](skills/bb/bb-implementation/SKILL.md): assigns approved scopes to isolated bb worker environments and keeps workers on-plan and unblocked.
- [`bb-verification`](skills/bb/bb-verification/SKILL.md): captures screenshots, app behavior, logs, and user-flow evidence before review, especially for UI or Electron work.
- [`bb-qa`](skills/bb/bb-qa/SKILL.md): runs the final quality gate with focused checks, moss verify, accepted risks, and pass/block decisions.
- [`bb-review`](skills/bb/bb-review/SKILL.md): reviews worker changes in the same environment, routes P0/P1 fixes, and decides what is safe to merge.
- [`bb-summary`](skills/bb/bb-summary/SKILL.md): produces the final PR, handoff, or workstream summary with what changed, evidence, risks, and decisions.
- [`bb-cleanup`](skills/bb/bb-cleanup/SKILL.md): archives threads and removes safe worktrees while preserving dashboards, reports, evidence, and decision history.

bb workflow artifacts should live under `~/Moss/Agent Workspaces/bb Workspace/workstreams/<slug>/`.

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

## License

MIT. See `LICENSE`.
