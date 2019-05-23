//
//  FriendTableViewCell.swift
//  Friends
//
//  Created by Jeremy Taylor on 5/23/19.
//  Copyright © 2019 Bytes-Random L.L.C. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    var friend: Friend? {
        didSet {
            updateViews()
        }
    }

    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var friendNameLabel: UILabel!
    
    private func updateViews() {
        guard let friend = friend else { return }
        
        friendImageView.image = friend.image
        friendNameLabel.text = friend.name
    }
}
