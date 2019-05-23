//
//  ImageTransitionAnimator.swift
//  Friends
//
//  Created by Jeremy Taylor on 5/23/19.
//  Copyright © 2019 Bytes-Random L.L.C. All rights reserved.
//

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    var fromImageView: UIImageView!
    var toImageView: UIImageView!
    
    var fromNameLabel: UILabel!
    var toNamelabel: UILabel!
    //var toBioLabel: UILabel!
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: .to),
            let toView = transitionContext.view(forKey: .to) else { return }
        
        let containerView = transitionContext.containerView
        
        toImageView.image = fromImageView.image
        toNamelabel.text = fromNameLabel.text
        
        
        let toViewEndFrame = transitionContext.finalFrame(for: toVC)
        transitionContext.containerView.addSubview(toView)
        toView.frame = toViewEndFrame
        toView.alpha = 0.0
        
        fromImageView.alpha = 0.0
        fromNameLabel.alpha = 0.0
        toImageView.alpha = 0.0
        toNamelabel.alpha = 0.0
        
        let startImageViewFrame = containerView.convert(fromImageView.bounds, from: fromImageView)
        let endImageViewFrame = containerView.convert(toImageView.bounds, from: toImageView)
        let startNameLabelFrame = containerView.convert(fromNameLabel.bounds, from: fromNameLabel)
        let endNameLabelFrame = containerView.convert(toNamelabel.bounds, from: toNamelabel)
        
        let animatedImageView = UIImageView(frame: startImageViewFrame)
        animatedImageView.image = fromImageView.image
        
        let animatedNameLabel = UILabel(frame: startNameLabelFrame)
        animatedNameLabel.text = fromNameLabel.text
        
        containerView.addSubview(animatedImageView)
        containerView.addSubview(animatedNameLabel)
        
        toView.layoutIfNeeded()
        let duration = transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {
            animatedImageView.bounds = endImageViewFrame
            animatedNameLabel.bounds = endNameLabelFrame
            // going to make the description label fade in
            toView.alpha = 1.0
        }) { (success) in
            self.fromImageView.alpha = 1.0
            self.fromNameLabel.alpha = 1.0
            self.toImageView.alpha = 1.0
            self.toNamelabel.alpha = 1.0
           animatedImageView.removeFromSuperview()
           animatedNameLabel.removeFromSuperview()
            
            
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
    }
}
