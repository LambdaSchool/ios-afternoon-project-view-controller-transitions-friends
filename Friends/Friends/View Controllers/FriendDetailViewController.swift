//
//  FriendDetailViewController.swift
//  Friends
//
//  Created by Michael Redig on 5/16/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController, ImageTransitionProtocol {

	var transitionImageView: UIImageView? {
		get {
			return friendImageView
		}
	}
	var transitionLabel: UILabel? {
		get {
			return friendNameLabel
		}
	}

	@IBOutlet var friendNameLabel: UILabel!
	@IBOutlet var friendImageView: UIImageView!
	@IBOutlet var friendBio: UITextView!
	@IBOutlet var panGestureRecognizer: UIPanGestureRecognizer!
	private var interactionController: UIPercentDrivenInteractiveTransition?

	var networkHandler: NetworkHandler?
	var friend: Friend? {
		didSet {
			updateViews()
		}
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		updateViews()
//		guard let navDelegate = navigationController?.delegate as? NavigationControllerDelegate else { return }
//		navDelegate.interactionController = interactionController
	}


	@IBAction func pan(_ sender: UIPanGestureRecognizer) {
		switch sender.state {
		case .began:
			guard let navDelegate = navigationController?.delegate as? NavigationControllerDelegate else { return }
			interactionController = UIPercentDrivenInteractiveTransition()
			navDelegate.interactionController = interactionController
			navigationController?.popViewController(animated: true)
		case .changed:
			let translation = sender.translation(in: view)
			let percentageComplete = abs(translation.x / view.bounds.width)
			interactionController?.update(percentageComplete)
		case .ended:
			let velocity = sender.velocity(in: view).x
			if velocity > 100 {
				interactionController?.finish()
			} else {
				interactionController?.cancel()
			}
		default:
			break
		}
	}

	private func updateViews() {
		guard let friend = friend, isViewLoaded else { return }
		friendNameLabel.text = friend.name
		friendBio.text = friend.bio

		friendImageView.widthAnchor.constraint(equalTo: friendImageView.heightAnchor, multiplier: 1).isActive = true
		friendImageView.contentMode = .scaleAspectFit

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

extension FriendDetailViewController: UIViewControllerTransitioningDelegate {
	func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
		return interactionController
	}
}
