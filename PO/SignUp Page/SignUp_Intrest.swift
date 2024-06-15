import SwiftUI

struct SignUp_Intrest: View {
    var userInfo: UserInfo
    var bio: String // 从上一个视图传递过来的用户简介
    @State private var selectedInterests: [String] = []

    var interests = ["Art", "Music", "Technology", "Sports", "Travel", "Food"]

    var body: some View {
        VStack(spacing: 20) {
            Text("Select Your Interests")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top)

            Text("Help us tailor content for you by selecting your interests.")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            ScrollView {
                VStack(spacing: 15) {
                    ForEach(interests, id: \.self) { interest in
                        InterestButton(interest: interest, isSelected: selectedInterests.contains(interest)) {
                            if selectedInterests.contains(interest) {
                                selectedInterests.removeAll { $0 == interest }
                            } else {
                                selectedInterests.append(interest)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)

            Spacer()

            NavigationLink(destination: MainView(userInfo: updatedUserInfo())) {
                Text("Let's go!")
                    .font(.title2)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
        

    private func updatedUserInfo() -> UserInfo {
        var updatedUser = userInfo
        updatedUser.introduction = bio
        updatedUser.favoriteTags = selectedInterests
        return updatedUser
    }
}

struct InterestButton: View {
    let interest: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(interest)
                .font(.title3)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(isSelected ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(isSelected ? .white : .black)
                .cornerRadius(10)
        }
    }
}

struct SignUp_Intrest_Previews: PreviewProvider {
    static var previews: some View {
        SignUp_Intrest(userInfo: sampleUsers[2]/*UserInfo(
            name: "Nelsonphyang",
            profile_picture_name: "Test2",
            userID: "nelsonphyang",
            email: "nelsonphyang@example.com",
            introduction: "我是楊博華尼爾森\n一名插畫家\n歡迎與我互動！",
            ownedPictures: ["Test1", "Test2"],
            picturesSelling: [],
            followers: 1000,
            following: 100,
            joinedDate: Date(),
            soldedAmount: 120,
            about: About(audio: "", video: "", text: ""),
            picturesSwapping: [],
            favoriteTags: [],
            profilePictureData: nil
        )*/, bio: "我是楊博華尼爾森，一名插畫家")
    }
}
