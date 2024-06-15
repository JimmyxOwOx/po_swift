import SwiftUI

struct MainView: View {
    @Environment(\.colorScheme) var colorScheme
    var userInfo: UserInfo

    @State private var showDetailView: Bool = false
    @State private var selectedArtwork: ArtworkInfo?

    init(userInfo: UserInfo) {
        self.userInfo = userInfo
        UITabBar.appearance().isTranslucent = true // 确保标签栏背景为半透明
    }
    
    var body: some View {
            TabView {
                HomeView(userInfo: userInfo, showDetailView: $showDetailView, selectedArtwork: $selectedArtwork)
                    .tabItem {
                        Image(systemName: "house")
                    }
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                
                UploadView()
                    .tabItem {
                        Image(systemName: "plus")
                    }
                
                ExploreView()
                    .tabItem {
                        Image("PO")
                            .renderingMode(.template) // 确保图片可以着色
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                
                ProfileView(userInfo: userInfo)
                    .tabItem {
                        Image("Userpic")
                    }
            }
            .onAppear {
                updateTabBarAppearance()
            }
            .onChange(of: colorScheme) { _ in
                updateTabBarAppearance()
            }
            
            if let artwork = selectedArtwork, showDetailView {
                DetailView(artworkInfo: artwork, userInfo: userInfo)
                    .background(Color.white)
                    .transition(.move(edge: .trailing))
            }
        
    }
    
    private func updateTabBarAppearance() {
        let appearance = UITabBar.appearance()
        appearance.barTintColor = colorScheme == .dark ? UIColor.black : UIColor.white
        appearance.backgroundColor = colorScheme == .dark ? UIColor.black : UIColor.white
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(userInfo: sampleUsers[2])
    }
}
