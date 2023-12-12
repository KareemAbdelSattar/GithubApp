import SwiftUI

struct RepositoriesView: View {
    
    // MARK: Properties
    
    @ObservedObject var viewModel: RepositoriesViewModel
    
    var body: some View {
            VStack {
                switch viewModel.state {
                case .loading:
                    ProgressView()
                case .empty:
                    EmptySearchView(title: "Enter The Text To find Repositories", image: "magnifyingglass")
                case .loaded(let repositories):
                    RepositoriesList(searchText: $viewModel.search, repositories: repositories)
                case .error(let error):
                    Text(error)
                }
        }
            .listStyle(.inset)
            .searchable(text: $viewModel.search)
    }
}


#Preview {
    let repositoriesNetworking = DefaultRepositoriesNetworking()
    let viewModel = RepositoriesViewModel(repositoriesNetworking: repositoriesNetworking)
    return RepositoriesView(viewModel: viewModel)
}
