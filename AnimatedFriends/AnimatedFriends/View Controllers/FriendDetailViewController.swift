//
//  FriendDetailViewController.swift
//  AnimatedFriends
//
//  Created by Lisa Sampson on 5/16/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {
    
    // MARK: - Properties and Outlets
    var friend: Friend?
    
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendJob: UILabel!
    @IBOutlet weak var friendImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    func updateViews() {
        guard let friend = friend else { return }
        
        title = friend.name
        friendName.text = friend.name
        friendJob.text = friend.job
        friendImage.image = friend.image
    }
}
