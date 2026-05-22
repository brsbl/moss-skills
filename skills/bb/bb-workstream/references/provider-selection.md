# Provider Selection Reference

Provider choice is a default, not a requirement. Before assigning providers, check currently available models and use the highest/latest available model for the selected provider unless task fit, tooling, context window, environment access, availability, cost, latency, or user preference calls for an override:

```bash
bb provider models <provider>
```

Default routing:

- Prefer Codex with `gpt-5.5` and extra-high reasoning for managers, manager-of-manager threads, planning, QA, summaries, UI/UX-related work, review workers, implementation, cleanup, codebase analysis, investigations, regressions, bug fixes, and mechanical docs/code work. CLI flags: `--provider codex --model gpt-5.5 --reasoning-level xhigh`.
- Use Claude or another provider when available models, tool access, context fit, interaction style, or the user's request makes that provider better for the specific thread. Claude example flags: `--provider claude-code --model 'claude-opus-4-7[1m]' --reasoning-level xhigh`.

The bb CLI value for extra-high reasoning or thinking is `xhigh`. Quote the Claude 1M model ID in shell commands because `[1m]` can be interpreted as a glob.

When a scope mixes distinct risks, split it into separate workers when practical. If it cannot be split, choose the provider by the primary risk and record the reason.

Record provider and model in `workers.md` and `dashboard.md` when known. Provider metadata must not replace the worker objective, owned scope, validation commands, expected output, blocker state, or evidence links.

When overriding the default, record the reason in the dashboard: task fit, tooling, context, environment access, availability, cost, latency, or user preference.
