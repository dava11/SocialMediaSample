//
//  Extention.swift
//  MyApiProject
//
//  Created by David Khachidze on 28.07.2022.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = myTableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? MyTableViewCell{
            
            let post = postDataSource[indexPath.row]
            let date = Date(timeIntervalSince1970: TimeInterval(post.timeshamp)).formatted(date: .abbreviated, time: .shortened)
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
        let viewController = storyboard.instantiateViewController(withIdentifier: "mySecondViewController") as! mySecondViewController
        viewController.loadData(by: postDataSource[indexPath.row].postID)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}
