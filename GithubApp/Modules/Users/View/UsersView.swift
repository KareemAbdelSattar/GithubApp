import SwiftUI


// MARK: - UsersView

struct UsersView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: UsersListViewModel
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .empty:
                EmptyView()
            case .loaded(let users):
                UsersListView(users: users)
            case .error(let error):
                ErrorView(title: error) {
                    viewModel.onAppear.send()
                }
            }
        }
        .onAppear(perform: {
            viewModel.onAppear.send()
        })
    }
}

#Preview {
    UsersView(viewModel: UsersListViewModel())
}
