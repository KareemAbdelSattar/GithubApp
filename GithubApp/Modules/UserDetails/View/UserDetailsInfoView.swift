import SwiftUI

// MARK: UserDetailsInfoView

struct UserDetailsInfoView: View {
    
    // MARK: Properties

    let userDetails: UserDetails?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if let userDetails = userDetails {
                let user = User(login: userDetails.name ?? userDetails.login, id: userDetails.id, avatarURL: userDetails.avatarURL, type: userDetails.type)
                UserRow(user: user)
            }
            
            if let bio = userDetails?.bio {
                Text(bio)
            }
            
            DetailsSectionView(userDetails: userDetails)
        }
    }
}

#Preview {
    UserDetailsInfoView(userDetails: UserDetails.dummy)
}
