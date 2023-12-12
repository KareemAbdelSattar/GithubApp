import Foundation
import Combine
import NetworkLayer

final class RepositoriesViewModel: ObservableObject {
    
    // MARK: Properties
    
    @Published var search: String = ""
    @Published var state: ViewState<[Repository]> = .empty
    
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: Initializer
    
    init() {
        binding()
    }
}

// MARK: - Private Handler

private extension RepositoriesViewModel {
    
    func binding() {
        $search
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .sink { [weak self] search in
                guard let self, !search.isEmpty else {
                    self?.changeState(.empty)
                    return
                }
                Task {
                    await self.fetchRepositories(search: search)
                }
            }
            .store(in: &subscriptions)
    }
    
    func fetchRepositories(search: String) async {
        changeState(.loading)
        
        do {
            let route = RepositoriesNetworking(searchText: search)
            let response: RepositoryResponse = try await NT.request(route)
                .validate()
                .decode()
            
            // Update on main thread
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                changeState(.loaded(response.items))
            }
        } catch {
            changeState(.empty)
        }
    }
    
    func changeState(_ state: ViewState<[Repository]>) {
        DispatchQueue.main.async { [weak self] in
            self?.state = state
        }
    }
}
