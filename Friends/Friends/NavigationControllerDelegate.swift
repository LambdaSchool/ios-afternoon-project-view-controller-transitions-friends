//
//  NavigationControllerDelegate.swift
//  Friends
//
//  Created by Mitchell Budge on 5/23/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
    
    let sourceCell = UITableViewCell()
}

