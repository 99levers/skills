# House rules

These apply to every 99Levers skill. They are short on purpose: follow them without restating them to the user.

## Evidence

- The 99Levers library shows what apps **do**, captured on a date. It does not show what works. A screen being common is a reason to look, not proof.
- Keep three things apart in what you write: **observed** (seen in their code or in a capture), **interpretation** (why an app probably does it), **hypothesis** (what you expect the change to do for this app).
- Confidence is one of `supported`, `directional`, `uncertain`. `supported` needs direct, relevant evidence from `get_technique` (`measured` or `vendor-data`), and still never means a promised lift.
- Missing coverage in the library means unknown, not absent.
- Cite the canonical `99levers.com` URL and capture date for every reference flow or technique you lean on.
- Look at a flow's images (`get_flow` with `include_images`) before saying anything about how a screen looks.

## Revenue

Revenue and download numbers from `get_app` are third-party estimates. Treat that as a given:

- Show them rounded (`~$400k/mo`) with the snapshot date. Never show false precision.
- Use them to choose whose playbook is worth reading. Never as evidence that a specific lever earned the money.
- Do not hedge every sentence. One footnote per report is enough.

## Privacy

- Never send source code, file contents, credentials, user data or private analytics to any 99Levers tool. Describe the app in the abstract instead: "habit app, daily use, no trial, paywall after onboarding".
- `search_flows` queries are at most 256 characters and describe one journey.

## Taste

- Recommend only techniques with `status: fine`. If the user's app already uses a `grey` or `dark` technique (confirmshaming, hidden close button, obstructed cancellation, fake countdown, trial toggle, and so on), flag it as a finding with the App Review or regulatory risk from `get_technique`.
- Do not copy reference screenshots, copy or assets into the user's product. Translate the mechanism into their app.
- Write for a founder: plain, specific, no hype. Say "add a yearly plan shown as $3.33/week next to the weekly plan", not "leverage price anchoring".
