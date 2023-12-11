import NetworkLayer
import Foundation

extension URLRequestType {
    var baseURL: String {
        "https://api.github.com"
    }
    
    var bodyParameters: [String: Any] {
        [:]
    }
    
    var queryParameters: [String: String] {
        [:]
    }
    
    var headers: HTTPHeaders {
        .init([:])
    }
    
    var method: HTTPMethod {
        .GET
    }
}

extension URLRequestConvertible where Self: URLRequestType {
    func asURLRequest() throws -> URLRequest {
        guard let fullPath = URL(string: baseURL + endPoint) else {
            throw NetworkError.invalidURL

        }
        let urlComponents = URLComponents(url: fullPath, resolvingAgainstBaseURL: true)
        
        guard let url = urlComponents?.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers.dictionary
        
        return request
    }
}
