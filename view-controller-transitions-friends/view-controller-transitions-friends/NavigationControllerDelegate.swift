//
//  NavigationControllerDelegate.swift
//  view-controller-transitions-friends
//
//  Created by Hector Steven on 5/16/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit



class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
	
	
	func navigationController(_ navigationController: UINavigationController,
							  animationControllerFor operation: UINavigationController.Operation,
							  from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		
		
		
		return animator
	}
	var animator = ImageTransitionAnimator()
	var sourceCell: FriendTableViewCell!
}
