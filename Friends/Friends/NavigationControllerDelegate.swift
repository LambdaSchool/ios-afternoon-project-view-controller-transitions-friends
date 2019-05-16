//
//  NavigationControllerDelegate.swift
//  Friends
//
//  Created by Jeffrey Carpenter on 5/16/19.
//  Copyright © 2019 Jeffrey Carpenter. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    var sourceCell: UITableViewCell?
    let animator = ImageTransitionAnimator()
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if let toVC = toVC as? FriendDetailViewController,
            let sourceCell = sourceCell {
            
            animator.destinationImageView = toVC.friendImage
            animator.destinationNameLabel = toVC.friendNameLabel
            
            animator.sourceNameLabel = sourceCell.textLabel
            animator.sourceImageView = sourceCell.imageView
        } else {
            NSLog("Unable to cask fromVC and toVC to correct types")
        }
        
        return animator
    }

}
