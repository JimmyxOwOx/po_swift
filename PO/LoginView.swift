import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var loginMessage: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var loggedInUser: UserInfo? = nil // 添加一个变量来存储已登录的用户信息

    var body: some View {
        if isLoggedIn, let userInfo = loggedInUser {
            MainView(userInfo: userInfo)
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
        } else {
            VStack(spacing: 20) {
                Text("PO")
                    .font(.system(size: 64))
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                Text("CREATE YOUR WORTH.")
                    .font(.title2)
                    .foregroundColor(.blue)
                
                VStack(spacing: 15) {
                    TextField("Username", text: $username)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    
                    Button(action: {
                        handleLogin()
                    }) {
                        Text("Log in")
                            .font(.title2)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    if !loginMessage.isEmpty {
                        Text(loginMessage)
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                }
                .padding()
                .navigationTitle("Login")
            }
            .padding()
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func handleLogin() {
        // 假設這裡的帳號和密碼都是 "123"
        if username == "123" && password == "123" {
            let userInfo = sampleUsers[0]/* UserInfo(
                name: "Test User",
                profile_picture_name: "default_profile_pic",
                userID: username,
                email: "\(username)@example.com",
                introduction: "This is a test user.",
                ownedPictures: [],
                picturesSelling: [],
                followers: 0,
                following: 0,
                joinedDate: Date(),
                soldedAmount: 0,
                about: About(audio: "", video: "", text: ""),
                picturesSwapping: [],
                favoriteTags: []
            )*/
            loggedInUser = userInfo
            isLoggedIn = true
        } else {
            loginMessage = "Invalid credentials"
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
