import SwiftUI

struct ProfileView: View {
    let userInfo: UserInfo
    @State private var selectedTab = "Salon"

    var body: some View {
        VStack(spacing: 0) {
            // Header
            HeaderView()

            // User Profile
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    if let profilePictureData = userInfo.profilePictureData, let image = UIImage(data: profilePictureData) {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .padding(.top, 10)
                            .padding(.leading)
                    } else {
                        Image(userInfo.profile_picture_name)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .padding(.top, 10)
                            .padding(.leading)
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(userInfo.userID)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top, 10)

                        Text("Joined in \(formattedDate(userInfo.joinedDate))")
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        Text("Sold \(userInfo.soldedAmount)")
                            .font(.subheadline)
                            .foregroundColor(.blue)

                        Text(userInfo.introduction)
                            .font(.footnote) // 或使用 .font(.caption)
                            .padding(.top, 5)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.leading)
                }
                .padding(.trailing)
            }
            .padding(.bottom, 10)

            // Buttons
            HStack(spacing: 20) {
                Spacer(minLength: 10)
                Button(action: {}) {
                    Text("About")
                        .foregroundColor(.gray)
                        .padding(10)
                        .background(Color.clear)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
                Spacer(minLength: 10)
                Button(action: {}) {
                    Text("Follow")
                        .foregroundColor(.gray)
                        .padding(10)
                        .background(Color.clear)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }

                Button(action: {}) {
                    Text("Message")
                        .foregroundColor(.gray)
                        .padding(10)
                        .background(Color.clear)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
                Spacer()
            }
          //  .padding(.top, 10)
            .padding(.horizontal)

            // Picker Buttons
            HStack {
                PickerButton_black(title: "Salon", selectedTab: $selectedTab)
                PickerButton_black(title: "Swap", selectedTab: $selectedTab)
                PickerButton_black(title: "Sold", selectedTab: $selectedTab)
            }
            .padding()

            // Content based on selected tab
            VStack {
                if selectedTab == "Salon" {
                    Text("Salon Content")
                } else if selectedTab == "Swap" {
                    Text("Swap Content")
                } else if selectedTab == "Sold" {
                    Text("Sold Content")
                }
            }
            .frame(maxHeight: .infinity)
            .background(Color.white)
        }
        .background(Color.white)
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(userInfo: sampleUsers[5]/*UserInfo(
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
            favoriteTags: ["插畫", "數位藝術"], // 示例喜好标签
            profilePictureData: nil // 示例头像数据
        )*/)
    }
}
