//
//  User.swift
//  GHPro
//
//  Created by Swayam Rustagi on 18/07/24.
//

import Foundation

struct User: Codable{
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String
    var company: String
    var publicRepos: Int?
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var followers: Int
    var createdAt: String
}
