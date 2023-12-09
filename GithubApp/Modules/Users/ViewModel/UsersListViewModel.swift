import Foundation
import NetworkLayer
import Combine

protocol UsersListViewModelInput {
    var onAppear: PassthroughSubject<Void, Never> { get }
}

class UsersListViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = true
    var onAppear: PassthroughSubject<Void, Never> = PassthroughSubject()
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        binding()
    }
    
    private func binding() {
        onAppear.sink { [weak self] _ in
            guard let self else { return }
            Task() {
                await self.fetchUsers()
            }
        }.store(in: &subscriptions)
    }
    
    private func fetchUsers() async {
        do {
            let fetchedUsers: [User] = try await NT.request(UserNetworking())
                .validate()
                .decode()
            DispatchQueue.main.async {
                self.users = fetchedUsers
                self.isLoading = false
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension UsersListViewModel: UsersListViewModelInput {}
