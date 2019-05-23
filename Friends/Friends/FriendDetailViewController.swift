//
//  FriendDetailViewController.swift
//  Friends
//
//  Created by Mitchell Budge on 5/23/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {

    var friends: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePictureView.image = UIImage(named: "Headshot")
        nameLabel.text = "Mitch"
        titleLabel.text = "iOS software development student"
    }
    @IBOutlet weak var profilePictureView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
