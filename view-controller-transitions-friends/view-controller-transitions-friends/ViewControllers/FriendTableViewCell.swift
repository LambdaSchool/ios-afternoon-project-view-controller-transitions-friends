//
//  FriendTableViewCell.swift
//  view-controller-transitions-friends
//
//  Created by Hector Steven on 5/16/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

	@IBOutlet var friendImageView: UIImageView!
	@IBOutlet var nameLabel: UILabel!
	var friend: Friend?
}
