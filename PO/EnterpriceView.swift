import SwiftUI

struct EnterpriceView: View {
    let artworkInfo: ArtworkInfo
    let userInfo: UserInfo

    @State private var offerPrice: String = ""
    @State private var showUsers: Bool = false
    @State private var offset: CGFloat = 0
    @State private var isTransferred: Bool = false
    @State private var navigateToSuccessView: Bool = false
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("PO")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding()
                Spacer()
                HStack(spacing: 20) {
                    Image(systemName: "bell.fill")
                        .foregroundColor(.gray)
                    Image(systemName: "message.fill")
                        .foregroundColor(.gray)
                }
                .padding()
            }

            Spacer()

            VStack {
                if isTransferred {
                    Text("Transferred")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                        .padding(.top, -130)
                    Image(artworkInfo.owner.profile_picture_name)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .padding(.top, -100)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                withAnimation {
                                    navigateToSuccessView = true
                                }
                            }
                        }
                } else {
                    Text("Enter your\noffer price")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .background(Circle().fill(Color.green).frame(width: 180, height: 180))
                        .foregroundColor(.white)
                        .padding(.top, -100)
                }
            }

            Spacer()

            ZStack {
                Color.green
                    .cornerRadius(30)
                    .frame(height: 420)

                VStack {
                    if !isTransferred {
                        Text(artworkInfo.artworkTitle.isEmpty ? "Default" : artworkInfo.artworkTitle)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        HStack {
                            Text("Created by ")
                                .foregroundColor(.white)
                            Text("@\(artworkInfo.creator.name)")
                                .foregroundColor(.blue)
                        }
                        .font(.subheadline)
                    } else {
                        VStack {
                            Text(artworkInfo.artworkTitle)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            HStack {
                                Text("Created by ")
                                    .foregroundColor(.white)
                                Text("@\(artworkInfo.creator.name)")
                                    .foregroundColor(.blue)
                            }
                            .font(.subheadline)

                            Image(userInfo.profile_picture_name)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 130, height: 130)
                                .clipShape(Circle())
                                .padding(.bottom, 10)

                            Text("You are the")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            Text("New owner")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                    }

                    HStack {
                        if !isTransferred {
                            Text("$")
                                .font(.system(size: 80))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            TextField("", text: $offerPrice)
                                .padding()
                                .background(Color.clear)
                                .foregroundColor(.white)
                                .font(.system(size: 80))
                                .keyboardType(.numberPad)
                                .toolbar {
                                    ToolbarItemGroup(placement: .keyboard) {
                                        Spacer()
                                        Button("Done") {
                                            hideKeyboard()
                                            withAnimation {
                                                showUsers = true
                                            }
                                        }
                                    }
                                }
                        }
                    }
                    .padding()
                    .background(Color.clear)

                    if showUsers && !isTransferred {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color.white)
                                .frame(height: 60)
                                .overlay(
                                    Text("> > >")
                                        .foregroundColor(.green)
                                        .padding()
                                )

                            HStack {
                                ZStack {
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 60, height: 60)
                                    Image(userInfo.profile_picture_name)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60)
                                        .clipShape(Circle())
                                }
                                .offset(x: offset)
                                .gesture(
                                    DragGesture()
                                        .onChanged { gesture in
                                            if gesture.translation.width >= 0 && gesture.translation.width <= 270 {
                                                self.offset = gesture.translation.width
                                            }
                                        }
                                        .onEnded { _ in
                                            withAnimation {
                                                if self.offset > 260 {
                                                    self.isTransferred = true
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                                        withAnimation {
                                                            navigateToSuccessView = true
                                                        }
                                                    }
                                                } else {
                                                    self.offset = 0
                                                }
                                            }
                                        }
                                )
                                .zIndex(1)

                                Spacer()

                                ZStack {
                                    Circle()
                                        .fill(Color.green)
                                        .frame(width: 60, height: 60)
                                    Image(artworkInfo.owner.profile_picture_name)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60)
                                        .clipShape(Circle())
                                }
                                .zIndex(0)
                            }
                        }
                        .padding()
                        .transition(.opacity)
                        .offset(y: -20)
                    }
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: 300)

        }
        .padding(.bottom, 90) // 向上移动内容以适应TabView
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
        .background(
            NavigationLink(
                destination: TransactionSuccessView(artwork: artworkInfo, user: userInfo),
                isActive: $navigateToSuccessView
            ) {
                EmptyView()
            }
        )
        .navigationBarHidden(true)
    }

    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    private func updateTabBarAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor.white
        UITabBar.appearance().standardAppearance = tabBarAppearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}

struct EnterpriceView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleContact = Contact(phoneNumber: "1234567890", countryCode: "+1", country: "USA", email: "user@example.com")
        let sampleUser = UserInfo(name: "Test User", password: "password", profile_picture_name: "default_profile_pic", userID: "testuser", introduction: "Introduction", ownedPictures: [], picturesSelling: [], followers: 0, following: 0, joinedDate: Date(), soldedAmount: 0, about: About(audio: "", video: "", text: ""), picturesSwapping: [], favoriteTags: [], profilePictureData: nil, contact: sampleContact)
        let sampleArtwork = ArtworkInfo(imageName: "TestImage", owner: sampleUser, creator: sampleUser, artworkTitle: "Artwork Title", historyOfOwners: [], size: "Medium", dpi: 300, createdDate: Date(), tradeAvailable: true, swipeAvailable: true, passport: true, introduction: "Artwork Introduction", audioIntroduction: nil, tradeInfo: TradeInfo(currentPrice: "100", historyPrice: "80", historyOwner: "Previous Owner", tradeDate: Date(), historyTransactions: []), interestedInSwapping: [], interestedInBuying: [], tags: ["Test1", "pets related2", "Test3", "Test2"])

        EnterpriceView(
            artworkInfo: sampleArtwork,
            userInfo: sampleUser
        )
    }
}
