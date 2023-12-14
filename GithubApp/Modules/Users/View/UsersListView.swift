import SwiftUI

struct UsersListView: View {
    
    // MARK: Properties
    
    let users: [User]
    
    var body: some View {
        List {
            ForEach(users, id: \.self) { user in
                ZStack(alignment: .leading) {
                    let userDetailsNetworking = DefaultUserDetailsNetworking(username: user.login)
                    let viewModel = UserDetailsViewModel(userDetailsNetworking: userDetailsNetworking)
                    let userDetailsView = UserDetailsView(viewModel: viewModel)
                    
                    NavigationLink(destination: userDetailsView) { EmptyView() }.opacity(0.0)
                    
                    UserRow(user: user)
//                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .listStyle(.inset)
    }
}

#Preview {
    UsersListView(users: [User.userMock, User.userMock, User.userMock])
}
