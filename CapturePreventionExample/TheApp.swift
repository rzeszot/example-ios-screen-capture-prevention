import SwiftUI

@main
struct TheApp: App {
  var body: some Scene {
    WindowGroup {
      ContentViewController()
        .ignoresSafeArea()
    }
  }
}
