//
//  Animator.swift
//  Friends
//
//  Created by Michael Stoffer on 6/13/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject {
    let animator = ImageTransitionAnimator()
    var sourceCell: UITableViewCell?
    var detailVC: FriendDetailViewController?
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        detailVC?.loadViewIfNeeded()
        
        return animator
    }
}

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    var fromImageView: UIImageView!
    var toImageView: UIImageView!
    var fromNameLabel: UILabel!
    var toNameLabel: UILabel!
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: .to) as? FriendDetailViewController,
            let toView = transitionContext.view(forKey: .to) else { return }
        
        let containerView = transitionContext.containerView
        
        let toViewEndFrame = transitionContext.finalFrame(for: toVC)
        
        containerView.addSubview(toView)
        toView.frame = toViewEndFrame
        toView.alpha = 0.0
        
        fromImageView.alpha = 0.0
        fromNameLabel.alpha = 0.0
        toImageView.alpha = 0.0
        toNameLabel.alpha = 0.0
        
        let transitioningImageViewInitialFrame = containerView.convert(fromImageView.bounds, from: fromImageView)
        let transitioningNameLabelInitialFrame = containerView.convert(fromNameLabel.bounds, from: fromNameLabel)
        
        let transitioningImageView = UIImageView(frame: transitioningImageViewInitialFrame)
        transitioningImageView.image = fromImageView.image
        
        let transitioningNameLabel = UILabel(frame: transitioningNameLabelInitialFrame)
        transitioningNameLabel.textColor = .black
        transitioningNameLabel.font = fromNameLabel.font
        transitioningNameLabel.text = fromNameLabel.text
        containerView.addSubview(transitioningNameLabel)
        
        let transistionDuration = self.transitionDuration(using: transitionContext)
        
        toView.layoutIfNeeded()
        
        UIView.animate(withDuration: transistionDuration, animations: {
            let transitioningImageViewEndFrame = containerView.convert(self.toImageView.bounds, from: self.toImageView)
            let transitioningNameLabelEndFrame = containerView.convert(self.toNameLabel.bounds, from: self.toNameLabel)
            transitioningImageView.frame = transitioningImageViewEndFrame
            transitioningNameLabel.frame = transitioningNameLabelEndFrame
            toView.alpha = 1.0
        }) { (_) in
            self.toImageView.alpha = 1.0
            self.toNameLabel.alpha = 1.0
            self.fromImageView.alpha = 1.0
            self.fromNameLabel.alpha = 1.0
            transitioningImageView.removeFromSuperview()
            transitioningNameLabel.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
