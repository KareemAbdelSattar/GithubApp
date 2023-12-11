import NetworkLayer

struct RepositoriesNetworking: URLRequestType {
    private let searchText: String
    
    init(searchText: String) {
        self.searchText = searchText
    }
    
    var endPoint: String {
        "/search/repositories?q=\(searchText)"
    }
}
