//
//  RepositoriesView.swift
//  GithubApp
//
//  Created by Kareem Abd El Sattar on 11/12/2023.
//

import SwiftUI

struct RepositoriesView: View {
    @ObservedObject var viewModel: RepositoriesViewModel
    
    var body: some View {
        NavigationView {
            RepositoriesList(searchText: $viewModel.search)
        }
    }
}

#Preview {
    RepositoriesView(viewModel: RepositoriesViewModel())
}


struct RepositoriesList: View {
    @Binding var searchText: String
    
    
    var body: some View {
        List {
            RepositoryRow()
            RepositoryRow()
            RepositoryRow()
            
        }
        .listStyle(.inset)
        .searchable(text: $searchText)
        .navigationTitle("Repositories")
    }
}
