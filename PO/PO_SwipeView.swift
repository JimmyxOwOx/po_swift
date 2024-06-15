import SwiftUI

struct PO_SwipeView: View {
    let artworkInfo: ArtworkInfo
    let userInfo: UserInfo
    @Environment(\.presentationMode) var presentationMode

    @State private var selectedTab: String = "Details"
    @State private var isSwiped: Bool = false
    @State private var isButtonGreen: Bool = false
    @State private var navigateToSwipeStartView = false
    @State private var username: String = "Example User"

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
                    
                    Text("\(artworkInfo.artworkTitle) - Created by \(artworkInfo.creator.name)")
                        .font(.headline)
                        .padding()
                    
                    Image(artworkInfo.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                        .padding()
                    
                    HStack {
                        Image(systemName: "person.circle")
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
                        SwipeButton(isSwiped: $isSwiped, isButtonGreen: $isButtonGreen, artworkInfo: artworkInfo, username: $username, navigateToEnterpriceView: $navigateToSwipeStartView)
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
                    
                    NavigationLink(destination: Swipe_StartView(artworkInfo: artworkInfo, userInfo: userInfo).navigationBarBackButtonHidden(true), isActive: $navigateToSwipeStartView) {
                        EmptyView()
                    }
                }
                .navigationBarHidden(true)
            }
            .onChange(of: isSwiped) { newValue in
                if newValue {
                    self.navigateToSwipeStartView = true
                }
            }
        }
    }
}

struct PO_SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleContact = Contact(phoneNumber: "1234567890", countryCode: "+1", country: "USA", email: "user@example.com")
        let sampleUser = UserInfo(name: "Test User", password: "password", profile_picture_name: "default_profile_pic", userID: "testuser", introduction: "Introduction", ownedPictures: [], picturesSelling: [], followers: 0, following: 0, joinedDate: Date(), soldedAmount: 0, about: About(audio: "", video: "", text: ""), picturesSwapping: [], favoriteTags: [], profilePictureData: nil, contact: sampleContact)
        let sampleArtwork = ArtworkInfo(imageName: "TestImage", owner: sampleUser, creator: sampleUser, artworkTitle: "Artwork Title", historyOfOwners: [], size: "Medium", dpi: 300, createdDate: Date(), tradeAvailable: true, swipeAvailable: true, passport: true, introduction: "Artwork Introduction", audioIntroduction: nil, tradeInfo: TradeInfo(currentPrice: "100", historyPrice: "80", historyOwner: "Previous Owner", tradeDate: Date(), historyTransactions: []), interestedInSwapping: [], interestedInBuying: [], tags: ["abstract", "digital", "landscape"])

        PO_SwipeView(artworkInfo: sampleArtwork, userInfo: sampleUser)
    }
}
