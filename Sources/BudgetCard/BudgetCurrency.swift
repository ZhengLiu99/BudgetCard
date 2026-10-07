import Foundation

/// 调用方传入的货币。菜单显示 `code`，金额前缀使用 `symbol`。
public struct BudgetCurrency: Hashable, Identifiable, Sendable {
    public var code: String
    public var symbol: String

    public var id: String { code }

    public init(code: String, symbol: String) {
        self.code = code
        self.symbol = symbol
    }
}
