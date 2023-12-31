import SwiftUI

/// The main view of the application, containing tabs for Users, Repositories, and Profile.
struct HomeView: View {
    @EnvironmentObject private var languageSettings: LanguageSetting

    var body: some View {
        TabView {
            // Users Tab
            NavigationView(content: {
                UsersView(viewModel: UsersListViewModel())
                    .navigationTitle("Users")
                    .navigationBarTitleDisplayMode(.large)
                    .toolbar {
                        Button(languageSettings.currentLanguage.description) {
                            let newLang: AppLanguage = AppLanguage(rawValue: languageSettings.localeIdentifier) == .english ? .arabic : .english
                            languageSettings.changeLanguage(newLang)
                        }
                    }
            })
            .tabItem {
                VStack {
                    Image(systemName: "person.2")
                    Text("Users")
                }
            }
            
            // Repositories Tab
            NavigationView(content: {
                let repositoriesNetworking = DefaultRepositoriesNetworking()
                let repositoriesViewModel = RepositoriesViewModel(repositoriesNetworking: repositoriesNetworking)
                RepositoriesView(viewModel: repositoriesViewModel)
                    .navigationTitle("Repositories")
                
            })
            .tabItem {
                VStack {
                    Image(systemName: "book.pages")
                    Text("Repo")
                }
            }
            
            // Profile Tab
            NavigationView(content: {
                let userDetailsNetworking = DefaultUserDetailsNetworking(username: "kareemabdelsattar")
                let userDetailsViewModel = UserDetailsViewModel(userDetailsNetworking: userDetailsNetworking)
                UserDetailsView(viewModel: userDetailsViewModel)
                    .navigationTitle("Kareem Abd El Sattar")
                    .navigationBarTitleDisplayMode(.large)
            })
            .tabItem {
                VStack {
                    Image(systemName: "person")
                    Text("Profile")
                }
            }
        }
        .accentColor(.purple) // Set the accent color for the tabs
    }
}

#Preview {
    @StateObject var languageSettings = LanguageSetting()
   return HomeView()
        .environmentObject(languageSettings)
}
