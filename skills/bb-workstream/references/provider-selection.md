# Provider Selection Reference

Provider choice is a default, not a requirement. Before assigning providers, check currently available models and use the highest/latest available model for the selected provider unless task fit, tooling, context window, environment access, availability, cost, latency, or user preference calls for an override:

```bash
bb provider models <provider>
```

Default routing:

- Managers and manager-of-manager threads: Claude with Opus 4.7 (1M) and extra-high thinking. CLI flags: `--provider claude-code --model 'claude-opus-4-7[1m]' --reasoning-level xhigh`.
- UI/UX-related implementation, interaction design, styling, screenshot, Electron/browser, or user-flow work: Claude with Opus 4.7 (1M) and extra-high thinking. CLI flags: `--provider claude-code --model 'claude-opus-4-7[1m]' --reasoning-level xhigh`.
- Review workers: Codex with `gpt-5.5` and extra-high reasoning. CLI flags: `--provider codex --model gpt-5.5 --reasoning-level xhigh`.
- Planning, QA, and summary workers: Claude with Opus 4.7 (1M) and extra-high thinking. CLI flags: `--provider claude-code --model 'claude-opus-4-7[1m]' --reasoning-level xhigh`.
- Non-UI/UX implementation, cleanup, codebase analysis, and mechanical docs/code work: Codex with `gpt-5.5` and extra-high reasoning. CLI flags: `--provider codex --model gpt-5.5 --reasoning-level xhigh`.

The bb CLI value for extra-high reasoning or thinking is `xhigh`. Quote the Claude 1M model ID in shell commands because `[1m]` can be interpreted as a glob.

When a scope mixes UI/UX and non-UI work, split it into separate workers when practical. If it cannot be split, choose the provider by the primary risk and record the reason.

Record provider and model in `workers.md` and `dashboard.md` when known. Provider metadata must not replace the worker objective, owned scope, validation commands, expected output, blocker state, or evidence links.

When overriding the default, record the reason in the dashboard: task fit, tooling, context, environment access, availability, cost, latency, or user preference.
