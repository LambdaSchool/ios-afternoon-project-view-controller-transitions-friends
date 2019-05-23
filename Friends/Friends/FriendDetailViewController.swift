//
//  FriendDetailViewController.swift
//  Friends
//
//  Created by Jeremy Taylor on 5/23/19.
//  Copyright © 2019 Bytes-Random L.L.C. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {
    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var friendBioLabel: UILabel!
    
    var friend: Friend? {
        didSet {
            updateViews()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()

    }
    
    func updateViews() {
        guard let friend = friend, isViewLoaded else { return }
        
        title = friend.name
        friendImageView.image = friend.image
        friendNameLabel.text = friend.name
        friendBioLabel.text = friend.bio
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
