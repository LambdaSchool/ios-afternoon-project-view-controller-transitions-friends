//
//  NavigationControllerDelegate.swift
//  Friends
//
//  Created by Christopher Aronson on 5/16/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    var sourceCell: CellTableViewCell?
    let animator = ImageTransitionAnimator()
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        toVC.loadViewIfNeeded()
        
        print("Nave Delegate")
        if let destination = toVC as? FriendsDetailViewController, let cell = sourceCell {
            animator.destinationName = destination.nameLabel
            animator.destinationImage = destination.profilePictureImageView
            
            animator.sourceName = cell.nameLabel
            animator.sourceImage = cell.profilePictureImageView
        } else if let from = fromVC as? FriendsDetailViewController, let cell = sourceCell {
            animator.destinationName = cell.nameLabel
            animator.destinationImage = cell .profilePictureImageView
            
            animator.sourceName = from.nameLabel
            animator.sourceImage = from.profilePictureImageView
        } else {
            print("Could not cast")
        }
        
        return animator
    }

}
