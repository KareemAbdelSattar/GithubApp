import Foundation

class NetworkService {
    static let shared = NetworkService()
    
    private init() {}
    
    
    func request<T: Decodable>(_ request: URLRequestType) async throws -> T {
        guard let fullPath = URL(string: request.baseURL + request.endPoint) else {
            throw NetworkError.invalidURL
        }
        
        var urlRequest = URLRequest(url: fullPath)
        urlRequest.httpMethod = request.method.rawValue
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
        let urlResponse = response as? HTTPURLResponse
        try ResponseHelper.handle(urlResponse?.statusCode)
        
        let result = try DecodingHelper.decode(data, to: T.self)
        
        return result
    }

}
