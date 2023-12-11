//
//  Repository.swift
//  GithubApp
//
//  Created by Kareem Abd El Sattar on 11/12/2023.
//

import Foundation

struct RepositoryResponse: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Repository]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

// MARK: - Item
struct Repository: Codable {
    static let dummy = Repository(id: 0, name: "Alamofire", fullName: "Kareem", itemPrivate: false, description: "test test", fork: false, homepage: "", size: 4, stargazersCount: 1, watchersCount: 8, language: "", forksCount: 1, openIssuesCount: 4, topics: [], visibility: .visibilityPrivate, forks: 4, openIssues: 5, watchers: 2, score: 1, owner: Owner(login: "", avatarURL: ""))
    
    let id: Int
    let name, fullName: String?
    let itemPrivate: Bool?
    let description: String?
    let fork: Bool?
    let homepage: String?
    let size, stargazersCount, watchersCount: Int?
    let language: String?
    let forksCount: Int?
    let openIssuesCount: Int?
    let topics: [String]?
    let visibility: Visibility?
    let forks, openIssues, watchers: Int?
//    let defaultBranch: DefaultBranch?
    let score: Int?
    let owner: Owner


    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case itemPrivate = "private"
        case description, fork
        case homepage, size
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case language
        case forksCount = "forks_count"
        case openIssuesCount = "open_issues_count"
        case topics, visibility, forks
        case openIssues = "open_issues"
        case watchers
        case score
        case owner
    }
}

enum DefaultBranch: String, Codable {
    case dev = "dev"
    case develop = "develop"
    case main = "main"
    case master = "master"
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
