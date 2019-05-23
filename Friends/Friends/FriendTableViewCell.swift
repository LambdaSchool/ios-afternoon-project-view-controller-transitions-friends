//
//  FriendTableViewCell.swift
//  Friends
//
//  Created by Kobe McKee on 5/23/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
 
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
