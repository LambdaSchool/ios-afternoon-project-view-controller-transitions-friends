//
//  FriendDetailViewController.swift
//  Friends
//
//  Created by Kobe McKee on 5/23/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {

    var friend: Friend? {
        didSet {
            updateViews()
        }
    }
    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var bioTextView: UITextView!
    
    func updateViews() {
        guard isViewLoaded,
            let friend = friend,
            let image = UIImage(named: friend.imageName) else { return }
        
        nameLabel.text = friend.name
        friendImage.image = image
        bioTextView.text = friend.bio
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }


}
