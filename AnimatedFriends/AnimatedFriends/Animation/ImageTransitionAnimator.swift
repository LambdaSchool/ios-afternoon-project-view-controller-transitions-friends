//
//  ImageTransitionAnimator.swift
//  AnimatedFriends
//
//  Created by Lisa Sampson on 5/16/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    // MARK: - Properties
    var sourceImageView: UIImageView!
    var sourceNameLabel: UILabel!
    var destinationImageView: UIImageView!
    var destinationNameLabel: UILabel!
    
    // MARK: - Delegate Methods
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: .to) as? FriendDetailViewController,
            let toView = transitionContext.view(forKey: .to) else { return }
        
        let containerView = transitionContext.containerView
        
        let toViewEndFrame = transitionContext.finalFrame(for: toVC)
        containerView.addSubview(toView)
        toView.frame = toViewEndFrame
        toView.alpha = 0.0
        
        sourceNameLabel.alpha = 0.0
        sourceImageView.alpha = 0.0
        destinationNameLabel.alpha = 0.0
        destinationImageView.alpha = 0.0
        
        let labelIntialFrame = containerView.convert(sourceNameLabel.bounds, from: sourceNameLabel)
        let animatedNameLabel = UILabel(frame: labelIntialFrame)
        animatedNameLabel.text = sourceNameLabel.text
        animatedNameLabel.font = sourceNameLabel.font
        containerView.addSubview(animatedNameLabel)
        
        let imageInitialFrame = containerView.convert(sourceImageView.bounds, from: sourceImageView)
        let animatedImageView = UIImageView(frame: imageInitialFrame)
        animatedImageView.image = sourceImageView.image
        animatedImageView.contentMode = sourceImageView.contentMode
        containerView.addSubview(animatedImageView)
        
        let duration = transitionDuration(using: transitionContext)
        toView.layoutIfNeeded()
        UIView.animate(withDuration: duration, animations: {
            animatedNameLabel.frame = containerView.convert(self.destinationNameLabel.bounds, from: self.destinationNameLabel)
            
//            animatedNameLabel.font.
            
            animatedImageView.frame = containerView.convert(self.destinationImageView.bounds, from: self.destinationImageView)
//            animatedImageView.layoutIfNeeded()
//            animatedImageView.layer.cornerRadius = 100
            toView.alpha = 1.0
        }) { (_) in
            self.sourceNameLabel.alpha = 1.0
            self.sourceImageView.alpha = 1.0
            self.destinationNameLabel.alpha = 1.0
            self.destinationImageView.alpha = 1.0
            animatedNameLabel.removeFromSuperview()
            animatedImageView.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    

}
