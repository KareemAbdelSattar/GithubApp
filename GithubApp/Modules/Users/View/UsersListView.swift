import SwiftUI

struct UsersListView: View {
    @ObservedObject var viewModel: UsersListViewModel
    
    var body: some View {
        NavigationView{
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    List {
                        ForEach(viewModel.users, id: \.self) { user in
                            ZStack(alignment:.leading) {
                                NavigationLink(destination: UserDetailsView(viewModel: UserDetailsViewModel(username: user.login))) { EmptyView() }.opacity(0.0)
                                UserRow(image: user.avatarURL, name: user.login, type: user.type.rawValue)
                            }
                        }
                    }
                    .listStyle(.plain)
                    .navigationTitle("Users")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }.onAppear(perform: {
            viewModel.onAppear.send()
        })
    }
}

#Preview {
    UsersListView(viewModel: UsersListViewModel())
}