//
//  FriendDetailViewController.swift
//  Friends
//
//  Created by Michael Redig on 5/16/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {

	@IBOutlet var friendNameLabel: UILabel!
	@IBOutlet var friendImageView: UIImageView!
	@IBOutlet var friendBio: UITextView!

	var networkHandler: NetworkHandler?
	var friend: Friend? {
		didSet {
			updateViews()
		}
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		updateViews()
	}

	private func updateViews() {
		guard let friend = friend, isViewLoaded else { return }
		friendNameLabel.text = friend.name
		friendBio.text = friend.bio

		guard let url = URL(string: friend.imageURL) else { return }
		let request = URLRequest(url: url)
		networkHandler?.transferMahDatas(with: request, completion: { [weak self] (result: Result<Data, NetworkError>) in
			do {
				let data = try result.get()
				guard let image = UIImage(data: data) else { return }
				DispatchQueue.main.async {
					self?.friendImageView.image = image
				}
			} catch {
				print(error)
			}
		})
	}
}
