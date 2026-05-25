---
name: bb-qa
description: "Use when a Moss bb workstream needs a QA merge/release gate with automated checks, user-flow checks, moss verify, risks, HUMAN checks, and dashboard-linked QA notes under ~/Moss/Notes/**."
---

# Moss BB QA

## When To Use

Use this for user-facing, multi-worker, high-risk, release-relevant, or explicitly requested QA.

## Read First
- ../WORKFLOWS.md
- references/qa-reference.md
- ../bb-workstream/references/architecture-setup.md
- ../../moss-notes/SKILL.md (required for QA notes under ~/Moss/Notes/**)

## Steps
1. Define the diff/base/head and surfaces under test.
2. Build automated and manual checks from the plan, diff, verification, review, and release scope.
3. Run focused checks and record `moss verify` as PASS/FAIL/NOT RUN.
4. Classify issues as product failure, tooling blocker, HUMAN, or accepted risk.
5. Link QA verdict and blockers from the dashboard.

## Outputs
- QA note/checklist
- Automated/manual check results
- Gate verdict: PASS, BLOCKED, DECISION NEEDED, or NOT RUN
- Dashboard update

## Validation
- Every check has result/evidence or HUMAN reason.
- `moss verify` status is explicit.
- Product failures block unless accepted.
- QA note is a valid Moss note directory.

## References
- QA template: [references/qa-reference.md](references/qa-reference.md)
- Verification evidence: [../bb-verification/SKILL.md](../bb-verification/SKILL.md)
- Moss note rules: [../../moss-notes/SKILL.md](../../moss-notes/SKILL.md)
