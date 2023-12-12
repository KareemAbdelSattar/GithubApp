import Foundation
import Combine

/// View model responsible for managing the state and data related to repositories.
final class RepositoriesViewModel: ObservableObject {
    
    // MARK: Properties
    
    /// Published property for tracking the search text input.
    @Published var search: String = ""
    
    /// Published property representing the state of the repositories view.
    @Published var state: ViewState<[Repository]> = .empty
    
    /// Set of Combine subscriptions to manage the lifetime of observers.
    private var subscriptions = Set<AnyCancellable>()
    
    private var repositoriesNetworking: RepositoriesNetworking
    
    // MARK: Initializer
    
    /// Initializes the view model and sets up the necessary bindings.
    init(repositoriesNetworking: RepositoriesNetworking) {
        self.repositoriesNetworking = repositoriesNetworking
        binding()
    }
}

// MARK: - Private Handlers

private extension RepositoriesViewModel {
    
    /// Sets up bindings for the view model.
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
    
    /// Fetches repositories based on the provided search text.
    func fetchRepositories(search: String) async {
        changeState(.loading)
        
        do {
            let response = try await repositoriesNetworking.fetchRepositories(search)
            
            // Update on the main thread
            self.changeState(.loaded(response.items))
        } catch {
            changeState(.empty)
        }
    }
    
    /// Updates the state property on the main thread.
    /// - Parameter state: The new state to be applied.
    func changeState(_ state: ViewState<[Repository]>) {
        DispatchQueue.main.async { [weak self] in
            self?.state = state
        }
    }
}
