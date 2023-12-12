import Foundation

struct DecodingHelper {
    static func decode<T: Decodable>(_ data: Data, to type: T.Type) throws -> T {
        do {
            let jsonDecoder = JSONDecoder()
            let decodedObject = try jsonDecoder.decode(type, from: data)
            return decodedObject
        } catch {
            throw NetworkError.decodingFailed(error.localizedDescription)
        }
    }
}
