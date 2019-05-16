//
//  FriendTableViewCell.swift
//  AnimatedFriends
//
//  Created by Lisa Sampson on 5/16/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    // MARK: - Properties and Outlets
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendLabel: UILabel!
    
    var friend: Friend? {
        didSet {
            updateViews()
        }
    }
   
    // MARK: - View Loading
    func updateViews() {
        guard let friend = friend else { return }
        
        friendLabel.text = friend.name
        friendImage.image = friend.image
    }
}
