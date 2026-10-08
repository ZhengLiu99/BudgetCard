import CoreGraphics

public struct BudgetSnapshot: Sendable {
    public var budget: Double
    public var spent: Double
    public var progress: CGFloat

    public var remaining: Double { budget - spent }

    public var progressText: String { "\(Int((progress * 100).rounded()))%" }

    public init(budget: Double, spent: Double, progress: CGFloat) {
        self.budget = budget
        self.spent = spent
        self.progress = progress
    }

    public static let sample = BudgetSnapshot(
        budget: 5_749,
        spent: 4_605,
        progress: 0.44
    )
}
