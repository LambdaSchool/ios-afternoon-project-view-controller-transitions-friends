//
//  ViewController.swift
//  Friends
//
//  Created by Michael Redig on 5/16/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController, ImageTransitionProtocol {

	var transitionLabel: UILabel?
	var transitionImageView: UIImageView?

	var friends: [Friend] = []
	let networkHandler = NetworkHandler()

	let navigationControllerDelegate = NavigationControllerDelegate()

	override func viewDidLoad() {
		super.viewDidLoad()
		setupFriends()

		navigationController?.delegate = navigationControllerDelegate
	}

	func setupFriends() {
		friends = [
					Friend(name: "Rachel Green", imageURL: "https://upload.wikimedia.org/wikipedia/en/0/0a/Rachel_Green_Rachel_haircut.jpg", bio: "Likes to shop. Wasn't on a break."),
					Friend(name: "Monica Geller", imageURL: "https://i.pinimg.com/originals/ba/c4/35/bac435688f1410bb2b93770d2e5642e1.jpg", bio: "Obsessive compulsive cleaner. Likes to cook and Chandler."),
					Friend(name: "Phoebe Buffay", imageURL: "https://i.pinimg.com/originals/70/ba/36/70ba3603733c38c8ad3d830bb052d228.jpg", bio: "Free spirit."),
					Friend(name: "Joey Tribbiani", imageURL: "https://imgix.bustle.com/uploads/image/2018/8/30/540599ec-b13a-428c-8075-6f15bda099d6-joey-tribbianni-best-pickup-lines.png?w=1020&h=574&fit=crop&crop=faces&auto=format&q=70", bio: "Eats a lot of food and a bad actor. Not the brightest bulb."),
					Friend(name: "Chandler Bing", imageURL: "https://qph.fs.quoracdn.net/main-qimg-04c5c51425b0ec2c73d862204ecd0ed2", bio: "The funny one. Married Monica."),
					Friend(name: "Ross Geller", imageURL: "https://images.mid-day.com/images/2018/oct/ross_d.jpg", bio: "Monica's older brother. Was on a break.")
				   ]
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let dest = segue.destination as? FriendDetailViewController {
			dest.networkHandler = networkHandler
			guard let indexPath = tableView.indexPathForSelectedRow else { return }
			//maybe call load if needed here
			dest.friend = friends[indexPath.row]

			let cell = tableView.cellForRow(at: indexPath)
			transitionLabel = cell?.textLabel
			transitionImageView = cell?.imageView

//			navigationControllerDelegate.sourceCell = cell
		}
	}
}

// MARK: - table view stuff
extension FriendsTableViewController {
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return friends.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

		guard let friendCell = cell as? FriendTableViewCell else { return cell }
		friendCell.networkHandler = networkHandler
		friendCell.friend = friends[indexPath.row]

		return friendCell
	}
}

