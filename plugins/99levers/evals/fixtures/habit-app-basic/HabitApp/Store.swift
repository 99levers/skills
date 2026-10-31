import StoreKit

@MainActor
final class Store: ObservableObject {
    @Published var isPro = false
    @Published var monthly: Product?

    init() {
        Task { await load() }
    }

    func load() async {
        monthly = try? await Product.products(for: ["pro.monthly"]).first
        for await result in Transaction.currentEntitlements {
            if case .verified = result { isPro = true }
        }
    }

    func buy() async {
        guard let monthly else { return }
        let result = try? await monthly.purchase()
        if case .success(.verified(let transaction)) = result {
            isPro = true
            await transaction.finish()
        }
        // userCancelled and pending: nothing happens
    }
}
