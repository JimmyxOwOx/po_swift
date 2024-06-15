import SwiftUI
import PhotosUI

struct UploadView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    var body: some View {
        VStack {
            // 如果有選擇圖片，顯示圖片
            if let selectedImageData,
               let uiImage = UIImage(data: selectedImageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .padding()
            } else {
                // 提示用戶選擇圖片
                Text("請選擇圖片")
                    .foregroundColor(.gray)
                    .padding()
            }
            
            // 上傳按鈕
            if #available(iOS 17.0, *) {
                PhotosPicker(selection: $selectedItem, matching: .images) {
                    Text("選擇圖片")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .onChange(of: selectedItem) { newValue in
                    Task {
                        if let data = try? await newValue?.loadTransferable(type: Data.self) {
                            selectedImageData = data
                        }
                    }
                }
            } else {
                // Fallback on earlier versions
            }
            
            Spacer()
        }
        .navigationTitle("Upload")
        .padding()
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
