import SwiftUI

struct UserDetailsView: View {
    @ObservedObject var viewModel: UserDetailsViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            UserDetailsInfoView(userDetails: viewModel.userDetails)
                .padding()
            
            ProfileStatsList(userDetails: viewModel.userDetails)
        }
        .background(Color(.systemGray6))
        .onAppear(perform: {
            viewModel.onAppear.send()
        })
        
    }
}

#Preview {
    UserDetailsView(viewModel: UserDetailsViewModel(username: "username"))
}
