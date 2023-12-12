import Foundation

struct User: Codable, Identifiable, Hashable {
    static let userMock = User(login: "kareem", id: 1, avatarURL: "", type: .user)

    let login: String
    let id: Int
    let avatarURL: String
    let type: `Type`
    
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case avatarURL = ""
        case type
    }
}

enum `Type`: String, Codable {
    case user = "User"
    case organization = "Organization"
}
