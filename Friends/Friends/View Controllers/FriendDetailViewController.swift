//
//  FriendDetailViewController.swift
//  Friends
//
//  Created by Michael Stoffer on 6/13/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {
    
    // MARK: - IBOutlets and properties
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var bioTextView: UITextView!
    
    var friend: Friend? {
        didSet {
            self.updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateViews()
    }
    
    // MARK: - Methods
    
    private func updateViews() {
        guard let image = self.imageView,
            let name = self.nameLabel,
            let bio = self.bioTextView else { return }
        
        if let friend = self.friend {
            self.title = friend.name
            image.image = friend.image
            name.text = friend.name
            bio.text = friend.bio
        }
    }
}
