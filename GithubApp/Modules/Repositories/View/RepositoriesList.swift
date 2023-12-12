import SwiftUI

struct RepositoriesList: View {
    
    // MARK: Properties
    
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
