import SwiftUI
import PhotosUI

struct SignUp_Profile: View {
    var userInfo: UserInfo
    @State private var selectedImage: UIImage? = nil
    @State private var bio: String = ""
    @State private var showImagePicker: Bool = false

    var body: some View {
        ZStack {
            // 透明背景，点击隐藏键盘
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture {
                    hideKeyboard()
                }

            VStack {
                if let selectedImage = selectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.width * 0.5)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 2)
                        .padding()
                        .onTapGesture {
                            showImagePicker = true
                        }
                } else {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.width * 0.5)
                        .overlay(
                            Image(systemName: "plus")
                                .foregroundColor(.gray)
                                .font(.system(size: 40))
                        )
                        .onTapGesture {
                            showImagePicker = true
                        }
                        .padding()
                }

                Text(userInfo.userID)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)

                TextEditor(text: $bio)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(40)
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.7)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .scrollContentBackground(.hidden)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") {
                                hideKeyboard()
                            }
                        }
                    }

                Spacer()

                NavigationLink(destination: SignUp_Intrest(userInfo: updatedUserInfo(), bio: bio)) {
                    Text("Let's go!")
                        .font(.title2)
                        .frame(width: UIScreen.main.bounds.width * 0.6, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }
                .padding()
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $selectedImage)
            }
        }
        .navigationBarHidden(true)
    }

    private func updatedUserInfo() -> UserInfo {
        var updatedUser = userInfo
        if let selectedImage = selectedImage {
            updatedUser.profilePictureData = selectedImage.jpegData(compressionQuality: 1.0)
        }
        return updatedUser
    }

    private func saveBioToFile(bio: String) {
        let fileManager = FileManager.default
        if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentDirectory.appendingPathComponent("bio.txt")
            do {
                try bio.write(to: fileURL, atomically: true, encoding: .utf8)
                print("Bio saved successfully.")
            } catch {
                print("Error saving bio: \(error)")
            }
        }
    }

    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            picker.dismiss(animated: true)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

struct SignUp_Profile_Previews: PreviewProvider {
    static var previews: some View {
        SignUp_Profile(userInfo:sampleUsers[2]/* UserInfo(
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
        )*/)
    }
}
