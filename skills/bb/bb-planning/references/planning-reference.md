# Planning Reference

Read [../SKILL.md](../SKILL.md) first. Use this for copy/paste plans.

## Planning Depth

Use the lightest artifact that prevents drift:

| Scope | Artifact |
| --- | --- |
| Tiny | Dashboard row or thread update |
| Small | Existing note addendum |
| Medium | Plan note |
| Large/risky | Spec/design note + worker task list |

For Moss notes, create a note directory under `~/Moss/Notes/**` and use [../../../moss-notes/SKILL.md](../../../moss-notes/SKILL.md).

## Plan Template

```markdown
# <Plan Title>

## 🧩 Problems

## 🛠️ Planned solution

## 🎯 Goals

## 🚫 Non-goals

## 🧱 Implementation plan

| Task | Owner | Files | Dependencies | Validation |
| --- | --- | --- | --- | --- |

## ✅ Acceptance criteria

## Evidence / validation

## Risks and open decisions
```

## Worker Scope Template

```text
Objective:
Source of truth:
Owned files:
Forbidden files:
Dependencies:
Acceptance criteria:
Validation:
Evidence:
Review risks:
```

## Precedence Check

Before introducing a new effect path, grep for existing frameworks:

```bash
rg "<concept|effect|node|migration|ipc|atom|transformer>" <repo>
```

Default to existing patterns. If adding a new path, document why the existing path is insufficient.
