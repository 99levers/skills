import SwiftUI

struct HabitListView: View {
    @EnvironmentObject var store: Store
    @State private var habits: [String] = []
    @State private var showPaywall = false

    private let freeLimit = 3

    var body: some View {
        NavigationStack {
            List(habits, id: \.self) { Text($0) }
                .toolbar {
                    Button("Add") {
                        if habits.count >= freeLimit && !store.isPro {
                            showPaywall = true
                        } else {
                            habits.append("Habit \(habits.count + 1)")
                        }
                    }
                }
                .sheet(isPresented: $showPaywall) { PaywallView().environmentObject(store) }
        }
    }
}
