import Foundation
import NetworkLayer
import Combine

// MARK: - UserDetailsViewModelInput

/// Input protocol for `UserDetailsViewModel`.
protocol UserDetailsViewModelInput {
    var onAppear: PassthroughSubject<Void, Never> { get }
}

// MARK: - UserDetailsViewModel

/// View model responsible for managing the state and data related to user details.
final class UserDetailsViewModel: ObservableObject {
    
    // MARK: Properties
    
    /// Published property representing the state of the user details view.
    @Published var state: ViewState<UserDetails?> = .loading
    
    /// Subject to trigger actions when the view appears.
    var onAppear: PassthroughSubject<Void, Never> = PassthroughSubject()
    
    /// Set of Combine subscriptions to manage the lifetime of observers.
    private var subscriptions = Set<AnyCancellable>()
    private let userDetailsNetworking: UserDetailsNetworking
    
    // MARK: Initializer
    
    /// Initializes the view model and sets up the necessary bindings.
    /// - Parameter username: The username for which user details are fetched.
    init(userDetailsNetworking: UserDetailsNetworking) {
        self.userDetailsNetworking = userDetailsNetworking
        binding()
    }
    
    

}

// MARK: Private Handler

private extension UserDetailsViewModel {
    
    /// Sets up bindings for the view model.
    private func binding() {
        onAppear.sink { [weak self] _ in
            guard let self else { return }
            Task {
                await self.fetchUserDetails()
            }
        }.store(in: &subscriptions)
    }
    
    /// Fetches user details based on the stored username.
    private func fetchUserDetails() async {
        do {
            let userDetails = try await userDetailsNetworking.fetchUserDetails()
            // Update on the main thread
            DispatchQueue.main.async {
                self.changeState(.loaded(userDetails))
            }
        } catch {
            changeState(.error(error.localizedDescription))
        }
    }
    
    /// Updates the state property on the main thread.
    /// - Parameter state: The new state to be applied.
    func changeState(_ state: ViewState<UserDetails?>) {
        DispatchQueue.main.async { [weak self] in
            self?.state = state
        }
    }
}

// MARK: - UserDetailsViewModelInput

extension UserDetailsViewModel: UserDetailsViewModelInput {}
