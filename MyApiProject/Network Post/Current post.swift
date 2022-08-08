//
//  Current post.swift
//  MyApiProject
//
//  Created by David Khachidze on 29.07.2022.
//

import Foundation

// MARK: - Post
struct Post: Codable {
    let post: PostClass
}

// MARK: - PostClass
struct PostClass: Codable {
    let postID, timeshamp: Int
    let title, text: String
    let postImage: String
    let likesCount: Int

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case timeshamp, title, text, postImage
        case likesCount = "likes_count"
    }
}
