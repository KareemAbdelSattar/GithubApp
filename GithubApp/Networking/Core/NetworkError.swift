import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidStatusCode(Int)
    case decodingFailed(String)
    case notFound
    case serverError
    case failure
}
