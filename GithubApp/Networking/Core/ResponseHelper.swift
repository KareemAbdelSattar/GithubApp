import Foundation

struct ResponseHelper {
    static func handle(_ response: Int?) throws {
        guard let response,
              Range(200...300).contains(response) else {
            throw NetworkError.invalidStatusCode(response ?? 0)
        }
    }
}
