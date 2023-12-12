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

    /// The username for which the user details are fetched.
    private let username: String
    
    /// Published property representing the state of the user details view.
    @Published var state: ViewState<UserDetails?> = .loading
    
    /// Subject to trigger actions when the view appears.
    var onAppear: PassthroughSubject<Void, Never> = PassthroughSubject()
    
    /// Set of Combine subscriptions to manage the lifetime of observers.
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: Initializer
    
    /// Initializes the view model and sets up the necessary bindings.
    /// - Parameter username: The username for which user details are fetched.
    init(username: String) {
        self.username = username
        binding()
    }
    
    // MARK: Private Methods
    
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
            let route = UserDetailsNetworking(username: username)
            let userDetails: UserDetails = try await NT.request(route)
                .validate()
                .decode()
            // Update on the main thread
            DispatchQueue.main.async {
                self.state = .loaded(userDetails)
            }
        } catch {
            self.state = .error(error.localizedDescription)
        }
    }
}

// MARK: - UserDetailsViewModelInput

extension UserDetailsViewModel: UserDetailsViewModelInput {}
