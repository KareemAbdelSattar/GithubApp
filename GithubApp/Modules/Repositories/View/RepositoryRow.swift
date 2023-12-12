import SwiftUI

struct RepositoryRow: View {
    
    // MARK: Properties

    let repo: Repository

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            OwnerInfoView(avatarURL: repo.owner.avatarURL, fullName: repo.fullName)

            RepositoryInfoView(name: repo.name, description: repo.description)

            AdditionalInfoView(starCount: repo.stargazersCount ?? 0, language: repo.language)
        }
    }
}

#Preview {
    RepositoryRow(repo: Repository.dummy)
}
