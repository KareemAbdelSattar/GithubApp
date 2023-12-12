import Foundation

protocol UserNetworking {
    func fetchUsers() async throws -> [User]
}

struct DefaultUserNetworking: UserNetworking, URLRequestType {
    typealias T = [User]
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService = .shared) {
        self.networkService = networkService
    }
    
    var endPoint: String = "/users"
    
    func fetchUsers() async throws -> [User] {
        try await networkService.request(self)
    }
}
