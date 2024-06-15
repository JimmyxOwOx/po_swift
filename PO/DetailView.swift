import SwiftUI

struct DetailView: View {
    let artworkInfo: ArtworkInfo
    let userInfo: UserInfo
    @Environment(\.presentationMode) var presentationMode

    @State private var selectedTab: String = "Details"
    @State private var isSwiped: Bool = false
    @State private var isButtonGreen: Bool = false
    @State private var navigateToEnterpriceView = false
    @State private var navigateToCreatorView = false
    @State private var username: String = "Example User"
    @State private var navigateToSwipeStartView = false

    var body: some View {
        NavigationView {
            
            ScrollView {
                VStack {
                    HStack {
                        Button(action: {
                            withAnimation {
                                presentationMode.wrappedValue.dismiss()
                            }
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.blue)
                                .padding()
                        }
                        Spacer()
                    }
                    .background(Color.clear)

                    HStack {
                        Text("PO")
                            .font(.system(size: 32))
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                            .padding([.leading, .top])
                        Spacer()
                    }
                    Image(artworkInfo.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                        .padding()
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(artworkInfo.artworkTitle)
                                .font(.headline)
                                .padding(.horizontal)
                            HStack {
                                Text("Created by")
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                NavigationLink(
                                    destination: ProfileView(userInfo: artworkInfo.creator),
                                    isActive: $navigateToCreatorView
                                ) {
                                    Text("@\(artworkInfo.creator.userID)")
                                        .font(.subheadline)
                                        .foregroundColor(.blue)
                                        .underline()
                                        .offset(x: -23)
                                        .onTapGesture {
                                            navigateToCreatorView = true
                                        }
                                        .padding(.horizontal, 4)
                                }
                            }
                        }
                        Spacer()
                    }
                    .padding(.horizontal)

                    HStack {
                        Image(artworkInfo.owner.profile_picture_name)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding()
                        VStack(alignment: .leading) {
                            Text(artworkInfo.owner.name.isEmpty ? "Default OwnerName" : artworkInfo.owner.name)
                                .font(.headline)
                                .foregroundColor(.blue)
                            Text("Current Owner")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    .padding(.horizontal)

                    HStack {
                        SwipeButton(isSwiped: $isSwiped, isButtonGreen: $isButtonGreen, artworkInfo: artworkInfo, username: $username, navigateToEnterpriceView: $navigateToEnterpriceView)
                        Spacer()
                        POButton(artworkInfo: artworkInfo, username: $username, navigateToSwipeStartView: $navigateToSwipeStartView)
                    }
                    .padding(.horizontal)

                    CustomPicker(selectedTab: $selectedTab)
                        .padding(.bottom)

                    VStack {
                        if selectedTab == "Details" {
                            DetailInfoView(artworkInfo: artworkInfo)
                        } else {
                            HistoryDetailView(historyTransactions: artworkInfo.tradeInfo.historyTransactions)
                        }
                    }
                    .padding(.bottom, 10)

                    NavigationLink(destination: EnterpriceView(artworkInfo: artworkInfo, userInfo: userInfo).navigationBarBackButtonHidden(true), isActive: $navigateToEnterpriceView) {
                        EmptyView()
                    }
                    
                    NavigationLink(destination: Swipe_StartView(artworkInfo: artworkInfo, userInfo: userInfo), isActive: $navigateToSwipeStartView) {
                        EmptyView()
                    }
                }
                .navigationBarHidden(true)
            }
            .onChange(of: isSwiped) { newValue in
                if newValue {
                    self.navigateToEnterpriceView = true
                }
            }
        }
    }
}

struct CustomPicker: View {
    @Binding var selectedTab: String

    var body: some View {
        HStack {
            PickerButton(title: "History", selectedTab: $selectedTab)
            Spacer()
            PickerButton(title: "Details", selectedTab: $selectedTab)
        }
        .padding(.horizontal)
    }
}

struct DetailInfoView: View {
    let artworkInfo: ArtworkInfo

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Current Owner: \(artworkInfo.owner.name)")
            Text("Size: \(artworkInfo.size)")
            Text("Resolution: \(artworkInfo.dpi) DPI")
            Text("Created by: \(artworkInfo.creator.name)")
            Text("Passport: Available")
        }
        .padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(artworkInfo: sampleArtworks[1], userInfo: sampleUsers[0])
    }
}
