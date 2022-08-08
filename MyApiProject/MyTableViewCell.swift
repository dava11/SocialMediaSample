//
//  MyTableViewCell.swift
//  MyApiProject
//
//  Created by David Khachidze on 31.07.2022.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var postLikes: UILabel!
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var postTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        myButton.setTitle("Развернуть", for: .normal)
        

        // Configure the view for the selected state
    }
    @IBAction func fullTextAction(_ sender: Any) {
        if postText.numberOfLines == 2 {
            myButton.setTitle("Свернуть", for:.normal)
            postText.numberOfLines = 0
        }else {
            myButton.setTitle("Развернуть", for: .normal)
            postText.numberOfLines = 2
        }
    }
    
}
