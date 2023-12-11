import Foundation
import NetworkLayer

struct UserNetworking: URLRequestType {
    var endPoint: String {
        "/users"
    }
}


struct UserDetailsNetworking: URLRequestType {
    private let username: String
    
    init(username: String) {
        self.username = username
    }
    
    var endPoint: String {
        "/users/\(username)"
    }
}
