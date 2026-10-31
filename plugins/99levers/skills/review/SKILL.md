---
name: review
description: Review the monetization of the app in this codebase - paywall, plans, trial, onboarding, gates, purchase recovery and cancellation - against the 99Levers library of captured apps, and rank what to fix or add first. Use when the user asks why their app isn't converting, what to change about their paywall or pricing, how to make more money from their app, or for a monetization or paywall audit or review.
---

# 99Levers review

Find what is wrong or missing in this app's monetization and rank what to do first. Review only: do not change the app's code. The user runs `/99levers:build` to implement a finding.

Before you start, read these, relative to this skill's base directory:

- `../../reference/rules.md`: evidence, revenue, privacy and taste rules. Follow them throughout.
- `../../reference/checklist.md`: the levers to check and where to find them in code.
- `../../reference/ranking.md`: how to rank, and defaults by app type.

## Steps

1. **Get the playbook.** Call `get_monetization_playbook` once. Its workflow and `recommendation_fields` shape every finding below.

2. **Understand the app.** From the code, README, App Store metadata in the repo and anything the user has said: who it is for, the problem it solves, how often people use it, and the first moment they get value. Classify it with `ranking.md`. If something important cannot be found in code (for example a remotely configured paywall), note it as unknown and ask the user one short question at the end, not up front.

3. **Map monetization.** Walk the checklist. For every lever, record its state (has it / weaker / missing / not applicable / unknown) with the file and line that shows it. Trace the actual paths: first launch to paywall, paywall dismissed, purchase sheet cancelled, limit hit, subscriber cancels. Separate paths you traced in code from ones you inferred.

4. **Find comparables.** Use `search_flows` with abstract queries (never code) to find 3-5 apps that match on audience, usage frequency and when users pay. One journey per query, for example "habit app paywall after onboarding with free trial". Call `get_app` on the strongest matches. Say why each one is comparable and where it is not.

5. **Look at the evidence.** For each candidate finding, open the relevant flows with `get_flow` (with `include_images` before any visual claim) and the technique with `get_technique`. Note the evidence level and the risks it lists.

6. **Rank.** Order findings with `ranking.md`. Cut anything you cannot tie to local evidence or a reference. Five to seven findings is usually right; more is noise.

7. **Write the report** in chat, then save it (below).

## Report format

The chat report is for reading in a terminal: short lines, plain words, no URLs, no file paths, no technique IDs, no confidence labels. Write it as normal markdown (bold, bullets). Never put the report inside a code block: the terminal shows code blocks in one colour, which makes it hard to read. The saved file holds the full detail.

It looks like this:

> <One sentence: what the app is and how it makes money today.> <One sentence: the single biggest gap.>
>
> **At a glance**
> 1. ❌ <short name of finding 1>
> 2. ❌ <short name of finding 2>
> 3. ⚠️ <short name of finding 3>
>
> Already good: <2-4 short names of levers the app already does well>
>
> **Compared with** Hevy, Finch, Calm
> - **Hevy**: <why chosen, where it differs from this app>
> - ...
>
> **1. <What to do, in plain words>** · <must-fix · >small|medium|large
> - **Now:** <what the app does today>
> - **Do:** <the specific change for this app>
> - **Why:** <why it should help this app, as a plain expectation>
> - **Seen in:** <App>: <what it does, concretely>. <App>: <...>.
>
> **2. ...**
>
> Full details, links and how to measure each one: `.99levers/review.md`
> Next: `/99levers:build` to build #1, or ask "more on 3" for the details of one.

(The `>` quote marks above only set the example apart here. Do not quote your report.)

Rules for the chat report:

- **At a glance** is a summary of the findings below: one line per finding, in the same order and with the same numbers, a few words each. ❌ means missing, ⚠️ means there but weak. Then one "Already good" line. Nothing else: no checklist sections, no section numbers, no table.
- Keep each line short: one or two sentences per bullet.
- **Seen in** is the most important line. Name 1-3 comparable apps and say concretely what each one does ("Hevy preselects yearly with Save 33%", "Finch shows Today / Day 5 / Day 7 before the trial"). If no comparable does it, say so ("None of the comparables do this; it is an Apple requirement"). If the only examples fit poorly, say that too.
- Put an essential warning, such as an App Review rejection, inside **Do** in a few words. Do not add a risks section.
- Mark compliance gaps from the checklist's must-fix section as `must-fix`.
- Five to seven findings. If revenue estimates are cited, add a one-line footnote that they are estimates with their date.

When the user asks for more on one finding, show that finding's full entry from the saved file.

## Save the review

Write the full findings to `.99levers/review.md` in the project root, creating `.99levers/` if needed, so `/99levers:build` and "more on N" can use them later. Use this format, in rank order:

```
# 99Levers review
date: <YYYY-MM-DD>
app_type: <type from ranking.md>
compared_with: <apps, each with why it was chosen and where it differs>

### 1. <Finding in plain words>  ·  <technique-id>  ·  confidence: <supported|directional|uncertain>  ·  effort: <S|M|L>
status: open

**Now:** what the app does today, with file:line.
**Change:** the specific change for this app, including any essential warning.
**Why:** the mechanism, stated as a hypothesis for this app.
**Seen in:** 1-3 comparable apps, each with what it does, its 99Levers URL, capture date and how well it fits.
**How to tell it worked:** the metric and guardrails to watch.
```

If `.99levers/review.md` already exists, replace it. Tell the user in one line that the file was written, and suggest adding `.99levers/` to `.gitignore` if they do not want it committed.
