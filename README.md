# 99Levers skills

Monetization skills for coding agents, backed by [99Levers](https://99levers.com): a library of real paywalls, onboarding flows, offers and cancellation flows captured from top apps.

Point your agent at your app's code and it will tell you what's missing, build it, or show you how you stack up against a specific competitor.

## Install (Claude Code)

```
/plugin marketplace add 99levers/skills
/plugin install 99levers@99levers
```

This installs the 99Levers plugin and connects the 99Levers MCP server.

## Commands

| Command | What it does |
|---|---|
| `/99levers:review` | Reviews your app's monetization against the library and ranks what to fix or add first. Saves the findings to `.99levers/review.md`. Doesn't change code. |
| `/99levers:build [technique or #]` | Builds one technique into your app. With no argument, builds the top open finding from your last review. |
| `/99levers:compare <app or App Store URL>` | Shows what a specific app from the library does differently from yours. |

You don't have to type the commands. Asking "why isn't my paywall converting?" or "how does my app compare to Duolingo?" works too.

The usual loop is **review → build → build → review**.

## What it looks at

Paywall and plans, trials, onboarding, feature gates and limits, what happens when someone closes the paywall or cancels the purchase sheet, cancellation and win-back, and App Store compliance basics like Restore Purchases and renewal terms. It reads StoreKit, RevenueCat, Superwall, Adapty and Play Billing code.

## What it sends

Only abstract descriptions of your app ("habit app, daily use, monthly plan, no trial") go to 99Levers. Your source code, credentials and analytics stay on your machine.

## A note on evidence

The library shows what apps do, not what works for them. Revenue figures are third-party estimates. The skills say where a recommendation comes from and how confident to be, and suggest how to measure the change.

## Development

```
claude --plugin-dir plugins/99levers      # try it locally
claude plugin eval plugins/99levers       # run the eval suite
```
