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

    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var FriendNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    func updateView() {
        guard let selectedFriend = friend else { return }
        
        friendImageView.image = selectedFriend.image
        FriendNameLabel.text = selectedFriend.name
        navigationItem.title = selectedFriend.name
    }
}
