import Foundation
import NetworkLayer
import Combine

protocol UserDetailsViewModelInput {
    var onAppear: PassthroughSubject<Void, Never> { get }
}

final class UserDetailsViewModel: ObservableObject {
    private let username: String
    @Published var isLoading = true
    @Published var userDetails: UserDetails?
    var onAppear: PassthroughSubject<Void, Never> = PassthroughSubject()
    private var subscriptions = Set<AnyCancellable>()
    
    init(username: String) {
        self.username = username
        binding()
    }
    
    private func binding() {
        onAppear.sink { [weak self] _ in
            guard let self else { return }
            Task() {
                await self.fetchUserDetails()
            }
        }.store(in: &subscriptions)
    }
    
    private func fetchUserDetails() async {
        do {
            let route = UserDetailsNetworking(username: username)
            let userDetails: UserDetails = try await NT.request(route)
                .validate()
                .decode()
            DispatchQueue.main.async {
                self.isLoading = false
                self.userDetails = userDetails
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension UserDetailsViewModel: UserDetailsViewModelInput {}
