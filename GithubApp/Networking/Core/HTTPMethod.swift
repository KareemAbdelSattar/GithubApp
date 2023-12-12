import Foundation
struct HTTPMethod: RawRepresentable, Hashable, Equatable {
    
    static let GET = HTTPMethod(rawValue: "GET")
    
    static let POST = HTTPMethod(rawValue: "POST")
    
    static let DELETE = HTTPMethod(rawValue: "DELETE")
    
    static let PUT = HTTPMethod(rawValue: "PUT")
    
    let rawValue: String
    
    init(rawValue: String) {
        self.rawValue = rawValue
    }
}
