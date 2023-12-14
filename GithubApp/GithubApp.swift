import SwiftUI

@main
struct GithubApp: App {
    @State var languageSettings = LanguageSetting()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.locale, languageSettings.locale)
                .environment(\.layoutDirection, languageSettings.layout)
                .id(languageSettings.uuid)
                .environment(languageSettings)
        }
    }
}
