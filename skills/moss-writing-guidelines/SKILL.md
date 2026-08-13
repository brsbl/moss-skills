---
name: moss-writing-guidelines
description: Writing and scannability guidelines for Moss notes. Use when creating, editing, restructuring, or reviewing a note for reader-first structure, node choice, scannability, note quality, or writing guidelines.
---

# Moss Writing Guidelines

Write every Moss note for a reader who skims first and reads second. Lead with the answer, then match each piece of content to the representation that fits its shape, hierarchy, and density.

Related skill: note structure and syntax (`moss-notes`).

## Summary First

- Open with the answer, decision, or takeaway — not background or process.
- The first line should stand on its own. A reader who stops there still gets the point.
- State conclusions before evidence; put caveats and supporting detail after.

## Progressive Disclosure

- Order sections most- to least-important. Front-load what most readers need.
- Use H2 for major sections, H3/H4 for subsections. Never add a second H1.
- Keep paragraphs short (2-4 sentences). Layer content from overview to detail to appendix — scannable does not mean shorter, so keep the useful detail.
- Push deep detail, derivations, or side caveats into later sections, callouts, or comments.
- Keep normal document conventions. Scannability comes from structure, headings, section openings, and node choice — not from artificial framing like "60-second read."

## Choose And Compose Nodes

Match the representation to the information's shape, hierarchy, and density. "Default to prose" is the wrong instinct: pick the structure that lets a reader scan the content fastest at the level of detail they need.

Moss nodes are composable. Do not treat tabs, tables, HTML, charts, callouts, code, and comments as mutually exclusive choices. First choose the outer information architecture, then choose the best representation inside it.

| If the content is... | Use... | Notes |
| --- | --- | --- |
| One connective idea, explanation, or transition | Paragraph | Once several points, repeated attributes, or states appear, switch to bullets or a table. |
| Several grouped points or steps that don't share repeated attributes | Bullets / numbered list | If items share the same attributes, use a table instead. |
| Repeated attributes — statuses, roles, risks, metrics, owners, options, acceptance criteria | Table | Moss cells are rich: use H4-style header emphasis and put callouts, lists, links, or formulas inside cells when they add hierarchy. |
| 2-4 peer views, options, personas, modes, or states sharing one context | Tabs as an outer container | Use tabs when the reader should inspect one peer slice at a time. Tabs can hold full Moss content — tables, lists, callouts, charts, code, scoped HTML, and commentable text. If all peers must be compared at once, use a table/matrix or visual board instead. |
| Agent-generated flows, wireframes, menus, option sketches, or literal text/logs/code | Code block (ASCII) | Prefer ASCII in a fenced block over canvas for agent-authored diagrams; it stays readable and easy to revise. See the altitude and shape guidance below. |
| Product, operational, or technical concepts for a mixed audience — behavior, ownership, dependencies, states, or failure handling | Numbered flow, table, or compact ASCII map | Start at the product or system level. Preserve the real technical concept, explain it plainly, and show its consequence before implementation detail. |
| Implementation structure for engineers — a code path, component tree, file layout, type surface, schema, or API contract | Code block (ASCII or the real language) | Use when the reader must build or review the implementation, the user asks for code-level detail, or the decision depends on it. In mixed-audience notes, put the product-level view first. |
| A rough diagram where spatial layout matters more than the text | Canvas | Preserve existing canvas; create `moss-canvas` only when the user asks. Otherwise use ASCII. |
| A scoped visual artifact — prototype, mock, state board, explainer | HTML block | One job per node, never one giant block. Ground UI HTML in real product design. See below. |
| A high-signal caveat, warning, or priority aside | Callout | Use exact callout syntax; put labels like P1 in the content, not the level field. |
| A numeric comparison or trend where the shape is the point | Chart | Use when crossing points, growth, ranking, or volume is the thing to scan; skip when a short table says it. |
| A decision a reader must respond to | Comment | Only for decisions needing a response — not editorial or scannability notes. See below. |

When two structures fit equally, choose the one that reads faster.

### Choose The Right Altitude And Shape

Visual form and level of detail are separate decisions. Start at the highest altitude that preserves the reader's decision. A technically accurate diagram still fails if readers must decode implementation structure to understand the product behavior or consequence.

For product work and mixed audiences, default to:

- **User-to-system flow** — what the person does, how the system responds, what they see, and what happens on failure.
- **Responsibility or boundary map** — which person, team, product surface, or system owns each behavior and where handoffs occur.
- **State table** — situation, what the person sees, what the system does, and how recovery works.
- **Inputs / rules / outputs / failures** — the plain-language contract for a technical capability.
- **Before/after table** — changed behavior and its consequence.
- **Option table** — alternatives, decision criteria, tradeoffs, and the recommendation.

Keep accurate technical names when they matter, explain unfamiliar terms at first use, and connect implementation facts to user or business effects. Prefer numbered steps to arrows when order is the point. A diagram full of internal nouns is still a wall of text.

Use implementation-native shapes when the user explicitly asks about code paths, files, functions, components, types, schemas, or APIs; when the note is for engineers building or reviewing the implementation; or when ordering, concurrency, data ownership, or another implementation fact changes the decision. Useful shapes include call paths, component trees, focused file layouts, types and signatures, pseudocode, and diff-shaped before/after. Include only what carries the point, never a full source-tree dump.

When one note serves both audiences, put the product or system view first and the implementation shape in a later section. Keep any diagram to roughly 7-10 nodes; beyond that, split it or move up an altitude. Mermaid does not render in Moss. When a request asks for Mermaid, use a numbered flow or readable fenced ASCII block by default. Do not offer `moss-canvas` as a generic fallback; mention it only when the user explicitly wants an editable spatial diagram. Use `moss-html` only when a polished or interactive visual is the deliverable. If the user forbids substitutes, explain briefly that the request cannot produce a valid Moss note and do not add unsupported Mermaid.

