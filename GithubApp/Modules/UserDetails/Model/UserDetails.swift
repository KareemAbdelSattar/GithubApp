import Foundation

struct UserDetails: Codable, Identifiable, Hashable {
    let login: String
    let id: Int
    let avatarURL: String
    let type: `Type`
    let name: String?
    let company: String?
    let blog: String
    let location, email, bio: String?
    let twitterUsername: String?
    let publicRepos, publicGists, followers, following: Int
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
        case type
        case name, company, blog, location, email, bio
        case twitterUsername = "twitter_username"
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers, following
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
