//
//  ImageTransitionAnimator.swift
//  Friends
//
//  Created by Christopher Aronson on 5/16/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    var sourceImage: UIImageView?
    var destinationImage: UIImageView?
    var sourceName: UILabel?
    var destinationName: UILabel?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toVC = transitionContext.viewController(forKey: .to) else {
            print("toVC")
            return
        }
        
        guard let toView = transitionContext.view(forKey: .to) else {
            print("toView")
            return
        }
        
        guard let destinationImage = destinationImage,
        let destinationName = destinationName,
        let sourceImage = sourceImage,
        let sourceName = sourceName
        else {
            print("labels/image views = nil")
            return
        }
        
        let containerView = transitionContext.containerView
        
        let toViewEndFrame = transitionContext.finalFrame(for: toVC)
        
        containerView.addSubview(toView)
        toView.frame = toViewEndFrame
        toView.alpha = 0
        
        destinationName.alpha = 0
        destinationImage.alpha = 0
        sourceName.alpha = 0
        sourceImage.alpha = 0
        
        let transitionalLabelInitialFrame = containerView.convert(sourceName.bounds, to: sourceName)
        let transitionalImageInitialFrame = containerView.convert(sourceImage.bounds, to: sourceImage)
        
        let transitionalLabel = UILabel(frame: transitionalLabelInitialFrame)
        transitionalLabel.textColor = .black
        transitionalLabel.font = sourceName.font
        transitionalLabel.text = sourceName.text
        containerView.addSubview(transitionalLabel)
        
        let transitionalImage = UIImageView(frame: transitionalImageInitialFrame)
        transitionalImage.image = sourceImage.image
        containerView.addSubview(transitionalImage)
        
        let transitionDuration = self.transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: transitionDuration, animations: {
            let transitioningLabelEndFrame = containerView.convert(destinationName.bounds, from: destinationName)
            transitionalLabel.frame = transitioningLabelEndFrame
            let transitioningImageEndFrame = containerView.convert(destinationImage.bounds, from: destinationImage)
            transitionalImage.frame = transitioningImageEndFrame
            toView.alpha = 1
        }) { _ in
            destinationName.alpha = 1
            destinationImage.alpha = 1
            sourceName.alpha = 1
            sourceImage.alpha = 1
            transitionalImage.removeFromSuperview()
            transitionalLabel.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
        
        
    }

    
}
