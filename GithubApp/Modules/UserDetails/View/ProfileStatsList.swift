import SwiftUI

// MARK: ProfileStatsList

struct ProfileStatsList: View {
    
    // MARK: Properties

    let userDetails: UserDetails?
    
    var body: some View {
        List {
            IconCountRow(image: "bookmark", title: "Repositories", count: userDetails?.publicRepos, color: Color(UIColor.darkGray))
            
            IconCountRow(image: "star", title: "Starred", count: userDetails?.publicRepos, color: .yellow)
            
            IconCountRow(image: "building.2", title: "Gists", count: userDetails?.publicGists, color: .orange)
        }
        .listStyle(.grouped)
        .scrollContentBackground(.hidden)
        .scrollDisabled(true)
    }
}

#Preview {
    ProfileStatsList(userDetails: UserDetails.dummy)
}

struct IconCountRow: View {
    let image: String
    let title: String
    let count: Int?
    let color: Color
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(color)
                
                Image(systemName: image)
                    .scaledToFit()
                    .foregroundColor(.white)

            }
            .frame(width: 30, height: 30)
            
            Text(title)
            
            Spacer()
            
            Text("\(count ?? 0)")
                .foregroundStyle(.secondary)
        }
    }
}
