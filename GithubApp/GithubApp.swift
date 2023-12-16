import SwiftUI

@main
struct GithubApp: App {
    @StateObject var languageSettings = LanguageSetting()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.locale, languageSettings.locale)
                .environment(\.layoutDirection, languageSettings.layoutDirection)
                .id(languageSettings.uuid)
                .environmentObject(languageSettings)
        }
    }
}
