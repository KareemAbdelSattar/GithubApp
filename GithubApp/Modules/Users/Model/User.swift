import Foundation

struct User: Codable, Identifiable, Hashable {
    let login: String
    let id: Int
    let avatarURL: String
    let type: `Type`
    
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case avatarURL = "avatar_url"
        case type
    }
}

enum `Type`: String, Codable {
    case user = "User"
    case organization = "Organization"
}
