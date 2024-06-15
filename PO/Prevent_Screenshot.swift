import SwiftUI
import Combine

class ScreenshotObserver: ObservableObject {
    @Published var isScreenshotDetected = false
    private var screenshotObserver: AnyCancellable?

    init() {
        startScreenshotObserver()
    }

    deinit {
        stopScreenshotObserver()
    }

    // 开始监听截屏事件
    private func startScreenshotObserver() {
        screenshotObserver = NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification)
            .sink { _ in
                withAnimation {
                    self.isScreenshotDetected = true
                }

                // 延迟 2 秒后移除黑色视图
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        self.isScreenshotDetected = false
                    }
                }
            }
    }

    // 停止监听截屏事件
    private func stopScreenshotObserver() {
        screenshotObserver?.cancel()
    }
}

struct TestView: View {
    @StateObject private var screenshotObserver = ScreenshotObserver()

    var body: some View {
        ZStack {
            // 你的主视图内容
            Text("Hello, World!")
                .padding()

            // 黑色视图
            if screenshotObserver.isScreenshotDetected {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                    .transition(.opacity)
                    .animation(.easeInOut)
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
