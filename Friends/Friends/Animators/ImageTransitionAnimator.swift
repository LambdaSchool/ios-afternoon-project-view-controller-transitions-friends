//
//  ImageTransitionAnimator.swift
//  Friends
//
//  Created by Jeffrey Carpenter on 5/16/19.
//  Copyright © 2019 Jeffrey Carpenter. All rights reserved.
//

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var destinationImageView: UIImageView?
    var sourceImageView: UIImageView?
    var sourceNameLabel: UILabel?
    var destinationNameLabel: UILabel?

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toVC = transitionContext.viewController(forKey: .to) else {
            NSLog("Error getting toVC")
            return
        }
        
        guard let toView = transitionContext.view(forKey: .to) else {
            NSLog("Error getting toView")
            return
        }
        
        guard let destinationImageView = destinationImageView,
        let sourceImageView = sourceImageView,
        let sourceNameLabel = sourceNameLabel,
            let destinationNameLabel = destinationNameLabel else {
                NSLog("Source or Destination name Label or Image View is nil")
                return
        }

        let containerView = transitionContext.containerView
        
        let toViewEndFrame = transitionContext.finalFrame(for: toVC)
        
        containerView.addSubview(toView)
        toView.frame = toViewEndFrame
        toView.alpha = 0
        
        destinationNameLabel.alpha = 0
        destinationImageView.alpha = 0
        sourceImageView.alpha = 0
        sourceNameLabel.alpha = 0
        
        let transitionLabelInitialFrame = containerView.convert(sourceNameLabel.bounds, from: sourceNameLabel)
        let transitionImageInitialFrame = containerView.convert(sourceImageView.bounds, from: sourceImageView)
        
        let transitioningLabel = UILabel(frame: transitionLabelInitialFrame)
        transitioningLabel.textColor = .black
        transitioningLabel.font = sourceNameLabel.font
        transitioningLabel.text = sourceNameLabel.text
        containerView.addSubview(transitioningLabel)
        
        let transitioningImage = UIImageView(frame: transitionImageInitialFrame)
        transitioningImage.image = sourceImageView.image
        containerView.addSubview(transitioningImage)
        
        let transitionDuration = self.transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: transitionDuration, animations: {
            let transitioningLabelEndFrame = containerView.convert(destinationNameLabel.bounds, from: destinationNameLabel)
            transitioningLabel.frame = transitioningLabelEndFrame
            let transitioningImageEndFrame = containerView.convert(destinationImageView.bounds, from: destinationImageView)
            transitioningImage.frame = transitioningImageEndFrame
            toView.alpha = 1
        }) { _ in
            destinationNameLabel.alpha = 1
            destinationImageView.alpha = 1
            sourceNameLabel.alpha = 1
            sourceImageView.alpha = 1
            transitioningImage.removeFromSuperview()
            transitioningLabel.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
