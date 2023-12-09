import Foundation
import NetworkLayer

struct UserNetworking: URLRequestType {
    var endPoint: String {
        "/users"
    }
}
