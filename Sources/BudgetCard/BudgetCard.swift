import SwiftUI

public struct BudgetCard: View {
    private let snapshot: BudgetSnapshot
    private let currencies: [BudgetCurrency]
    @Binding private var selection: BudgetCurrency

    private let style = BudgetCardStyle.figma

    public init(
        snapshot: BudgetSnapshot,
        currencies: [BudgetCurrency],
        selection: Binding<BudgetCurrency>
    ) {
        self.snapshot = snapshot
        self.currencies = currencies
        self._selection = selection
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            header

            progressBar
                .padding(.top, style.s(4))

            statsRow
                .padding(.top, style.s(6))
        }
        .padding(style.s(10))
        .fixedSize(horizontal: true, vertical: true)
        .background(style.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: style.s(11), style: .continuous))
    }

    private var header: some View {
        HStack(alignment: .top, spacing: style.s(8)) {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: style.s(2)) {
                    Text("Annualized spend")
                        .font(style.labelFont)
                        .foregroundStyle(style.secondaryLabel)
                        .tracking(-0.2)

                    Image(systemName: "info.circle")
                        .font(.system(size: style.s(7)))
                        .foregroundStyle(style.infoIcon)
                }

                Text(money(snapshot.budget))
                    .font(style.amountFont)
                    .foregroundStyle(.white)
                    .tracking(-0.2)
                    .padding(.top, style.s(1))
            }

            Spacer(minLength: 0)

            currencyMenu
        }
    }

    private var progressBar: some View {
        Capsule()
            .fill(style.progressTrack)
            .frame(maxWidth: .infinity)
            .frame(height: style.s(3))
            .overlay(alignment: .leading) {
                Capsule()
                    .fill(style.progressFill)
                    .frame(maxWidth: .infinity)
                    .scaleEffect(x: snapshot.progress, anchor: .leading)
            }
    }

    private var statsRow: some View {
        HStack(alignment: .top) {
            HStack(alignment: .bottom, spacing: style.s(4)) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Spent")
                        .font(style.labelFont)
                        .foregroundStyle(style.secondaryLabel)
                    Text(money(snapshot.spent))
                        .font(style.labelFont)
                        .foregroundStyle(.white)
                        .tracking(-0.2)
                }

                Text(snapshot.progressText)
                    .font(.system(size: style.s(4.2), weight: .semibold))
                    .foregroundStyle(.white)
                    .tracking(-0.17)
                    .frame(width: style.s(15), height: style.s(8))
                    .background(style.badgeFill)
                    .clipShape(RoundedRectangle(cornerRadius: style.s(10), style: .continuous))
            }

            Spacer(minLength: 0)

            VStack(alignment: .trailing, spacing: 0) {
                Text("Remaining")
                    .font(.system(size: style.s(4.5), weight: .medium))
                    .foregroundStyle(style.secondaryLabel)
                Text(money(snapshot.remaining))
                    .font(style.labelFont)
                    .foregroundStyle(.white)
                    .tracking(-0.2)
            }
        }
    }

    private var currencyMenu: some View {
        Menu {
            ForEach(currencies) { currency in
                Button(currency.code) { selection = currency }
            }
        } label: {
            HStack(spacing: style.s(2)) {
                Text(selection.code)
                    .font(style.labelFontRegular)
                    .foregroundStyle(.white)
                    .lineLimit(1)

                Image(systemName: "chevron.down")
                    .font(.system(size: style.s(3), weight: .semibold))
                    .foregroundStyle(style.menuStroke)
            }
            .padding(.horizontal, style.s(4))
            .frame(height: style.s(12))
            .overlay {
                RoundedRectangle(cornerRadius: style.s(4), style: .continuous)
                    .stroke(style.menuStroke, lineWidth: style.s(0.4))
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }

    private func money(_ value: Double) -> String {
        let amount = value.formatted(.number.precision(.fractionLength(0)))
        return "\(selection.symbol)\(amount)"
    }
}

#Preview("Interactive") {
    BudgetCardPreview()
}

private struct BudgetCardPreview: View {
    @State private var currency = BudgetCurrency(code: "USD", symbol: "$")

    private let currencies = [
        BudgetCurrency(code: "USD", symbol: "$"),
        BudgetCurrency(code: "EUR", symbol: "€"),
        BudgetCurrency(code: "GBP", symbol: "£"),
        BudgetCurrency(code: "CNY", symbol: "¥"),
        BudgetCurrency(code: "JPY", symbol: "¥")
    ]

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            BudgetCard(
                snapshot: .sample,
                currencies: currencies,
                selection: $currency
            )
        }
    }
}
