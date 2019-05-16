//
//  FriendsTableViewController.swift
//  view-controller-transitions-friends
//
//  Created by Hector Steven on 5/16/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
	override func viewDidLoad() {
        super.viewDidLoad()

	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return friendList.count
	}
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
		
		guard let friendCell = cell as? FriendTableViewCell else { return cell }
		let friend = friendList[indexPath.row]
		friendCell.friend = friend
		return friendCell
	}
	
	var friendList: [Friend] = []
}
