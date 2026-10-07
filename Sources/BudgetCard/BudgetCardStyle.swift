import SwiftUI

struct BudgetCardStyle {
    let displayScale: CGFloat

    let cardBackground: Color
    let secondaryLabel: Color
    let menuStroke: Color
    let infoIcon: Color
    let badgeFill: Color
    let progressTrack: LinearGradient
    let progressFill: LinearGradient

    func s(_ value: CGFloat) -> CGFloat { value * displayScale }

    var labelFont: Font { .system(size: s(5), weight: .medium) }
    var labelFontRegular: Font { .system(size: s(5), weight: .regular) }
    var amountFont: Font { .system(size: s(20), weight: .regular) }

    static let figma = BudgetCardStyle(
        displayScale: 2.5,
        cardBackground: Color(red: 21 / 255, green: 18 / 255, blue: 25 / 255),
        secondaryLabel: Color.white.opacity(0.5),
        menuStroke: Color(red: 121 / 255, green: 117 / 255, blue: 117 / 255),
        infoIcon: Color(red: 138 / 255, green: 136 / 255, blue: 140 / 255),
        badgeFill: Color(white: 0.67, opacity: 0.1),
        progressTrack: LinearGradient(
            colors: [
                Color(red: 48 / 255, green: 48 / 255, blue: 48 / 255),
                Color(red: 99 / 255, green: 90 / 255, blue: 98 / 255)
            ],
            startPoint: .leading,
            endPoint: .trailing
        ),
        progressFill: LinearGradient(
            colors: [
                Color(red: 63 / 255, green: 31 / 255, blue: 194 / 255),
                Color(red: 242 / 255, green: 241 / 255, blue: 247 / 255)
            ],
            startPoint: .leading,
            endPoint: .trailing
        )
    )
}
