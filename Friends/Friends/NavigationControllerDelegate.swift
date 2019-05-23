//
//  NavigationControllerDelegate.swift
//  Friends
//
//  Created by Jeremy Taylor on 5/23/19.
//  Copyright © 2019 Bytes-Random L.L.C. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    var imageTransitionAnimator = ImageTransitionAnimator()
    var sourceCell: UITableViewCell!
    var detailVC: FriendDetailViewController!
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let sourceCell = sourceCell as? FriendTableViewCell else { return nil }
        detailVC.loadViewIfNeeded()
        imageTransitionAnimator.fromImageView = sourceCell.friendImageView
        imageTransitionAnimator.fromNameLabel = sourceCell.friendNameLabel
        imageTransitionAnimator.toImageView = detailVC.friendImageView
        imageTransitionAnimator.toNamelabel = detailVC.friendNameLabel!
        //imageTransitionAnimator.toBioLabel = detailVC.friendBioLabel
        
        return imageTransitionAnimator
    }
}
