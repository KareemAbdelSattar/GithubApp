//
//  RepositoriesList.swift
//  GithubApp
//
//  Created by Kareem Abd El Sattar on 11/12/2023.
//

import SwiftUI

struct RepositoriesList: View {
    @Binding var searchText: String
    let repositories: [Repository]
    
    var body: some View {
        List {
            ForEach(repositories, id: \.id) { repo in
                RepositoryRow(repo: repo)
            }
        }
    }
}

#Preview {
    RepositoriesList(searchText: .constant("Kareem"), repositories: [])
}
