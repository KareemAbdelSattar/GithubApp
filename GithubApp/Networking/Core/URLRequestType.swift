import Foundation

protocol URLRequestType {
    var baseURL: String { get }
    var endPoint: String { get }
    var method: HTTPMethod { get }
}

extension URLRequestType {
    var baseURL: String {
        "https://api.github.com"
    }
    
    var method: HTTPMethod {
        .GET
    }
}
