import Foundation

// MARK: - RepositoryResponse
struct RepositoryResponse: Codable {
    let totalCount: Int
    let items: [Repository]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}

// MARK: - Repository
struct Repository: Codable {
    static let dummy = Repository(id: 0,
                                  name: "Alamofire",
                                  fullName: "Kareem",
                                  description: "test test",
                                  fork: false,
                                  stargazersCount: 1,
                                  language: "",
                                  forksCount: 1,
                                  visibility: .visibilityPrivate,
                                  owner: Owner(login: "", avatarURL: "")
    )
    
    let id: Int
    let name, fullName: String?
    let description: String?
    let fork: Bool?
    let stargazersCount: Int?
    let language: String?
    let forksCount: Int?
    let visibility: Visibility?
    let owner: Owner
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case description, fork
        case stargazersCount = "stargazers_count"
        case language
        case forksCount = "forks_count"
        case visibility
        case owner
    }
}

enum Visibility: String, Codable {
    case visibilityPublic = "public"
    case visibilityPrivate = "private"
}

// MARK: - Owner
struct Owner: Codable {
    let login: String
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}
