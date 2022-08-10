//
//  PostDetailsViewController.swift
//  MyApiProject
//
//  Created by David Khachidze on 31.07.2022.
//

import UIKit

class PostDetailsViewController: UIViewController {
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postTiyleLabel: UILabel!
    @IBOutlet weak var postDescriptionLabel: UILabel!
    @IBOutlet weak var postLikesLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    
    func loadData(by id: Int) {
        let some = NetworkManager()
        some.getPost(by: id) {[weak self] post in
            DispatchQueue.main.async {
                let date = Date(timeIntervalSince1970: TimeInterval(post.post.timeshamp)).formatted(date: .abbreviated, time: .shortened)
                self?.postDescriptionLabel.text = post.post.text
                self?.postTiyleLabel.text = post.post.title
                self?.postLikesLabel.text = "\(post.post.likesCount) 👍"
                self?.postDateLabel.text = date
                self?.postImageView.loadFrom(URLAddress: post.post.postImage)
            
            }
            
        }
        
    }
}
