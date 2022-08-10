//
//  jsonForm.swift
//  MyApiProject
//
//  Created by David Khachidze on 29.07.2022.
//

import Foundation


class NetworkManager {
    
    
    func getAllPosts(completion: @escaping(Posts) -> Void) {
        let urlString = "https://raw.githubusercontent.com/anton-natife/jsons/master/api/main.json"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    if let postData = try? decoder.decode(Posts.self, from: data) {
                        completion(postData)
                    }
                }
            }
        }
        task.resume()
    }
    func getPost(by id: Int, compelation: @escaping(Post) -> Void) {
        let urlString = "https://raw.githubusercontent.com/anton-natife/jsons/master/api/posts/\(id).json"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    if let postsData = try? decoder.decode(Post.self, from: data) {
                        compelation(postsData)
                    }
                       
                }
                
            }
        }
        task.resume()
    }
    
    
}
