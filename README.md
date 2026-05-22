# Skills for working with [mossnotes.app](https://www.mossnotes.app/)

<img width="1392" height="912" alt="Screenshot 2026-05-20 at 3 30 23 PM" src="https://github.com/user-attachments/assets/da7cf452-e37e-41d9-8bff-e4173723dd41" />

This repository provides skills for agentically working with [mossnotes.app](https://www.mossnotes.app/) notes, packaged as Claude Code and Codex app plugins.

The Moss app bundles these same note skills for its in-app agent, and this repository makes them available as plugins to use with Claude Code and Codex directly. It also keeps bb-only workflow policy checked in for teams using Moss as a durable workspace for parallel agent work.

Plugin names differ by host: the Claude Code plugin remains the legacy aggregate `moss-skills` plugin, while the Codex app marketplace exposes the note-only `moss-notes` plugin package.

## What This Repo Is For

- Use the Claude Code or Codex app plugin when you want those tools to read and write Moss markdown, folders, comments, wiki links, HTML mockups, and more.
- Use the bb workflow docs when you want bb managers and workers to run long-lived workstreams through Moss dashboards, plans, verification notes, QA reports, reviews, and summaries.
- Use the installed app/exported skills at `~/Moss/.moss/skills/` when Claude Code or Codex is working against your Moss workspace and you want the skills to match your installed Moss app version.
- Fork this repository when you want to customize how Claude Code/Codex interacts with your Moss workspace.

### Important Note ⚠️
If you customize these skills, do not change the Moss note syntax that's included in them. The Moss app expects specific syntax in markdown notes to work properly and this currently can't be customized. You **can** customize how you want your agents to read/write this syntax (e.g. leaving suggested changes as comments instead of editing directly, changing how the HTML mockups embedded in your notes are styled, etc.)

Forking this repository only affects the Claude Code and Codex plugins that are installed from it. It will not change the behavior of the in-app Moss agent.

## What Is Included

### Moss note skills

These are the skills the Codex app plugin is intended to expose by default. They are also the Moss note authoring skills used by Claude Code and by bb workflows when a worker needs to create or edit Moss notes.

- [`moss-notes`](skills/moss-notes/SKILL.md): how Moss note folders, markdown files, and supported note blocks work.
- [`moss-frontmatter`](skills/moss-frontmatter/SKILL.md): how Moss uses YAML frontmatter in note files.
- [`moss-comments`](skills/moss-comments/SKILL.md): how to write and preserve Moss comment annotations.
- [`moss-wiki-links`](skills/moss-wiki-links/SKILL.md): how to link to notes and headings with Moss wiki links.
- [`moss-mockup`](skills/moss-mockup/SKILL.md): how to author interactive `moss-html` mockups.

### bb workflows for Moss as an agentic workspace

This repository also includes checked-in bb workflow policy for using Moss as a complementary agentic workspace when building with coding agents. With these workflows, Moss becomes a durable command center for long-lived context, plans, decisions, research, reviews, and handoffs, while coding agents work in ephemeral development environments.

The canonical bb routing entrypoint is [`skills/bb/WORKFLOWS.md`](skills/bb/WORKFLOWS.md). Point bb manager templates or preferences at that file, then have managers read the linked stage skill before running each stage.

These stage skills are written for the agent orchestration platform and IDE [bb](https://github.com/ymichael/bb). They are bb-only workflow guidance and are not the Codex app plugin surface.

- [`bb-workstream`](skills/bb/bb-workstream/SKILL.md): orchestrates a development effort end-to-end, from setup and worker coordination through merge, summary, and cleanup.
- [`bb-research`](skills/bb/bb-research/SKILL.md): researches product ideas, APIs, best practices, competitors, and UI references so planning starts from evidence.
- [`bb-analytics`](skills/bb/bb-analytics/SKILL.md): creates runbooks for reviewing analytic dashboards and analytics reports from dashboard reviews.
- [`bb-planning`](skills/bb/bb-planning/SKILL.md): turns prompts, notes, issues, PR feedback, and screenshots into clear worker scopes with acceptance criteria and validation steps.
- [`bb-implementation`](skills/bb/bb-implementation/SKILL.md): assigns approved scopes to isolated worker environments and keeps workers on-plan and unblocked.
- [`bb-dashboard`](skills/bb/bb-dashboard/SKILL.md): creates a dashboard for reviewing status, blockers, decisions, QA evidence, and merge readiness as work progresses.
- [`bb-verification`](skills/bb/bb-verification/SKILL.md): captures screenshots, app behavior, logs, and user-flow evidence before review, especially for UI or Electron work.
- [`bb-review`](skills/bb/bb-review/SKILL.md): reviews worker changes in the same environment they were done, delegates P0/P1 fixes to additional workers, and decides what is safe to merge.
- [`bb-qa`](skills/bb/bb-qa/SKILL.md): runs the final quality gate with focused checks, tests, and pass/block decisions.
- [`bb-summary`](skills/bb/bb-summary/SKILL.md): produces the final PR, handoff, or workstream summary with what changed, evidence, risks, and decisions.
- [`bb-cleanup`](skills/bb/bb-cleanup/SKILL.md): archives threads and removes safe worktrees while preserving dashboards, reports, evidence, and decision history.

## Claude Code

The Claude Code plugin is still named `moss-skills`. It is the legacy aggregate plugin for this repository and keeps the existing install and invocation names.

Add this repository as a Claude Code plugin marketplace, then install the Claude Code plugin:

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

The Codex app plugin is named `moss-notes`. It should expose the Moss note skills listed above, not the bb workflow skills under `skills/bb/**`.

For a marketplace install, add this repository as a Codex plugin marketplace, then install and enable the `moss-notes` plugin from that marketplace. The marketplace entry points at `./plugins/moss-notes`, which is the Codex plugin package root.

For local development, check out this repository and point the Codex app's local plugin or marketplace development flow at `./plugins/moss-notes`. Use the repository root only as the source checkout; do not point Codex at `./skills` when you want the intended app plugin package.

The bb workflow files remain checked in separately at [`skills/bb/WORKFLOWS.md`](skills/bb/WORKFLOWS.md) and `skills/bb/*/SKILL.md` for bb manager-led workstreams.

## License

MIT. See `LICENSE`.
