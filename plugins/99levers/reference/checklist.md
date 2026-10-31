# Lever checklist

What `review` and `compare` check, in funnel order. Each lever lists what good looks like and the 99Levers technique IDs to pull with `get_technique`. A lever that does not exist in the app at all is a finding too, often the biggest one.

Mark each lever **has it**, **weaker**, **missing**, **not applicable** or **unknown** (could not tell from code). Only mark **not applicable** with a reason tied to the app's model.

## 0. Must-fix (compliance and trust)

Check these first. Any miss here outranks everything else.

| Lever | Good looks like | Technique IDs |
|---|---|---|
| Restore purchases | Reachable from the paywall and from settings, works without a fresh login | `restore-purchases` |
| Renewal disclosure | Billed amount, period and auto-renewal stated near the buy button; terms and privacy links on the paywall | `auto-renew-disclosure`, `upfront-model-disclosure` |
| Escapable paywall | A visible close or "not now" unless the app is deliberately hard-paywalled | `visible-close-button`, `hard-paywall` |
| Manage subscription | In-app link to the system subscription screen | `manage-subscription-link` |
| No deceptive patterns | None of the `deceptive` layer: fake timers, trick wording, hidden close, trial toggles, obstructed cancellation | `confirmshaming`, `hidden-close-button`, `fake-countdown`, `trial-toggle`, `obstructed-cancellation` |

## 1. Model

| Lever | Good looks like | Technique IDs |
|---|---|---|
| A clear model | One primary way to pay that fits the usage pattern (see `ranking.md`) | `hard-paywall`, `freemium-tier`, `reverse-trial`, `usage-limit`, `credit-pack`, `token-allowance`, `lifetime-plan` |
| Free allowance that sells | Free users hit the value, then the limit, in their first sessions | `free-starter-content`, `usage-limit`, `token-allowance` |

## 2. Onboarding

| Lever | Good looks like | Technique IDs |
|---|---|---|
| Paywall at the end of onboarding | Every new user sees a paywall once, after setup, before the main app | `onboarding-paywall`, `launch-paywall` |
| Personalisation that feeds the paywall | Questions whose answers are echoed on the plan and paywall screens | `quiz-onboarding`, `goal-setting`, `plan-ready-screen`, `personalised-paywall-recap` |
| Value before the ask | The user sees or tries the outcome before paying | `try-it-demo`, `blurred-result-preview`, `projected-outcome-date` |
| Permission timing | Push and tracking prompts primed and asked after value, not on first launch | `push-permission-priming`, `att-prompt-placement` |

## 3. Paywall

| Lever | Good looks like | Technique IDs |
|---|---|---|
| Annual anchor | A yearly plan preselected or badged, shown as a per-week or per-month price against the short plan | `anchor-plan`, `per-period-reframe`, `savings-badge`, `preselected-plan`, `best-value-badge` |
| Plan structure | Two or three plans at most, or one plan with a trial | `tiered-plans`, `single-plan-paywall`, `weekly-plan`, `plan-picker` |
| Benefits | Three to five concrete outcomes, not a feature dump | `benefit-checklist`, `free-vs-pro-table` |
| Trust | Real ratings or user counts, never invented | `star-rating-badge`, `testimonials`, `user-count-claim` |
| CTA | Says what happens ("Start my free week"), stays on screen | `cta-copy`, `sticky-cta`, `no-payment-due-now` |
| Localised prices | Prices from the store, never hard-coded | `price-localization` |

## 4. Trial

| Lever | Good looks like | Technique IDs |
|---|---|---|
| Free trial where it fits | Trial for habit and content apps; trial length matched to time-to-value | `free-trial`, `trial-length-choice`, `paid-trial` |
| Trial made safe | Timeline showing when the charge happens, plus a reminder before it | `trial-timeline`, `trial-ending-reminder`, `trial-gift-primer` |
| Ineligible users | Users who already used a trial see a different offer, not a broken "free" button | `trial-ineligible-fallback` |

## 5. Placement after onboarding

| Lever | Good looks like | Technique IDs |
|---|---|---|
| Gates at the moment of intent | Paywall fires when the user reaches for a premium thing, with context about that thing | `feature-gate`, `contextual-paywall`, `gated-feature-intro`, `limit-reached-paywall`, `save-export-gate` |
| A paywall after a win | Offer right after the user gets a result or hits a milestone | `success-moment-paywall` |
| Always a way in | A persistent, quiet upgrade entry point | `persistent-upgrade-button`, `upgrade-banner` |

## 6. Recovery

| Lever | Good looks like | Technique IDs |
|---|---|---|
| Purchase-sheet cancel | One escapable offer after StoreKit returns `userCancelled` | `transaction-abandon-offer` |
| Paywall dismiss | One escapable offer, or a survey, after closing the paywall | `paywall-exit-offer`, `paywall-exit-survey` |
| Follow-up | A push or email a day or so after a dismissed paywall | `paywall-followup-push`, `email-followup` |

## 7. Retention and win-back

| Lever | Good looks like | Technique IDs |
|---|---|---|
| Activation after purchase | New subscribers are walked to the premium value right away | `post-purchase-activation` |
| Cancellation | A survey and a save offer before sending the user to the system cancel screen | `cancellation-survey`, `cancellation-save-offer`, `downgrade-option`, `pause-subscription` |
| Billing problems | Grace period on, with an in-app prompt to fix payment | `billing-grace-period` |
| Win-back | Offer for lapsed subscribers via promotional offers or offer codes | `win-back-offer`, `promotional-offer`, `offer-codes`, `lapsed-premium-reminder` |
| Upgrade path | Monthly subscribers offered yearly after they have stuck | `upgrade-to-annual` |

## Where to look in code

Search for these, then read the surrounding files. Record the file and line for each lever you mark.

- **StoreKit 2**: `Product.products(for:`, `.purchase(`, `userCancelled`, `Transaction.currentEntitlements`, `Transaction.updates`, `AppStore.sync`, `showManageSubscriptions`, `SubscriptionStoreView`, `.storekit` config files.
- **StoreKit 1**: `SKPaymentQueue`, `SKProductsRequest`, `restoreCompletedTransactions`.
- **RevenueCat**: `Purchases.configure`, `getOfferings`, `purchase(package:`, `restorePurchases`, `customerInfo`, `entitlements`, `PaywallView`, `presentPaywallIfNeeded`; React Native `react-native-purchases`, Flutter `purchases_flutter`.
- **Superwall / Adapty / Qonversion**: `Superwall.shared.register(`, placements and campaign names; `Adapty.getPaywall`; `Qonversion.shared().purchase`.
- **Google Play Billing**: `BillingClient`, `launchBillingFlow`, `queryProductDetailsAsync`.
- **Paywall UI**: files or components named `Paywall`, `Upgrade`, `Premium`, `Pro`, `Subscription`, `Plans`, `Pricing`.
- **Gates**: `isPro`, `isPremium`, `hasEntitlement`, `isSubscribed`, usage counters, `limit`, `remaining`, `credits`.
- **Onboarding**: `Onboarding`, `Welcome`, `Quiz`, `Survey`, first-launch flags (`hasSeenOnboarding`).
- **Lifecycle**: `UNUserNotificationCenter`, push scheduling, `requestTrackingAuthorization`, `SKStoreReviewController` / `requestReview`.

If the paywall is configured remotely (RevenueCat paywalls, Superwall, Adapty), the code shows placements but not the design. Say so, mark design levers **unknown**, and ask for a screenshot if it matters.
