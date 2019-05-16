//
//  NavigationControllerDelegate.swift
//  AnimatedFriends
//
//  Created by Lisa Sampson on 5/16/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    // MARK: - Properties
    var sourceCell: FriendTableViewCell!
    let animator = ImageTransitionAnimator()
    
    // MARK: - Delegate Methods
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        guard let toVC = toVC as? FriendDetailViewController else { return nil }
        toVC.loadViewIfNeeded()
        
        animator.sourceImageView = sourceCell.friendImage
        animator.sourceNameLabel = sourceCell.friendLabel
        animator.destinationImageView = toVC.friendImage
        animator.destinationNameLabel = toVC.friendName
        
        return animator
    }

}
