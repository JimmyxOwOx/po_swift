import SwiftUI


struct SignupView: View {
    @State private var email: String = ""
    @State private var fullName: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var phoneNumber: String = ""
    @State private var countryCode: String = ""
    @State private var country: String = ""
    @State private var profilePictureData: Data? = nil // 新增的用户头像数据

    @State private var emailError: String = ""
    @State private var fullNameError: String = ""
    @State private var usernameError: String = ""
    @State private var passwordError: String = ""
    @State private var confirmPasswordError: String = ""
    @State private var phoneNumberError: String = ""
    @State private var countryCodeError: String = ""
    @State private var countryError: String = ""
    
    @State private var navigateToProfile = false
    @State private var newUser: UserInfo? = nil
    
    var isFormValid: Bool {
        return email.contains(".com") &&
               !fullName.isEmpty &&
               !username.isEmpty &&
               !password.isEmpty &&
               password == confirmPassword &&
               !phoneNumber.isEmpty &&
               !countryCode.isEmpty &&
               !country.isEmpty &&
               emailError.isEmpty &&
               fullNameError.isEmpty &&
               usernameError.isEmpty &&
               passwordError.isEmpty &&
               confirmPasswordError.isEmpty &&
               phoneNumberError.isEmpty &&
               countryCodeError.isEmpty &&
               countryError.isEmpty
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("PO")
                .font(.system(size: 64))
                .fontWeight(.bold)
                .foregroundColor(.blue)
            Text("CREATE YOUR WORTH.")
                .font(.title2)
                .foregroundColor(.blue)
            
            VStack(spacing: 15) {
                TextField("Full Name", text: $fullName)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .onChange(of: fullName) { newValue in
                        fullNameError = newValue.isEmpty ? "Full Name Cannot be Empty" : ""
                    }
                if !fullNameError.isEmpty {
                    Text(fullNameError).foregroundColor(.red).font(.caption)
                }
                
                TextField("Email", text: $email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .onChange(of: email) { newValue in
                        emailError = newValue.contains(".com") ? "" : "Incorrect Email Form"
                    }
                if !emailError.isEmpty {
                    Text(emailError).foregroundColor(.red).font(.caption)
                }
                
                TextField("User Account", text: $username)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .onChange(of: username) { newValue in
                        usernameError = newValue.isEmpty ? "User Account Cannot be Empty" : ""
                    }
                if !usernameError.isEmpty {
                    Text(usernameError).foregroundColor(.red).font(.caption)
                }
                
                TextField("Phone Number", text: $phoneNumber)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .keyboardType(.phonePad)
                    .onChange(of: phoneNumber) { newValue in
                        phoneNumberError = newValue.isEmpty ? "Phone Number Cannot be Empty" : ""
                    }
                if !phoneNumberError.isEmpty {
                    Text(phoneNumberError).foregroundColor(.red).font(.caption)
                }
                
                TextField("Country Code", text: $countryCode)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .onChange(of: countryCode) { newValue in
                        countryCodeError = newValue.isEmpty ? "Country Code Cannot be Empty" : ""
                    }
                if !countryCodeError.isEmpty {
                    Text(countryCodeError).foregroundColor(.red).font(.caption)
                }
                
                TextField("Country", text: $country)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .onChange(of: country) { newValue in
                        countryError = newValue.isEmpty ? "Country Cannot be Empty" : ""
                    }
                if !countryError.isEmpty {
                    Text(countryError).foregroundColor(.red).font(.caption)
                }
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .onChange(of: password) { newValue in
                        passwordError = newValue.isEmpty ? "Password Cannot be Empty" : ""
                    }
                if !passwordError.isEmpty {
                    Text(passwordError).foregroundColor(.red).font(.caption)
                }
                
                SecureField("Confirm Password", text: $confirmPassword)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .onChange(of: confirmPassword) { newValue in
                        confirmPasswordError = newValue == password ? "" : "Passwords do not match"
                    }
                if !confirmPasswordError.isEmpty {
                    Text(confirmPasswordError).foregroundColor(.red).font(.caption)
                }
                
                NavigationLink(
                    destination: SignUp_Profile(userInfo: newUser ?? defaultUser),
                    isActive: $navigateToProfile
                ) {
                    EmptyView()
                }
                
                Button(action: createUser) {
                    Text("Next")
                        .font(.title2)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(isFormValid ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(!isFormValid)
            }
            .padding()
            
            Spacer()
            
            Button(action: {
                // 處理Google註冊邏輯
            }) {
                HStack {
                    Image(systemName: "globe")
                    Text("Sign up with Google")
                }
                .font(.title2)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
            
            Button(action: {
                // 處理Apple註冊邏輯
            }) {
                HStack {
                    Image(systemName: "applelogo")
                    Text("Sign up with Apple")
                }
                .font(.title2)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
        }
        .padding()
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func createUser() {
        let contact = Contact(
            phoneNumber: phoneNumber,
            countryCode: countryCode,
            country: country,
            email: email
        )
        
        let user = UserInfo(
            name: fullName,
            password: password,
            profile_picture_name: "default_profile_pic", // 你可以使用默认的头像图片名称
            userID: username,
            introduction: "",
            ownedPictures: [],
            picturesSelling: [],
            followers: 0,
            following: 0,
            joinedDate: Date(),
            soldedAmount: 0,
            about: About(audio: "", video: "", text: ""),
            picturesSwapping: [],
            favoriteTags: [],
            profilePictureData: profilePictureData, // 新增字段：用户头像数据
            contact: contact
        )
        
        newUser = user
        navigateToProfile = true
        
        // 这里你可以把新创建的用户保存到你需要的地方，比如一个用户数组，或者发送到服务器等
        print("User created: \(user)")
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}

// 默认用户，用于预览和初始化
let defaultUser = UserInfo(
    name: "",
    password: "",
    profile_picture_name: "",
    userID: "",
    introduction: "",
    ownedPictures: [],
    picturesSelling: [],
    followers: 0,
    following: 0,
    joinedDate: Date(),
    soldedAmount: 0,
    about: About(audio: "", video: "", text: ""),
    picturesSwapping: [],
    favoriteTags: [],
    profilePictureData: nil, // 默认情况下设置为 nil
    contact: Contact(phoneNumber: "", countryCode: "", country: "", email: "")
)
