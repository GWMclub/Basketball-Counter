import SwiftUI

@main
struct WatchApp: App {
    var counters = Counters()

    var body: some Scene {
        WindowGroup {
            TabView {
                MainView()
                    .environmentObject(counters)
                SettingsView()
                    .environmentObject(counters)
            }
        }
    }
}
