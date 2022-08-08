//
//  ViewController.swift
//  MyApiProject
//
//  Created by David Khachidze on 28.07.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myTableView: UITableView!
    var postDataSource: [PostElement] = []
    var network = NetworkPost()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        network.getAllPosts { [weak self] post in
            guard let self = self else { return }
            self.postDataSource = post.posts
            DispatchQueue.main.async {
                self.myTableView.reloadData()
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
        self.myTableView.reloadData()
        
    }
    
}

