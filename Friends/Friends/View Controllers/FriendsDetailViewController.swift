//
//  FriendsDetailViewController.swift
//  Friends
//
//  Created by Christopher Aronson on 5/16/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import UIKit

class FriendsDetailViewController: UIViewController, UIViewControllerTransitioningDelegate {
    var friend: Friend?

    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let selectedFriend = friend else { return }
        profilePictureImageView.image = selectedFriend.image
        nameLabel.text = selectedFriend.name
        titleLabel.text = selectedFriend.title
    }
}
