import SwiftUI

struct HomeView: View {
    
    var body: some View {
        TabView {
            UsersView(viewModel: UsersListViewModel())
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("Users")
                    }
                }
            
            let repositoriesNetworking = DefaultRepositoriesNetworking()
            let viewModel = RepositoriesViewModel(repositoriesNetworking: repositoriesNetworking)
            RepositoriesView(viewModel: viewModel)
                .tabItem {
                    VStack {
                        Image(systemName: "book.pages")
                        Text("Repo")
                    }
                }
            
            Text("Favorite")
                .tabItem {
                    VStack {
                        Image(systemName: "star")
                        Text("Favorite")
                        
                    }
                }
        }
        .accentColor(.purple)
    }
}

#Preview {
    HomeView()
}
