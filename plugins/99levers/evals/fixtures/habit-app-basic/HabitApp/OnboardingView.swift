import SwiftUI

struct OnboardingView: View {
    let onDone: () -> Void

    var body: some View {
        VStack(spacing: 24) {
            Text("Build habits that stick").font(.largeTitle).bold()
            Text("Track your habits every day and watch your streaks grow.")
            Button("Get started", action: onDone).buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
