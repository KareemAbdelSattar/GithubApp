import SwiftUI

struct HomeView: View {
    
    var body: some View {
        TabView {
            NavigationView(content: {
                UsersView(viewModel: UsersListViewModel())
                    .navigationTitle("Users")
                    .navigationBarTitleDisplayMode(.large)
            })
            .tabItem {
                VStack {
                    Image(systemName: "person.2")
                    Text("Users")
                }
            }
            
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
        .accentColor(.purple)
    }
}

#Preview {
    HomeView()
}
