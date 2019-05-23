//
//  NavigationControllerDelegate.swift
//  Friends
//
//  Created by Kobe McKee on 5/23/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit


class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    var sourceCell: FriendTableViewCell?
    
    let animator = ImageTransitionAnimator()
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        toVC.loadViewIfNeeded()
        guard let sourceCell = sourceCell else { return animator }
        
        if let toVC = toVC as? FriendDetailViewController {
            
            animator.destinationImageView = toVC.friendImage
            animator.destinationNameLabel = toVC.nameLabel
            
            animator.sourceImageView = sourceCell.friendImage
            animator.sourceNameLabel = sourceCell.nameLabel
            
        } else if let fromVC = fromVC as? FriendDetailViewController {
            
            animator.destinationImageView = sourceCell.imageView
            animator.destinationNameLabel = sourceCell.nameLabel
            
            animator.sourceImageView = fromVC.friendImage
            animator.sourceNameLabel = fromVC.nameLabel
        }
        return animator
    }
    
    
    
}
