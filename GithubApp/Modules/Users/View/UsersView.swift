import SwiftUI


// MARK: - UsersView

struct UsersView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: UsersListViewModel
    
    var body: some View {
        NavigationView{
            VStack {
                switch viewModel.state {
                case .loading:
                    ProgressView()
                case .empty:
                    EmptyView()
                case .loaded(let users):
                    UsersListView(users: users)
                case .error(let error):
                    Text(error)
                }
            }
            .navigationTitle("Users")
            .navigationBarTitleDisplayMode(.large)
            .onAppear(perform: {
                viewModel.onAppear.send()
            })
        }
    }
}

#Preview {
    UsersView(viewModel: UsersListViewModel())
}
