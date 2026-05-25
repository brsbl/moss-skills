---
name: bb-verification
description: "Use for Moss UI, screenshot, browser, Electron, or user-flow verification before review; writes verification evidence under ~/Moss/Notes/** when durable."
---

# Moss BB Verification

## When To Use

Use this when changed behavior must be seen or exercised, not just tested.

## Read First
- ../WORKFLOWS.md
- references/verification-reference.md
- ../bb-workstream/references/architecture-setup.md
- ../../moss-notes/SKILL.md for verification reports under ~/Moss/Notes/**

## Steps
1. Confirm running target, app state, seed data, account access, and references.
2. Classify missing runtime/tooling as blockers, not product bugs.
3. Exercise changed flows and nearby regressions.
4. Capture screenshots/logs/console/DOM evidence needed for review.
5. Link verdict and evidence from the dashboard.

## Outputs
- Verification report
- Screenshots/logs/console evidence
- PASS/BLOCKED/FAIL verdict
- Review handoff notes

## Validation
- Evidence matches current implementation state.
- Tooling blockers are distinct from product failures.
- Reviewer can understand behavior without replaying the whole thread.

## References
- Verification template: [references/verification-reference.md](references/verification-reference.md)
- Architecture checks: [../bb-workstream/references/architecture-setup.md](../bb-workstream/references/architecture-setup.md)
- Review handoff: [../bb-review/SKILL.md](../bb-review/SKILL.md)
