---
name: bb-review
description: "Use as the bb review gate for worker changes: manager first pass, same-environment readonly review, P0/P1/P2 findings, content accuracy, pattern precedence, and fix routing."
---

# Moss BB Review

## When To Use

Use this after implementation validation and required verification evidence exist.

## Read First
- ../WORKFLOWS.md
- references/review-reference.md
- ../bb-workstream/references/provider-selection.md
- ../../moss-notes/SKILL.md for review notes under ~/Moss/Notes/**

## Steps
1. Confirm validation/verification/QA evidence exists or is explicitly blocked.
2. Manager inspects diff, ownership, high-risk invariants, and obvious regressions.
3. Run same-environment readonly review for non-trivial work.
4. Ask reviewers to find introduced/exposed issues only and to check existing pattern precedence.
5. Synthesize findings, route P0/P1 fixes, and record P2/decision dispositions.

## Outputs
- Review report or dashboard section
- Prioritized findings with dispositions
- PASS/BLOCKED/DECISION NEEDED verdict

## Validation
- Reviewer uses the implementor environment readonly.
- Findings include concrete failure mode and smallest reasonable fix.
- No unresolved P0/P1 remains before merge readiness.

## References
- Review template: [references/review-reference.md](references/review-reference.md)
- Implementation handoff: [../bb-implementation/SKILL.md](../bb-implementation/SKILL.md)
- QA gate: [../bb-qa/SKILL.md](../bb-qa/SKILL.md)
