import SwiftUI

struct UserDetailsView: View {
    @ObservedObject var viewModel: UserDetailsViewModel
    
    var body: some View {
        HStack {
            UserDetailsInfoView(userDetails: viewModel.userDetails)
            
            Spacer()
        }.onAppear(perform: {
            viewModel.onAppear.send()
        })
    }
}

#Preview {
    UserDetailsView(viewModel: UserDetailsViewModel(username: "username"))
}
