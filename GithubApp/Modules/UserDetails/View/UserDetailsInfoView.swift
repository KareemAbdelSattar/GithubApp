import SwiftUI

struct UserDetailsInfoView: View {
    let userDetails: UserDetails?

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if let userDetails = userDetails {
                UserRow(image: userDetails.avatarURL, name: userDetails.name ?? userDetails.login, type: userDetails.type.rawValue)
            }
            
            if let bio = userDetails?.bio {
                Text(bio)
            }
            
            DetailsSectionView(userDetails: userDetails)
            
            Spacer()
        }.padding()
    }
}

