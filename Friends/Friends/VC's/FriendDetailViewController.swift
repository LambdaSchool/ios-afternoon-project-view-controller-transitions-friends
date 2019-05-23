//
//  FriendDetailViewController.swift
//  Friends
//
//  Created by Jonathan Ferrer on 5/23/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupView()
    }

    func setupView() {
        guard let friend = friend else { return }
        friendImageView.image = friend.image
        nameLabel.text = friend.name
        jobLabel.text = friend.job
        navigationItem.title = friend.name
    
    }
    
    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    var friendController: FriendController?
    var friend: Friend?
    
}
