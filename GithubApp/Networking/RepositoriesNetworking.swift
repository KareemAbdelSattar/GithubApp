import Foundation

protocol RepositoriesNetworking {
    mutating func fetchRepositories(_ searchText: String) async throws -> RepositoryResponse
}

struct DefaultRepositoriesNetworking: RepositoriesNetworking, URLRequestType {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService = .shared) {
        self.networkService = networkService
    }
    
    var endPoint: String = "/search/repositories?q="
    
    mutating func fetchRepositories(_ searchText: String) async throws -> RepositoryResponse {
        endPoint = endPoint + searchText
        return try await networkService.request(self)
    }
}
