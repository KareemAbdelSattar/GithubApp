import SwiftUI

// MARK: DetailsSectionView

struct DetailsSectionView: View {
    
    // MARK: Properties

    let userDetails: UserDetails?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let location = userDetails?.location {
                IconTitleView(image: "mappin.circle", title: location)
            }
            
            if let email = userDetails?.email {
                IconLinkView(image: "link", title: email)
                
                IconLinkView(image: "envelope", title: email)
            }
            
            
            if let company = userDetails?.company {
                IconTitleView(image: "cpu", title: company)
            }
            
            
            UserFollowersFollowingView(followersCount: userDetails?.followers ?? 0, followingCount: userDetails?.following ?? 0)
        }
    }
}

