//
//  ViewController.swift
//  Friends
//
//  Created by Thomas Cacciatore on 5/30/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()

    }
    
    func updateViews() {
        guard let friend = friend else { return }
        detailImageView.image = friend.image
        detailNameLabel.text = friend.name
        detailTextView.text = friend.description
        
    }

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    
    var friend: Friend?
    var friendController: FriendController?
}

