import SwiftUI

struct SwipeButton: View {
    @Binding var isSwiped: Bool
    @Binding var isButtonGreen: Bool
    let artworkInfo: ArtworkInfo
    @Binding var username: String
    @Binding var navigateToEnterpriceView: Bool
    @State private var offset: CGFloat = 0

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .stroke(artworkInfo.tradeAvailable ? (isButtonGreen ? Color.green : Color.blue) : Color.gray, lineWidth: 2)
                .background(Color.clear)
                .frame(height: 60)
                .overlay(
                    Text(artworkInfo.tradeAvailable ? (isButtonGreen ? "< < <" : "> > >") : "Unavailable")
                        .foregroundColor(artworkInfo.tradeAvailable ? (isButtonGreen ? .green : .blue) : .gray)
                        .padding()
                )

            HStack {
                ZStack {
                    Circle()
                        .fill(artworkInfo.tradeAvailable ? (isButtonGreen ? Color.green : Color.blue) : Color.gray)
                        .frame(width: 60, height: 60)
                    Text("Bank")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                .offset(x: offset)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            if artworkInfo.tradeAvailable && gesture.translation.width >= 0 && gesture.translation.width <= 170 {
                                self.offset = gesture.translation.width
                                self.isSwiped = self.offset > 160
                                self.isButtonGreen = self.offset > 85
                            }
                        }
                        .onEnded { _ in
                            withAnimation {
                                if self.offset > 100 {
                                    self.offset = 170
                                    self.isSwiped = true
                                    username = "Nelson Yang"
                                    navigateToEnterpriceView = true
                                } else {
                                    self.offset = 0
                                    self.isSwiped = false
                                }
                            }
                        }
                )
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}
