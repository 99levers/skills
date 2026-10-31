# 99Levers skills

Monetization skills for coding agents, backed by [99Levers](https://99levers.com): a library of real paywalls, onboarding flows, offers and cancellation flows captured from top apps.

Point your agent at your app's code and it will tell you what's missing, build it, or show you how you stack up against a specific competitor.

## Install (Claude Code)

Run in a terminal:

```bash
claude plugin marketplace add 99levers/skills
claude plugin install 99levers@99levers
```

Then start Claude Code in your app's folder with `claude` and sign in to
99Levers once: run `/mcp`, choose **plugin:99levers:99levers**, then
**Authenticate**. Your browser opens the 99Levers sign-in. Use
`/99levers:login` any time to check or repair the connection.

To update after a new release:

```bash
claude plugin marketplace update 99levers
claude plugin update 99levers@99levers
```

Restart Claude Code after updating.

## Install (Codex)

Run in a terminal:

```bash
codex plugin marketplace add 99levers/skills
codex plugin add 99levers@99levers
```

Restart Codex, then use `$review`, `$build`, `$compare` or `$login` (choose
the 99Levers skill if names collide). Each workflow checks library access first.
If tools are missing, it registers the MCP server when needed and starts browser
login. `$login` performs the same setup without starting a review or build.
You complete sign-in and consent in the browser. If the current session cannot
load the newly connected tools, restart Codex and repeat your request.

To update an existing installation after a new release:

```bash
codex plugin marketplace upgrade 99levers
codex plugin add 99levers@99levers
```

Restart Codex after updating.

## Commands

| Claude Code | Codex | What it does |
|---|---|---|
| `/99levers:login` | `$login` | Checks the MCP connection and helps you sign in. In Codex, also registers the server when needed. |
| `/99levers:review` | `$review` | Reviews your app's monetization against the library and ranks what to fix or add first. Saves the findings to `.99levers/review.md`. Doesn't change code. |
| `/99levers:build [technique or #]` | `$build [technique or #]` | Builds one technique into your app. With no argument, builds the top open finding from your last review. |
| `/99levers:compare <app or App Store URL>` | `$compare <app or App Store URL>` | Shows what a specific app from the library does differently from yours. |

You don't have to type the commands. Asking "why isn't my paywall converting?" or "how does my app compare to Duolingo?" works too.

The usual loop is **review → build → build → review**.

## What it looks at

Paywall and plans, trials, onboarding, feature gates and limits, what happens when someone closes the paywall or cancels the purchase sheet, cancellation and win-back, and App Store compliance basics like Restore Purchases and renewal terms. It reads StoreKit, RevenueCat, Superwall, Adapty and Play Billing code.

## What it sends

Only abstract descriptions of your app ("habit app, daily use, monthly plan, no trial") go to 99Levers. Your source code, credentials and analytics stay on your machine.

## A note on evidence

The library shows what apps do, not what works for them. Revenue figures are third-party estimates. The skills say where a recommendation comes from and how confident to be, and suggest how to measure the change.
