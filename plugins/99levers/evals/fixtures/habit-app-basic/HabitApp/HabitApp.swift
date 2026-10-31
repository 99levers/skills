import SwiftUI

@main
struct HabitApp: App {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    @StateObject private var store = Store()

    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                HabitListView().environmentObject(store)
            } else {
                OnboardingView { hasSeenOnboarding = true }
            }
        }
    }
}
