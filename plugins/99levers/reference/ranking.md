# How to rank findings

Rank by how much revenue the gap is likely leaving on the table for **this** app, then by effort. Use this order:

1. **Must-fix.** Compliance, broken restore, deceptive patterns. These can get the app rejected or refunded.
2. **Reach.** Gaps on surfaces every user sees beat gaps on surfaces a few users see. The end-of-onboarding paywall is seen by every new user; a cancellation flow is seen only by subscribers who leave.
3. **Intent.** Among surfaces with similar reach, gaps where intent is highest come first: a cancelled purchase sheet, a hit limit, a success moment.
4. **Effort.** Break ties with effort. A preselected yearly plan is an afternoon; a quiz onboarding is a week.

Comparable apps' revenue never decides rank. See `rules.md`.

## Defaults by app type

Classify the app first by how often people use it and when they get value, not by store category. Then use these as starting priors, and say when the app does not fit neatly.

**Daily habit** (fitness, language, meditation, journaling): value builds over weeks.
- Paywall at the end of onboarding, with a free trial and trial timeline.
- Personalised onboarding whose answers show up on the paywall.
- Yearly plan as the anchor; monthly as the alternative.
- Streaks, reminders and milestones protect retention; success-moment paywalls for free users.

**Occasional utility** (scanner, cleaner, VPN, converter): one job, used in bursts.
- Paywall at launch or after the first job, often hard or near-hard.
- Weekly plan next to a yearly anchor is common; a short trial or none.
- Purchase-sheet cancel and paywall dismiss recovery matter most, since the user may not come back.

**Result-driven** (AI photo, avatar, design, writing): value arrives as a single output.
- Show the result, gate the full version: blurred preview, save or export gate.
- Credits or usage limits alongside or instead of subscriptions.
- Paywall right after the first result.

**Content or library** (courses, stories, music, recipes): value is browsing a catalogue.
- Freemium tier with clear free content; feature and content gates with context.
- Trial suits these well; persistent upgrade entry point.

**Tool for creators or pros** (editors, productivity, business): value grows with depth of use.
- Freemium or reverse trial; gates on advanced features and export quality.
- Yearly plan and a lifetime option are both common.

When two types fit, say which you chose and why. When the library has few comparables for the type, lower confidence rather than borrowing from a mismatched type.
