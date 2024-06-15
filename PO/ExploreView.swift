import SwiftUI
import PhotosUI

struct ExploreView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @State private var similarImages: [UIImage] = []

    var body: some View {
        VStack {
            // 用戶選擇的圖片
            if let selectedImageData,
               let uiImage = UIImage(data: selectedImageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .padding()
            } else {
                Text("請選擇圖片")
                    .foregroundColor(.gray)
                    .padding()
            }
            
            // 上傳按鈕
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
                        // 模擬獲取類似風格的圖片
                        similarImages = getSimilarImages()
                    }
                }
            }
            
            // 類似風格的圖片
            if !similarImages.isEmpty {
                Text("類似風格的圖片")
                    .font(.headline)
                    .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(similarImages, id: \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding(5)
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .navigationTitle("Explore")
        .padding()
    }
    
    // 模擬獲取類似風格的圖片
    func getSimilarImages() -> [UIImage] {
        // 這裡使用假數據，實際應該從服務器或數據庫中獲取類似風格的圖片
        return [
            UIImage(named: "example1")!,
            UIImage(named: "example2")!,
            UIImage(named: "example3")!,
            UIImage(named: "example4")!
        ]
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
