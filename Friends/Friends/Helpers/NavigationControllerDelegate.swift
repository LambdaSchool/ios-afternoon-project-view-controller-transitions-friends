//
//  NavigationControllerDelegate.swift
//  Friends
//
//  Created by Michael Redig on 5/16/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {

//	var sourceCell: UITableViewCell? //renamed to tableCell cuz it can be source or dest

	let animator = ImageTransitionAnimator()

	func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {

		guard let dest = toVC as? ImageTransitionProtocol, let source = fromVC as? ImageTransitionProtocol else { return nil }
		dest.loadViewIfNeeded()

		animator.sourceImageView = source.transitionImageView
		animator.destImageView = dest.transitionImageView

		animator.sourceTextLabel = source.transitionLabel
		animator.destTextLabel = dest.transitionLabel

		return animator
	}
}
