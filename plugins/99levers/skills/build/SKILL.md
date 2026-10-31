---
name: build
description: Build a monetization technique from the 99Levers library into the app in this codebase - for example a yearly plan anchor, free trial with timeline, cancelled-purchase recovery offer, paywall exit offer, feature gate or cancellation save offer. With no argument, builds the top open finding from the last 99Levers review. Use when the user asks to add, implement or build a paywall, pricing, trial, offer or retention technique, or to act on a 99Levers review.
argument-hint: "[technique-id | finding number]"
---

# 99Levers build

First read `../../reference/connection.md` and follow its connection check.
If tools are missing or authentication fails, perform setup before continuing.
Use command names for the current host as described there.

Implement one monetization technique in this app, adapted to its code and product.

Target: $ARGUMENTS

Before you start, read `../../reference/rules.md`, relative to this skill's base directory, and follow it throughout.

## 1. Pick what to build

- **A technique ID or name** (`transaction-abandon-offer`, "exit offer"): build that. If it is a name, not an ID, find the ID with `search_flows` or `get_technique`; if two techniques fit, ask which.
- **A number** (`2`): build that finding from `.99levers/review.md`.
- **Nothing**: read `.99levers/review.md` and build the highest-ranked finding with `status: open`. If the file does not exist, say so and suggest `/99levers:review` first, or ask which technique to build. Do not guess.

If the finding came from the review, reuse its "Change" as the spec. Tell the user in one line what you are about to build.

## 2. Learn the technique

Call `get_technique` with the ID. Read `howToImplement`, `placement`, `risks`, `guidelines` and `statusNote` closely; they hold the rules that keep this within App Review and out of dark-pattern territory. If the technique has `supersededBy`, use that one. If its `status` is not `fine`, stop and explain why you will not build it.

Open one or two of its example flows with `get_flow` (with `include_images`) so you understand the user-facing sequence. Use them for the mechanism only: never copy their copy, layout or assets.

## 3. Work out what the user has to set up

Many techniques only work once something exists outside the code. Find these before writing code, not at the end. Common ones:

- **App Store Connect**: a new subscription product (a yearly plan), an introductory offer (free trial, intro price), a promotional offer (recovery, save or win-back discount), offer codes, a win-back offer, a subscription group change.
- **Keys and servers**: a subscription key (`.p8`) and a server endpoint to sign promotional offers; App Store Server Notifications for lifecycle events.
- **Purchase platforms**: a RevenueCat product, offering or entitlement; a Superwall campaign or placement; an Adapty paywall.
- **Other**: push notification setup, an email provider, legal pages (Terms, Privacy).

Check what already exists: product and offer IDs in code, `.storekit` configuration files, RevenueCat offering identifiers, existing server endpoints. Then tell the user up front, in a short list, what this build will need from them and what you will assume (for example product ID `pro.yearly`, promotional offer ID `recovery_50`). Ask only if a choice changes the code, such as an existing product ID you cannot find; otherwise carry on with clearly named assumptions. Never ask for or handle the user's keys or credentials; point to where they go.

## 4. Fit it to this app

- Find the existing purchase stack (StoreKit, RevenueCat, Superwall, Adapty, Play Billing) and paywall code. Build on what is there; do not add a new SDK unless the user agrees.
- Match the app's architecture, UI framework, naming and style.
- Put assumed product and offer IDs, and any prices, discounts or durations you had to invent, behind one clearly named constant or remote config value, and say they are placeholders.

## 5. Build it

Make the change. Keep it the smallest version that captures the mechanism; note follow-ups instead of building them.

- **Fail safe until setup is done.** If the product or offer is not available from the store, the new screen or offer does not appear. Never show a button that fails, or a price you made up.
- **Make it testable before setup.** If the project uses a `.storekit` configuration file, or can, add the new product or offer there so the user can try the flow in the simulator before touching App Store Connect.

## 6. Check it

Before you call it done, verify and report each of these:

- Entitlement checks still gate the right things, and a subscriber never sees the new offer by mistake.
- Purchase, cancel and restore paths all still work, including StoreKit's `userCancelled` vs `pending`.
- Every new screen has a visible way out.
- Price, billing period and renewal terms are clear wherever money is mentioned, and prices come from the store, not hard-coded strings.
- Accessibility: labels on new controls, Dynamic Type does not clip the price.
- An analytics event fires for shown, accepted and dismissed, if the app has analytics.

Build and run the tests if the project has them. If you can run the app in a simulator, show the new screen. Say plainly what you could not verify.

## 7. Wrap up

**Never say it is ready to ship.** You cannot see App Store Connect, cannot make a real sandbox purchase, and cannot see App Review. Report one of these, and nothing stronger:

- **Not ready: waiting on you.** Setup outside the code is still needed. The feature stays hidden until it is done.
- **Ready to test.** The code is done and nothing else is needed, or the user has confirmed the setup. It still needs a purchase tested in the sandbox or TestFlight before release.
- **Not working.** It does not build, tests fail, or a check above failed. Say which.

If you could not compile or run it here, say so in the same line, for example **Not ready: waiting on you. Not compiled yet.** Use **Not working** only when something actually failed.

If the work came from `.99levers/review.md`, update that finding's `status:` to `needs-setup`, `ready-to-test` or leave it `open` if it is not working, and add a `built:` line with the date and files changed. For `needs-setup`, add a `setup:` checklist of what is left. Only the user marks a finding `done`, once it has shipped.

Then tell the user, starting with the status in bold on its own line:

1. **What changed**: the files.
2. **What you need to do**: numbered steps for everything outside the code, each with where it is (for example App Store Connect → your app → Subscriptions → the group → the product → Promotional Offers), the exact IDs and values the code expects, and how to tell it is done.
3. **How to test it**: with the `.storekit` file first, then a sandbox or TestFlight purchase once the setup is live.
4. **What you could not check**: anything from step 6 you could not verify.
5. **What to watch**: the metric from the finding or technique.

Suggest the next open finding, if any. When you start a build, also check `.99levers/review.md` for `needs-setup` and `ready-to-test` findings, and remind the user what each one is waiting on, in one line each.
