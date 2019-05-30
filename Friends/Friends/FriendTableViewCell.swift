//
//  FriendTableViewCell.swift
//  Friends
//
//  Created by Thomas Cacciatore on 5/30/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    private func updateViews() {
        guard let friend = friend else { return }
        friendCellLabel.text = friend.name
        friendCellImage.image = friend.image
        
    }

    var friend: Friend? {
        didSet {
            updateViews()
        }
    }
    @IBOutlet weak var friendCellLabel: UILabel!
    @IBOutlet weak var friendCellImage: UIImageView!
    
}
