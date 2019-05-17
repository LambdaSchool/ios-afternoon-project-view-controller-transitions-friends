//
//  NavigationControllerDelegate.swift
//  Friends
//
//  Created by Christopher Aronson on 5/16/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    var sourceCell: UITableViewCell?
    let animator = ImageTransitionAnimator()
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        toVC.loadViewIfNeeded()
        
        if let destination = toVC as? FriendsDetailViewController, let cell = sourceCell {
            animator.destinationName = destination.FriendNameLabel
            animator.destinationImage = destination.friendImageView
            
            animator.sourceName = cell.textLabel
            animator.sourceImage = cell.imageView
        } else if let from = fromVC as? FriendsDetailViewController, let cell = sourceCell {
            animator.destinationName = cell.textLabel
            animator.destinationImage = cell.imageView
            
            animator.sourceName = from.FriendNameLabel
            animator.sourceImage = from.friendImageView
        } else {
            print("Could not cast")
        }
        
        return animator
    }

}
