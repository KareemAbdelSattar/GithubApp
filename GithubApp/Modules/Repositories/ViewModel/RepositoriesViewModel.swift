import Foundation
import Combine


final class RepositoriesViewModel: ObservableObject {
    @Published var repositories: [Repository] = []
    @Published var isLoading = false
    @Published var search: String = ""
    private var subscriptions = Set<AnyCancellable>()
    
    
    init() {
        binding()
    }
    
    private func binding() {
        $search
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .sink { [weak self] search in
                guard let self, !search.isEmpty else { return }
            self.fetchRepositories(search: search)
        }.store(in: &subscriptions)
    }
    
    func fetchRepositories(search: String) {
        print("Search")
    }
}

