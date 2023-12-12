import SwiftUI

// MARK: UserDetailsView

struct UserDetailsView: View {
    
    // MARK: Properties
    
    @ObservedObject var viewModel: UserDetailsViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .loaded(let userDetails):
                // Display user details and profile stats
                UserDetailsInfoView(userDetails: userDetails)
                    .padding()
                
                ProfileStatsList(userDetails: userDetails)
                    .navigationTitle(userDetails?.name ?? "")
                
            case .error(let error):
                // Show an error message if data fetching fails
                // TODO: - Add Error Screen
                Text(error)
            case .empty:
                // Handle the case when there is no data to display
                // TODO: - Handle Empty Case
                EmptyView()
            }
        }
        .onAppear(perform: {
            // Trigger the onAppear action in the view model when the view appears
            viewModel.onAppear.send()
        })
        
    }
}

#Preview {
    let userDetailsNetworking = DefaultUserDetailsNetworking(username: "kareem")
    let viewModel = UserDetailsViewModel(userDetailsNetworking: userDetailsNetworking)
    return UserDetailsView(viewModel: viewModel)
}
