//
//  PostAPIResponse.swift
//  Instagram
//
//  Created by Usr_Prime on 30/05/22.
//

import Foundation

struct PostAPIResponse: Codable {
    let description: String?
    let urls: Urls
    let likes: Int
    let user: User
}

struct Urls: Codable {
    let full: String
    let regular: String
}

struct User: Codable {
    let username: String
    let name: String
    let first_name: String
    let last_name: String?
    let profile_image: ProfileImage
}

struct ProfileImage: Codable {
    let small: String
    let large: String
}
