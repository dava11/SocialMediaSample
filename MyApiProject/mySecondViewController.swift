//
//  mySecondViewController.swift
//  MyApiProject
//
//  Created by David Khachidze on 31.07.2022.
//

import UIKit

class mySecondViewController: UIViewController {
    
    @IBOutlet weak var mySecondImageView: UIImageView!
    @IBOutlet weak var someTitleInSVC: UILabel!
    @IBOutlet weak var someTextInSVC: UILabel!
    @IBOutlet weak var likesInSVC: UILabel!
    @IBOutlet weak var dateInSVC: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      
    }
    
    func loadData (by id: Int) {
        let some = NetworkPost()
        some.getPost(by: id) {[weak self] post in
            DispatchQueue.main.async {
                let date = Date(timeIntervalSince1970: TimeInterval(post.post.timeshamp)).formatted(date: .abbreviated, time: .shortened)
                self?.someTextInSVC.text = post.post.text
                self?.someTitleInSVC.text = post.post.title
                self?.likesInSVC.text = "\(post.post.likesCount) 👍"
                self?.dateInSVC.text = date
                self?.mySecondImageView.loadFrom(URLAddress: post.post.postImage)
            
            }
            
        }
        
    }
   

}
