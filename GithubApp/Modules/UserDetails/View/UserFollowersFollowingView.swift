import SwiftUI

struct UserFollowersFollowingView: View {
    let followersCount: Int
    let followingCount: Int
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "person")
                .foregroundStyle(.secondary)
            
            CountTitleView(count: "\(followersCount)", title: "followers")
            
            CountTitleView(count: "\(followingCount)", title: "following")
        }
    }
}

struct CountTitleView: View {
    let count: String
    let title: String
    
    var body: some View {
        HStack {
            Button(action: {
                // Handle button action
            }) {
                Text(count)
            }
            .foregroundStyle(.primary)
            
            Text(title)
                .foregroundStyle(.secondary)
        }
    }
}
