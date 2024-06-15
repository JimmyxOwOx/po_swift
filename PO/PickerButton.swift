import SwiftUI
struct PickerButton: View {
    let title: String
    @Binding var selectedTab: String

    var body: some View {
        Button(action: {
            withAnimation {
                selectedTab = title
            }
        }) {
            Text(title)
                .font(.system(size: 24))
                .fontWeight(.bold)
                .foregroundColor(selectedTab == title ? Color.gray : Color.gray.opacity(0.5))
                .padding()
                .background(Color.clear)
        }
    }
}


struct PickerButton_black: View {
    let title: String
    @Binding var selectedTab: String

    var body: some View {
        Button(action: {
            withAnimation {
                selectedTab = title
            }
        }) {
            Text(title)
                .font(.system(size: 24))
                .fontWeight(.bold)
                .foregroundColor(selectedTab == title ? Color.black : Color.gray.opacity(0.5))
                .padding()
                .background(Color.clear)
        }
    }
}
