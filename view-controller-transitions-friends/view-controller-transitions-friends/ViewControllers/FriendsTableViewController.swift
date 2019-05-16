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
//		navigationController?.delegate = NavigationControllerDelegate
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return controller.friendList.count
	}
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
		
		guard let friendCell = cell as? FriendTableViewCell else { return cell }
		let friend = controller.friendList[indexPath.row]
		friendCell.friend = friend
		return friendCell
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		if segue.identifier == "DetailSegue" {
			guard let vc = segue.destination as? DetailViewController,
				let cell = sender as? FriendTableViewCell,
				let indexPath = tableView.indexPath(for: cell)	else { return }
			
			let friend = controller.friendList[indexPath.row]
			vc.friend = friend
			
		}
		
	}
	
	
	var controller = FriendController()
}