For everyday work, use the same principle:

- **Outline with intent** for a planned memo, deck, or document before drafting.
- **Plan shape** for outcome, actions, owners and dates, dependencies, risks, and non-goals.
- **Spec shape** for problem, intended behavior, affected people, scenarios or states, constraints, and open decisions.
- **Research shape** for the answer, evidence, evidence strength, implication, and remaining gaps.
- **Timeline** for milestones and dependencies when timing is the point.
- **Decision tree** for branching rules a person must follow.
- **2x2** for positioning or triage when spatial placement carries the meaning.

Use the node-routing table above for representation: option grids, state comparisons, before/after comparisons, and research evidence usually belong in a real table rather than ASCII.

### Composition Patterns

- **Tabs + table:** use tabs for peer contexts (personas, scope buckets, product states, guardrail modes), then put a table inside each panel when that slice has repeated attributes.
- **Tabs + HTML:** use tabs when each peer context needs its own visual mock, state preview, or behavior demo. Keep each HTML block scoped to the panel's job.
- **Tabs + callout/comment:** use a callout for the panel's key caveat and comments on the exact decision text that needs review.
- **Table + rich cells:** use a table when side-by-side comparison matters; cells can include emphasis, links, formulas, lists, callouts, images, and comments when that improves hierarchy.
- **HTML + editable markdown:** use HTML for visual shape, but keep risks, decisions, and review questions in editable/commentable markdown near the visual.

Tabs are especially useful when one section contains several complete peer slices and showing every slice at once would create a wall of text. Do not force tabs when the reader needs simultaneous comparison or when a compact table is clearer.

### Scoped HTML

Use HTML for visual planning artifacts — direction comparisons, mockups, data-flow diagrams, state boards, PR/review explainers, or API/code surfaces — not only for interactive prototypes. Keep each HTML node scoped to one job; prefer several focused blocks over one giant prototype, and put each under the product section it clarifies. Front-load a focused visual artifact near the top of a dense UI/feature spec when it helps a reader see the problem and solution shape before the detailed requirements. Ground any UI HTML in the existing product: inspect the real screens, component library, tokens, layout patterns, screenshots, and docs, reuse those patterns, and label anything speculative as conceptual.

### Comments

Add a comment only where a typical reader must respond — scope, a design or engineering decision, feasibility, permissions, rollout, or metrics. Anchor it to the exact decision question or cell, not a whole section. Fix editorial issues (scannability, duplication, co-location) directly in the note instead of leaving a comment about them, and wrap comment markers around rich nodes (HTML, charts, fenced blocks) rather than inside their payloads.

## Spec And Feature Notes

- Front-load a scoped visual artifact when it clarifies the product shape, and present the problem alongside the solution near the first mocks.
- Co-locate the problem, solution, admin/user flow, and mockups so each artifact has context; place workflows next to the mockups they explain.
- Put goals and non-goals right after the problem/solution framing, before mocks, flows, or system detail.
- Identify one canonical home for each repeated requirement. Don't restate the same surface, state, risk, or decision across maps, mockups, tabs, and tables — make non-canonical copies summaries or references, and check for duplication across the whole note, not just neighboring sections.
- Product states, personas, scope buckets, and guardrail modes often work well as tabs when each slice has enough detail to inspect on its own. Put tables, callouts, charts, or scoped HTML inside the tab when that is the best inner representation. Use an HTML state board instead when seeing all states together is the visual deliverable.
- Name rich nodes by the product job they do ("Warning Rule Setup Mockup", "Primary Admin Experience"), not by node type.

## Note Archetypes

- **Decision / proposal:** recommendation up top → options (table or tabs) → tradeoffs → next steps.
- **Plan / task list:** desired outcome → assumptions → actions → owners, dates, and status → dependencies and risks → non-goals → open decisions.
- **Spec / feature:** problem → intended behavior and outcome → affected people → scenarios and states → constraints and non-goals → open decisions.
- **Research / analysis:** answer first → evidence and its strength → implications → gaps or uncertainty → recommendation → sources.
- **Reference / how-to:** one-line definition → steps or rules as lists → examples in code blocks.
- **Product / system concept:** outcome or behavior → responsibilities and boundaries → flow or states → consequences and tradeoffs → open decisions.
- **Engineering implementation:** product-level view first when the audience is mixed → focused implementation shape → rationale → risks → open decisions.
- **Status / update:** headline status (callout) → what changed → what's next.

## Final Review Checklist

Re-read the whole note before finishing and confirm:

- The opening states the takeaway; a skimmer gets the point from headings plus first lines.
- Sections run most- to least-important; hierarchy is consistent (one H1, H2+ below).
- Each piece of content uses the representation that fits its shape, hierarchy, and density, including composed structures when useful (for example tabs containing tables or scoped HTML).
- No back-to-back text-heavy nodes or walls of text; dense passages are broken up with tables, callouts, tabs, ASCII, or scoped HTML.
- Bold, italics, inline code, highlights, and emojis are used sparingly as hierarchy anchors — including inside tables and callouts — not as decoration. A sparse emoji can anchor a key row label or grade a severity (🔴 High, 🟠 Medium, 🟡 Low); keep emojis out of code and HTML.
- Each concept has one canonical home; no duplicated surfaces, states, risks, or decisions across the note.
- Technical terms remain accurate, but mixed-audience notes explain unfamiliar terms and connect implementation detail to observable behavior or decisions.
- Metadata (status, tags, dates) lives in frontmatter, not duplicated in the body.
- Comments mark only decisions a reader must answer.
