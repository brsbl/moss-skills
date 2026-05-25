# Worker Lifecycle Reference

Read [../SKILL.md](../SKILL.md) first. This file is a prompt/checklist bank.

## Access Report

```bash
pwd
git branch --show-current
git status --short
command -v rg || true
pnpm --version || true
node -p 'process.platform + " " + process.arch' || true
```

## Implementation Prompt

```text
Objective:
Done when:

Read first / Skills to apply:
- skills/bb/WORKFLOWS.md
- skills/bb/bb-implementation/SKILL.md
- <stage skill if different>
- skills/moss-notes/SKILL.md if writing under ~/Moss/Notes/**
- <repo docs / specs / PR feedback>

Owned files:
Forbidden files:
Base branch:
Validation:
Evidence/output:

Return an access report and plan before edits. Do not change files until the manager approves the plan.
```

## Final Report Template

```text
Status:
Changed files:
Validation run/results:
Evidence paths:
Plan divergence:
Blockers/risks:
Ready for review? yes/no
```

## Merge Checklist

- base and owned files match plan
- validation and evidence complete
- UI verification exists when needed
- QA/review gates resolved
- no unowned files changed
- dashboard updated
