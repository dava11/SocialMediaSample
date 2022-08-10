//
//  postData.swift
//  MyApiProject
//
//  Created by David Khachidze on 29.07.2022.
//

import Foundation

struct Posts: Codable {
    let posts: [PostElement]
}

// MARK: - PostElement
struct PostElement: Codable {
    let postID, timeshamp: Int
    let title, previewText: String
    let likesCount: Int

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case timeshamp, title
        case previewText = "preview_text"
        case likesCount = "likes_count"
    }
}
