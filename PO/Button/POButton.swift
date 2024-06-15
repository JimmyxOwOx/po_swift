import SwiftUI

struct POButton: View {
    let artworkInfo: ArtworkInfo
    @Binding var username: String
    @Binding var navigateToSwipeStartView: Bool

    var body: some View {
        Button(action: {
            navigateToSwipeStartView = true
            username = "Nelson Yang"
        }) {
            ZStack {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 60, height: 60)
                Text("PO")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
        }
        .padding(.horizontal)
    }
}
