import SwiftUI

struct HomeView: View {
    let userInfo: UserInfo
    @Binding var showDetailView: Bool
    @Binding var selectedArtwork: ArtworkInfo?

    @State private var lastContentOffset: CGFloat = 0
    @State private var isScrollingDown: Bool = true
    @State private var atTop: Bool = true
    @State private var debugMessage: String = ""

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        NavigationView {
            ScrollViewReader { scrollViewProxy in
                ZStack(alignment: .top) {
                    ScrollView {
                        VStack(spacing: 20) {
                            GeometryReader { geometry in
                                Color.clear
                                    .preference(key: ViewOffsetKey.self, value: geometry.frame(in: .global).minY)
                            }
                            .frame(height: 30)

                            ForEach(Category.allCases, id: \.self) { category in
                                VStack(alignment: .leading) {
                                    Text(category.rawValue)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .padding(.horizontal)
                                    
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 15) {
                                            let filteredArtworks = sampleArtworks.filter { artwork in
                                                category.match(artwork.imageName)
                                            }
                                            
                                            if (filteredArtworks.isEmpty) {
                                                Text("No artworks found for \(category.rawValue)")
                                                    .foregroundColor(.red)
                                                    .padding()
                                            } else {
                                                ForEach(filteredArtworks, id: \.id) { artworkInfo in
                                                    NavigationLink(
                                                        destination: DetailView(artworkInfo: artworkInfo, userInfo: userInfo)
                                                            .navigationBarBackButtonHidden(true) // 隐藏返回按钮
                                                    ) {
                                                        Image(artworkInfo.imageName)
                                                            .resizable()
                                                            .scaledToFill()
                                                            .frame(width: 200, height: 300)
                                                            .clipped()
                                                            .cornerRadius(10)
                                                            .contentShape(Rectangle()) // 确保整个图片可点击
                                                    }
                                                }
                                            }
                                        }
                                        .padding(.horizontal)
                                    }
                                }
                            }
                        }
                    }

                    if isScrollingDown || atTop {
                        HStack {
                            Text("PO")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color.blue)
                                .padding(.leading)
                            
                            Spacer()
                            
                            HStack(spacing: 10) {  // 将间距设置为10
                                Image(systemName: "bell")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .padding(.trailing)
                                Image(systemName: "message")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            .padding()
                        }
                        .background(colorScheme == .dark ? Color.black : Color.white)
                    }
                }
                .onPreferenceChange(ViewOffsetKey.self) { value in
                    withAnimation {
                        isScrollingDown = value > lastContentOffset
                        atTop = value >= 0 // 更新为更准确的条件
                    }
                    lastContentOffset = value
                }
            }
            .navigationTitle("PO")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true) // 隐藏返回按钮
            .overlay(Text(debugMessage).foregroundColor(.red).padding(), alignment: .bottom)
        }
    }
}

struct ViewOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

enum Category: String, CaseIterable {
    case CreatorsTopPicks = "Creators Top Picks"
    case PetsRelated = "Pets related"
    case AnotherCategory = "Another Category"
    
    func match(_ imageName: String) -> Bool {
        switch self {
        case .CreatorsTopPicks:
            return ["Main 1", "Main 2", "Main 3", "Main 4"].contains(imageName)
        case .PetsRelated:
            return ["Main 5", "Main 6", "Main 7", "Main 8"].contains(imageName)
        case .AnotherCategory:
            return ["Main 9", "Main 10", "Main 11", "Main 12"].contains(imageName)
        }
    }
}
