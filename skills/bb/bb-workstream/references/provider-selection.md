# Provider Selection Reference

Read [../../WORKFLOWS.md](../../WORKFLOWS.md) first. Provider choice is task-fit guidance, not user preference policy.

## Model Check

```bash
bb provider list
bb provider models codex
bb provider models claude-code
```

## Default Starting Point

- Prefer Codex for bb manager-led work unless task fit, tooling, context, access, latency, cost, or the user says otherwise.
- Use Claude/other providers when the specific thread benefits from their tools, context window, UI reasoning, or user preference.
- Use the latest/highest suitable available model.

Common flag snippets:

```bash
--provider codex --model gpt-5.5 --reasoning-level xhigh
--provider claude-code --model 'claude-opus-4-7[1m]' --reasoning-level xhigh
```

Quote model IDs containing `[1m]` in shell commands.

## Record In Dashboard

```text
Provider/model:
Default or override reason:
Access/tooling reason:
Risk if provider changes:
```

Provider metadata never replaces objective, owned files, validation, blocker state, or evidence links.
