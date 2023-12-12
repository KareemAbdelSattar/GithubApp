import Foundation

protocol UserDetailsNetworking {
    func fetchUserDetails() async throws -> UserDetails
}

struct DefaultUserDetailsNetworking: UserDetailsNetworking, URLRequestType {
    private let networkService: NetworkService
    private let username: String
    
    init(username: String, networkService: NetworkService = .shared) {
        self.networkService = networkService
        self.username = username
    }
    
    var endPoint: String {
        "/users/\(username)"
    }
    
    func fetchUserDetails() async throws -> UserDetails {
        try await networkService.request(self)
    }
}
