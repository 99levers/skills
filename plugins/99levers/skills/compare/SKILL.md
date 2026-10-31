---
name: compare
description: Compare the monetization of the app in this codebase side by side with a specific app from the 99Levers library - paywall, plans, trial, onboarding, gates, recovery offers and cancellation - lever by lever. Use when the user asks how their app compares to a named competitor, what another app does that theirs doesn't, or to benchmark against a specific app.
argument-hint: "<app name or App Store URL>"
---

# 99Levers compare

Put this app's monetization next to one named app's, lever by lever. Compare only: do not change code.

App to compare against: $ARGUMENTS

If no app was named, ask which one. Before you start, read these, relative to this skill's base directory:

- `../../reference/rules.md`: evidence, revenue, privacy and taste rules.
- `../../reference/checklist.md`: the levers, which are the rows of the comparison.

## 1. Find the app

**If the user gave an App Store URL** (`apps.apple.com/<country>/app/<name>/id<number>`), take the name from the URL path and the numeric ID from the end. Match it the same way as a name, and confirm the match by checking that the store link in `get_app` has the same ID. If the ID matches no app in the library, treat it as not in the library.

App IDs are lowercase slugs of the app name (`hevy`, `ai-decor`). Try `get_app` with the likely slug first, then `search_flows` with the name as the query. Search matches flow text, so results can include other apps that merely mention the name: judge each result by its app name, not its rank. Then act on what you found:

- **One clear match**: the app name matches what the user typed, allowing for case, spacing and "app" suffixes. Say which app you are using in one line ("Comparing with Hevy: Workout Tracker") and continue.
- **Several plausible matches**: for example two apps from the same company, a lite and a full version, or similar names. Do not pick one. List them, one line each (name, category, what it does), and ask which one, or for the app's App Store link. Wait for the answer.
- **A near miss**: a different spelling, or an app that is probably the same one under another name. Ask "Did you mean <App>?", and say that pasting its App Store link removes any doubt. Do not assume it.
- **Not in the library**: do not stop. Say "<App> isn't in 99Levers yet." Then find the closest comparables: describe the named app in the abstract (audience, usage frequency, how it charges), run `search_flows` with that description, and offer the two or three best matches with one line each on why. Ask which to compare against, and continue with the user's pick. Never present a comparable as if it were the app the user named.

## 2. Map their app

Call `get_app`. Then `get_flow` on each flow that covers a checklist section, with `include_images` before any visual claim. Paginate long flows. Record, for each checklist lever, what they do and where (flow URL, step).

Library coverage is partial. A lever not seen in their captures is **unknown**, not missing.

## 3. Map this app

If `.99levers/review.md` exists and is recent, reuse its lever states. Otherwise walk the checklist against the code (see "Where to look in code" in the checklist), recording file and line for each lever.

## 4. Check comparability

In two or three sentences: how close are the two apps on audience, usage frequency and when users pay? Where they differ, note which differences matter less because of it.

## 5. Write the comparison

This is about what is different, not what is wrong. Do not grade this app, do not label anything must-fix, and do not list things that are the same in detail. Write for a terminal: short lines, plain words, no URLs, no file paths, no technique IDs, no tables. Write it as normal markdown (bold, bullets). Never put the comparison inside a code block: the terminal shows code blocks in one colour, which makes it hard to read.

It looks like this:

> **Comparing with Hevy**: workout tracker, freemium, ~$1M/mo (est., Sep 2026)
> **How close:** <one or two sentences on audience, usage and when users pay, and what makes some differences matter less>
>
> **At a glance**
> - **Both:** <a few short names>
> - **Only Hevy:** <a few short names>
> - **Only yours:** <a few short names, or "nothing notable">
>
> **What's different**
>
> **1. <Topic, e.g. Plans>**
> - **Hevy:** <what they do, concretely>
> - **Yours:** <what this app does>
>
> **2. <Topic, e.g. Onboarding>**
> - ...
>
> **Worth trying**
> - **<Difference worth adopting>:** <one line on why it fits this app>
>
> **Not worth copying**
> - **<Difference>:** <one line on why not>
>
> Revenue is a third-party estimate. Details and links: ask "more on 2".
> Next: `/99levers:build <name>` to build one of these.

(The `>` quote marks above only set the example apart here. Do not quote your comparison.)

Rules:

- **What's different** has one numbered entry per topic where the apps differ, in order of how much it matters for this app (use `../../reference/ranking.md`). Topics are plain words: plans and prices, onboarding, paywall, trial, free limits, offers after a cancel or dismiss, cancellation. Four to seven entries.
- Each side is one or two lines and concrete: prices, plan names, what screen appears when ("Saving the program opens the paywall").
- **At a glance** summarises the same differences in a few words each, and adds what both apps share.
- **Worth trying** has one to three items, and **Not worth copying** has zero to two. Use plain names; the user can pass a plain name to `/99levers:build`.
- If library coverage is thin for a topic, say "not captured" for their side rather than guessing.

When the user asks for more on one entry, give the detail: the flow URLs with capture dates and steps, and where this app does it (file and line).

Do not write `.99levers/review.md`.
