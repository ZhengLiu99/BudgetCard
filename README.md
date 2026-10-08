# BudgetCard

iOS 17 以上可用的 SwiftUI 预算卡片。显示年度预算、已花费、剩余金额和进度，并提供货币切换菜单。

## 要求

- iOS 17
- Swift tools 6.0

## 安装

在 Xcode 里选择 File → Add Package Dependencies，填入：

```text
https://github.com/ZhengLiu99/BudgetCard.git
```

版本规则选 Up to Next Major Version，从 `1.0.0` 开始。

也可以在 `Package.swift` 里添加：

```swift
.package(url: "https://github.com/ZhengLiu99/BudgetCard.git", from: "1.0.0")
```

然后依赖 `BudgetCard` 这个库。

## 用法

```swift
import BudgetCard

struct BudgetScreen: View {
    @State private var currency = BudgetCurrency(code: "CNY", symbol: "¥")

    private let currencies = [
        BudgetCurrency(code: "CNY", symbol: "¥"),
        BudgetCurrency(code: "USD", symbol: "$")
    ]

    var body: some View {
        BudgetCard(
            snapshot: BudgetSnapshot(budget: 5749, spent: 4605, progress: 0.44),
            currencies: currencies,
            selection: $currency
        )
    }
}
```

`BudgetSnapshot.progress` 使用 `0` 到 `1`。卡片上的百分比和进度条都按这个值显示。
