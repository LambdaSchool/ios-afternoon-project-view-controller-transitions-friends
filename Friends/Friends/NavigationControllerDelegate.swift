//
//  NavigationControllerDelegate.swift
//  Friends
//
//  Created by Jonathan Ferrer on 5/23/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    let animator = ImageTransitionAnimator()
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        return animator
    }






        var sourceCell: UITableViewCell?
}
