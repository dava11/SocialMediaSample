//
//  PostMainViewController.swift
//  MyApiProject
//
//  Created by David Khachidze on 28.07.2022.
//

import UIKit

class PostMainViewController: UIViewController {

    @IBOutlet weak var postTableView: UITableView!
    private var postDataSource: [PostElement] = []
    private var network = NetworkManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        network.getAllPosts { [weak self] post in
            guard let self = self else { return }
            self.postDataSource = post.posts
            DispatchQueue.main.async {
                self.postTableView.reloadData()
            }
        }
        
    }
    
   
    @IBAction func sortedAction(_ sender: Any) {
        let ac = UIAlertController(title: "Sort", message: "You want to sort by", preferredStyle: .alert)
        let sortAction = UIAlertAction(title: "likes", style: .default) { action in
             self.postDataSource.sort(by: { $0.likesCount > $1.likesCount })
        }
        ac.addAction(sortAction)
        self.present(ac, animated: true)
        self.postTableView.reloadData()
        
    }
}

extension PostMainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = postTableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? PostTableViewCell {
            
            let post = postDataSource[indexPath.row]
            let date = Date(timeIntervalSince1970: TimeInterval(post.timestamp)).formatted(date: .abbreviated, time: .shortened)
            cell.postLikes.text = "\(post.likesCount) 👍"
            cell.postDate.text = date
            cell.postText.text = post.previewText
            cell.postTitle.text = post.title
            
            
            return cell
        }
        
        return UITableViewCell()
        
        
  
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "mySecondViewController") as! PostDetailsViewController
        viewController.loadData(by: postDataSource[indexPath.row].postID)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

