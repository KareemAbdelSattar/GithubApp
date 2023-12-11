import Foundation
import Combine
import NetworkLayer

final class RepositoriesViewModel: ObservableObject {
    @Published var search: String = ""
    @Published var state: ViewState<[Repository]> = .empty
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        binding()
    }
    
    private func binding() {
        $search
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .receive(on: DispatchQueue.main) // Receive updates on main thread
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
    
    private func fetchRepositories(search: String) async {
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
    
    private func changeState(_ state: ViewState<[Repository]>) {
        DispatchQueue.main.async { [weak self] in
            self?.state = state
        }
    }
}
