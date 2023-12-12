import SwiftUI

struct UsersListView: View {
    
    // MARK: Properties
    
    let users: [User]
    
    var body: some View {
        List {
            ForEach(users, id: \.self) { user in
                ZStack(alignment:.leading) {
                    NavigationLink(destination: UserDetailsView(viewModel: UserDetailsViewModel(username: user.login))) { EmptyView() }.opacity(0.0)
                    UserRow(user: user)
                }
            }
        }
        .listStyle(.inset)
    }
}

#Preview {
    UsersListView(users: [User.userMock, User.userMock, User.userMock])
}
