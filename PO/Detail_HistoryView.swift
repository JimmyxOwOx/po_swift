import SwiftUI
struct HistoryDetailView: View {
    let historyTransactions: [(String, String, String, String)]

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Buy")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        Spacer()
                        Text("Sell")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                    }

                    ForEach(0..<historyTransactions.count, id: \.self) { index in
                        let transaction = historyTransactions[index]
                        let buyerPrice = transaction.0
                        let sellerPrice = transaction.1
                        let date = transaction.2
                        let buyerImage = transaction.3

                        HStack {
                            Image(buyerImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                .shadow(radius: 2)

                            VStack(alignment: .leading) {
                                HStack {
                                    Text(buyerPrice)
                                        .font(.title)
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text(sellerPrice)
                                        .font(.title)
                                        .fontWeight(.bold)
                                }
                                HStack {
                                    Text(date)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    Spacer()
                                    Text(date)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .padding()
            }
        }
    }
}
