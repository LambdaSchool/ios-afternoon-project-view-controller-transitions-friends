//
//  FriendDetailViewController.swift
//  Friends
//
//  Created by Jeffrey Carpenter on 5/16/19.
//  Copyright © 2019 Jeffrey Carpenter. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {
    
    var friend: Friend?

    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    private func updateViews() {
        
        guard let friend = friend else {
            NSLog("Unable to update views: friend is nil")
            return
        }
        
        friendImage.image = friend.image
        friendNameLabel.text = friend.name
        navigationItem.title = friend.name
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
