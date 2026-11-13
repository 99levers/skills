---
name: aha
description: Find the app's likely aha moment and compare it and its paywall timing with the largest relevant apps in the 99Levers MCP library. Use when the user asks where users first experience value or whether their paywall comes too early or too late.
---

# 99Levers aha

Classify the app's aha moment, find similar apps, and explain the meaningful
consistencies or differences. Analyze only; do not change app code or start
purchases or trials.

Read `../../reference/connection.md` and `../../reference/rules.md`, follow the
connection check, and call `get_monetization_playbook` once. Use its evidence
standards without expanding this into a general monetization audit.

## 1. Classify your aha moment

Inspect the app locally to identify its audience, core job and first useful
outcome. Express the likely aha in the user's words: "I can photograph my own
plant and find out what it is."

Distinguish promised value (a claim), demonstrated value (a sample or preview)
and experienced value (a useful result from the user's own task). A usable
personalized plan can be an outcome itself. A screen appearing does not prove
the user understands or trusts its value; call the aha likely unless local
user research or behavioral evidence supports it.

Trace the reachable journey and name the screen or completed action where the
user first gets that outcome. Place the paywall before, at or after it. Separate
the first offer shown from the first unavoidable payment or trial gate, and check what remains available after dismissal. Keep materially
different jobs and cohorts separate. Follow active conditions rather than
component names or comments; local code does not establish production state.
Retain file/line evidence for follow-up.

## 2. Find similar apps

Use `search_flows` with abstract journey descriptions, then `get_app` to assess
fit and size. Choose about three strong matches; include more only when they
materially improve the comparison. Match the user's job, audience, type of
value, usage frequency and cost of delivering the result.

Among similarly relevant candidates, prefer the largest by comparable revenue
estimates, then downloads if revenue is unavailable. Keep a closer niche match
even if smaller. Preserve snapshot dates, geography and platform; incompatible
figures do not establish a ranking. Search rank is relevance, not size. Refine
or paginate when unrelated results or repeated flows crowd out candidates.
Don't choose apps for matching paywall timing or fame alone, and keep relevant
counterexamples. These are candidates found in the library, not a worldwide
ranking. Do not hardcode catalog counts or equate monthly revenue with MRR.

Use `get_flow` to inspect the relevant onboarding, real task, result, dismissal
and payment gate. Paginate as needed; inspect images with `include_images`
before visual claims. Keep captures from different installs or variants
separate, and count each app once. Record canonical URLs, capture dates and
steps. Missing coverage is unknown, not proof that a gate or outcome is absent.

## 3. Compare to those apps

Compare equivalent outcomes and payment boundaries: free identification does
not mean free diagnosis. Separate captured behavior from the inferred aha.
Look for clear, material patterns across independent, well-matched apps;
account for counterexamples and differences in fit.

- **When consistent:** explain the specific matches and why they support the
  user's likely aha moment and paywall placement. Don't stop at "no differences
  found." Similarity supports a plausible choice; it does not prove it works.
- **When inconsistent:** explain the important contrast plainly: what this app
  does, what the comparable apps repeatedly do, and why that difference could
  matter. Do not invent a problem or fill a findings quota. If a change is
  justified, consult `get_technique` and suggest it briefly as a hypothesis.
- **When evidence is thin or mixed:** say what aligns and what remains unknown.
  Do not turn a lack of comparables into reassurance or manufacture consensus.

Revenue does not prove that a flow works. Captures show placement, not how an
app's team discovered its aha moment.

## Output

Write a short, readable answer like the other 99Levers skills: usually 150–200
words, four sections, short bullets and plain language. Use normal Markdown,
not a code block or table. Include all four sections in this order; never
return only the verdict. Brevity means shortening each section, not removing
the reasoning that leads to the decision. Follow this shape:

> **1. Your aha moment**
> "<The user's likely realization, in one sentence.>"
> This happens when <specific screen or completed action>. Your paywall
> appears <before / at / after> this, <briefly distinguishing an optional offer
> from a required gate when relevant>.
>
> **2. Apps checked**
> - **<App>:** <Likely aha realization> at <specific step>; payment <before /
>   at / after that outcome, naming what is gated>.
> - <Repeat briefly for each app used in the comparison.>
>
> **3. How yours compares**
> <Connect the evidence above: name the apps sharing or differing from the
> user's aha moment and paywall timing, and explain why the pattern matters.
> Include a material counterexample or uncertainty.>
>
> **4. Verdict**
> **<Keep the current placement / Test moving it to [specific moment].>**
> <One or two sentences explaining why this choice fits the user's aha moment,
> grounded in their journey and the strongest comparable evidence.>

Every app used to justify the verdict must appear in Apps checked, with its
likely aha moment and payment timing. If the actual outcome was not captured,
say so rather than inventing a completed journey. If no suitable apps were
found, state that in the section instead of filling it with weak matches.

The verdict is the last section and follows from the comparison above it.
Give a decision and its reason, not just "no differences found." When keeping
the placement, explain what users already
understand or experience at the ask and which comparable behavior supports it.
When suggesting a move, name the exact trigger, what value users would have
experienced there, and why that could help. Frame the move as a test, not a
proven improvement. Don't repeat the whole comparison.

If the current placement is known but evidence is mixed or thin, use **"Keep
it for now; evidence is inconclusive"** and briefly explain what is unresolved.
This is not an endorsement of the current placement. If the current placement
itself cannot be established, say what must be confirmed before judging it.

The quote marks above only set the template apart; don't quote the answer.
Adapt the app count to the evidence. Link app names to the relevant canonical
flows and include compact capture dates. Mention a fit limitation only when it
changes the conclusion. Keep size figures out of the summary unless they help
explain a selection; if included, label estimates and their snapshot dates.

Keep research notes, tool logs, code paths, technique IDs, exhaustive journeys
and test plans out of the initial answer. Provide supporting steps and local
file/line evidence when asked for detail. Do not append unrelated recommendations
or overwrite `.99levers/review.md`.

Use `$aha` in Codex and `/99levers:aha` in Claude Code.
