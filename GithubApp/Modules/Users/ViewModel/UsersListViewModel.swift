import Foundation
import Combine

/**
 `UsersListViewModelInput` protocol defines the input requirements for the `UsersListViewModel`.
 It includes a `PassthroughSubject` named `onAppear` to notify the view model when it appears.
 */
protocol UsersListViewModelInput {
    var onAppear: PassthroughSubject<Void, Never> { get }
}

/**
 `UsersListViewModel` is responsible for managing the state of a list of users.
 It conforms to `ObservableObject` to allow for observation of state changes.
 */
class UsersListViewModel: ObservableObject {
    
    /// Published property representing the current state of the user list.
    @Published var state: ViewState<[User]> = .loading
    
    /// PassthroughSubject used to notify the view model when it appears.
    var onAppear: PassthroughSubject<Void, Never> = PassthroughSubject()
    
    /// Set to hold Combine subscriptions.
    private var subscriptions = Set<AnyCancellable>()
    
    private let userNetwork: UserNetworking
    
    /**
     Initializes a new instance of `UsersListViewModel` and sets up its bindings.
     */
    init(userNetwork: UserNetworking = DefaultUserNetworking()) {
        self.userNetwork = userNetwork
        binding()
    }
}

/**
 `UsersListViewModel` extension containing private handlers and methods.
 */
private extension UsersListViewModel {
    
    /**
     Sets up the bindings for the `onAppear` subject, triggering the fetchUsers method
     when the view model appears.
     */
    private func binding() {
        onAppear.sink { [weak self] _ in
            guard let self else { return }
            Task() {
                await self.fetchUsers()
            }
        }.store(in: &subscriptions)
    }
    
    /**
     Fetches the list of users asynchronously. It updates the view model's state accordingly.
     */
    private func fetchUsers() async {
        self.changeState(.loading)

        do {
            let fetchedUsers: [User] = try await userNetwork.fetchUsers()
            DispatchQueue.main.async {
                self.changeState(.loaded(fetchedUsers))
            }
        } catch {
            changeState(.error(error.localizedDescription))
        }
    }
    
    /**
     Updates the view model's state asynchronously.
     
     - Parameter state: The new state to be applied.
     */
    private func changeState(_ state: ViewState<[User]>) {
        DispatchQueue.main.async { [weak self] in
            self?.state = state
        }
    }
}

/**
 Extension to conform `UsersListViewModel` to `UsersListViewModelInput` protocol.
 */
extension UsersListViewModel: UsersListViewModelInput {}
