import SwiftUI

struct TransactionSuccessView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var artwork: ArtworkInfo
    var user: UserInfo

    var body: some View {
        VStack {
            HStack {
                Text("PO")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                    .padding(.leading)
                
                Spacer()
                
                HStack(spacing: 20) {
                    Image(systemName: "bell")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Image(systemName: "message")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .padding(.trailing)
            }
            .padding(.top, 40)
            .padding(.bottom, 20)
            .background(colorScheme == .dark ? Color.black : Color.white)
            
            Spacer()
            
            VStack(spacing: 10) {
                Text("Congratulations")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.green)
                
                Text("@\(user.userID)")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                
                if let profilePictureData = user.profilePictureData,
                   let uiImage = UIImage(data: profilePictureData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                } else {
                    Image(user.profile_picture_name) // 默认图片
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                }
                
                Text("You might like this")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                ZStack(alignment: .bottom) {
                    Color.green
                        .cornerRadius(30)
                        .frame(maxHeight: 370)
                    ZStack {
                        Color.white
                            .shadow(color: .black, radius: 100)
                            .cornerRadius(30)
                            .frame(maxWidth: 315, maxHeight: 600)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: -3)
                        
                        GridView(images: artwork.tags)
                            .padding(.horizontal, 20)
                    }.frame(maxWidth: 200, maxHeight: 900)
                }
            }
            .navigationBarBackButtonHidden(true) // 隐藏返回按钮
        }
    }
}

struct GridView: View {
    let images: [String] // 使用传递的图片名

    var body: some View {
        VStack(spacing: 15) {
            HStack(spacing: 15) {
                ForEach(images.prefix(2), id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            HStack(spacing: 15) {
                ForEach(images.suffix(2), id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
    }
}

struct TransactionSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleContact = Contact(phoneNumber: "1234567890", countryCode: "+1", country: "USA", email: "user@example.com")
        let sampleUser = UserInfo(name: "Test User", password: "password", profile_picture_name: "default_profile_pic", userID: "testuser", introduction: "Introduction", ownedPictures: [], picturesSelling: [], followers: 0, following: 0, joinedDate: Date(), soldedAmount: 0, about: About(audio: "", video: "", text: ""), picturesSwapping: [], favoriteTags: [], profilePictureData: nil, contact: sampleContact)
        let sampleArtwork = ArtworkInfo(imageName: "TestImage", owner: sampleUser, creator: sampleUser, artworkTitle: "Artwork Title", historyOfOwners: [], size: "Medium", dpi: 300, createdDate: Date(), tradeAvailable: true, swipeAvailable: true, passport: true, introduction: "Artwork Introduction", audioIntroduction: nil, tradeInfo: TradeInfo(currentPrice: "100", historyPrice: "80", historyOwner: "Previous Owner", tradeDate: Date(), historyTransactions: []), interestedInSwapping: [], interestedInBuying: [], tags: ["Test1", "pets related2", "Test3", "Test2"])
        
        TransactionSuccessView(artwork: sampleArtwork, user: sampleUser)
    }
}
