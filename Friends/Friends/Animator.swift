//
//  Animator.swift
//  Friends
//
//  Created by Kobe McKee on 5/23/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    var destinationImageView: UIImageView?
    var sourceImageView: UIImageView?
    var destinationNameLabel: UILabel?
    var sourceNameLabel: UILabel?
    
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toVC = transitionContext.viewController(forKey: .to),
            let toView = transitionContext.view(forKey: .to) else { return }
        
        
        guard let destinationImageView = destinationImageView,
            let destinationNameLabel = destinationNameLabel,
            let sourceImageView = sourceImageView,
            let sourceNameLabel = sourceNameLabel else { return }
        
        let containerView = transitionContext.containerView
        containerView.addSubview(toView)
        
        let toViewEndFrame = transitionContext.finalFrame(for: toVC)
        toView.frame = toViewEndFrame
        toView.alpha = 0
        
        toView.layoutIfNeeded()
        
        let transitionLabelInitialFrame = containerView.convert(sourceNameLabel.bounds, to: sourceNameLabel)
        let transitionImageInitialFrame = containerView.convert(sourceImageView.bounds, to: sourceImageView)
        
        let transitionLabelEndFrame = containerView.convert(destinationNameLabel.bounds, to: destinationNameLabel)
        let transitionImageEndFrame = containerView.convert(destinationImageView.bounds, to: destinationImageView)
        
        
        let transitioningLabel = UILabel(frame: transitionLabelInitialFrame)
        transitioningLabel.text = sourceNameLabel.text
        transitioningLabel.font = sourceNameLabel.font
        transitioningLabel.textColor = sourceNameLabel.textColor
        
        containerView.addSubview(transitioningLabel)
        
        
        let transitioningImage = UIImageView(frame: transitionImageInitialFrame)
        transitioningImage.image = sourceImageView.image
        
        containerView.addSubview(transitioningImage)
        
        
        let animationDuration = self.transitionDuration(using: transitionContext)
        
        sourceNameLabel.alpha = 0
        sourceImageView.alpha = 0
        
        destinationNameLabel.alpha = 0
        destinationImageView.alpha = 0
        
        
        UIView.animate(withDuration: animationDuration, animations: {
            
            toView.alpha = 1
            transitioningLabel.frame = transitionLabelEndFrame
            transitioningLabel.textColor = destinationNameLabel.textColor
            transitioningLabel.font = destinationNameLabel.font
            
            transitioningImage.frame = transitionImageEndFrame
            
        }) { (_) in
            
            transitioningLabel.removeFromSuperview()
            transitioningImage.removeFromSuperview()
            
            destinationImageView.alpha = 1
            destinationNameLabel.alpha = 1
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        
        }
        
    }
    
}
