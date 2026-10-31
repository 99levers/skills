import SwiftUI

struct PaywallView: View {
    @EnvironmentObject var store: Store
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 16) {
            Text("Go Pro").font(.largeTitle).bold()
            Text("Unlimited habits, stats and themes.")
            Button("Subscribe for \(store.monthly?.displayPrice ?? "$4.99")/month") {
                Task { await store.buy(); if store.isPro { dismiss() } }
            }
            .buttonStyle(.borderedProminent)
            Button("Not now") { dismiss() }
        }
        .padding()
    }
}
