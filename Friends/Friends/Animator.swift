//
//  Animator.swift
//  Friends
//
//  Created by Kobe McKee on 5/23/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    
    
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.75
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        
        guard let fromVC = transitionContext.viewController(forKey: .from) as? FriendTableViewCell,
            let toVC = transitionContext.viewController(forKey: .to) as? FriendDetailViewController,
            let toView = transitionContext.view(forKey: .to) else { return }
        
        let fromLabel = fromVC.nameLabel!
        let fromImage = fromVC.friendImage!
        let toLabel = toVC.nameLabel!
        let toImage = toVC.imageView!
        
        
    }
    
    
    
    
    
    
    
}
