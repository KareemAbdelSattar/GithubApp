//
//  RepositoryRow.swift
//  GithubApp
//
//  Created by Kareem Abd El Sattar on 11/12/2023.
//

import SwiftUI

struct RepositoryRow: View {
    let repo: Repository

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            OwnerInfoView(avatarURL: repo.owner.avatarURL, fullName: repo.fullName)

            RepositoryInfoView(name: repo.name, description: repo.description)

            AdditionalInfoView(starCount: repo.size ?? 0, language: repo.language)
        }
    }
}

#Preview {
    RepositoryRow(repo: Repository.dummy)
}
