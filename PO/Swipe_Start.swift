import SwiftUI

struct Swipe_StartView: View {
    let artworkInfo: ArtworkInfo
    let userInfo: UserInfo

    @State private var showUsers: Bool = true
    @State private var offset: CGFloat = 0
    @State private var isTransferred: Bool = false
    @State private var navigateToSuccessView: Bool = false
    @State private var showImage: Bool = false
    @State private var matchCircleSize: CGFloat = 160
    @State private var matchCircleOffset: CGFloat = 0
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        NavigationView {
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
                        Text("Congratulations!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                            .padding(.top, -20)
                        Image(artworkInfo.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    withAnimation {
                                        navigateToSuccessView = true
                                    }
                                }
                            }
                    } else {
                        ZStack {
                            if showImage {
                                Image(artworkInfo.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 400, height: 320)
                                    .clipShape(Rectangle())
                                    .overlay(
                                        Circle()
                                            .fill(Color.blue)
                                            .frame(width: matchCircleSize, height: matchCircleSize)
                                            .offset(y: matchCircleOffset)
                                            .clipped()
                                    )
                            }
                            Circle()
                                .fill(Color.blue)
                                .frame(width: matchCircleSize, height: matchCircleSize)
                                .offset(y: matchCircleOffset)
                            Text("Match!")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .offset(y: matchCircleOffset)
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        withAnimation {
                                            matchCircleOffset = -150
                                            matchCircleSize = 100
                                            showImage = true
                                        }
                                    }
                                }
                        }
                        .padding(.bottom, -40) // Adjust this value to fine-tune the overlap
                    }
                }

                Spacer()

                ZStack {
                    Color.blue
                        .cornerRadius(30)
                        .frame(height: 370)

                    VStack {
                        if !isTransferred {
                            VStack {
                                Text(artworkInfo.artworkTitle.isEmpty ? "Default" : artworkInfo.artworkTitle)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                HStack {
                                    Text("Created by ")
                                        .foregroundColor(.black)
                                    Text("@\(artworkInfo.creator.name)")
                                        .foregroundColor(.white)
                                }
                                .font(.subheadline)
                            }
                            .padding(.top, -100)
                        } else {
                            VStack {
                                Text("\(artworkInfo.artworkTitle)")
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

                                Image(artworkInfo.owner.profile_picture_name)
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

                        if showUsers && !isTransferred {
                            ZStack {
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color.white)
                                    .frame(height: 60)
                                    .overlay(
                                        Text("> > >")
                                            .foregroundColor(.blue)
                                            .padding()
                                    )

                                HStack {
                                    ZStack {
                                        Circle()
                                            .fill(Color.white)
                                            .frame(width: 60, height: 60)
                                        Image(artworkInfo.owner.profile_picture_name)
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
                                            .fill(Color.blue)
                                            .frame(width: 60, height: 60)
                                        Image("Owner_pic_2") // Assuming this is a placeholder for the next owner
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

                            Text("Slide to confirm Swap!")
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding(.top, 10)
                                .offset(y: -30)
                        }
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: 300)
            }
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
        .tabItem {
            Image(systemName: "square.grid.2x2.fill")
        }
        .onAppear {
            updateTabBarAppearance()
        }
        .onChange(of: colorScheme) { _ in
            updateTabBarAppearance()
        }
        .navigationBarBackButtonHidden(true)
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

struct Swipe_StartView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleContact = Contact(phoneNumber: "1234567890", countryCode: "+1", country: "USA", email: "user@example.com")
        let sampleUser = UserInfo(name: "Test User", password: "password", profile_picture_name: "default_profile_pic", userID: "testuser", introduction: "Introduction", ownedPictures: [], picturesSelling: [], followers: 0, following: 0, joinedDate: Date(), soldedAmount: 0, about: About(audio: "", video: "", text: ""), picturesSwapping: [], favoriteTags: [], profilePictureData: nil, contact: sampleContact)
        let sampleArtwork = ArtworkInfo(imageName: "TestImage", owner: sampleUser, creator: sampleUser, artworkTitle: "Artwork Title", historyOfOwners: [], size: "Medium", dpi: 300, createdDate: Date(), tradeAvailable: true, swipeAvailable: true, passport: true, introduction: "Artwork Introduction", audioIntroduction: nil, tradeInfo: TradeInfo(currentPrice: "100", historyPrice: "80", historyOwner: "Previous Owner", tradeDate: Date(), historyTransactions: []), interestedInSwapping: [], interestedInBuying: [], tags: ["sunset", "digital art"])

        Swipe_StartView(artworkInfo: sampleArtwork, userInfo: sampleUser)
    }
}
