// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "BudgetCard",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(name: "BudgetCard", targets: ["BudgetCard"])
    ],
    targets: [
        .target(name: "BudgetCard")
    ]
)
