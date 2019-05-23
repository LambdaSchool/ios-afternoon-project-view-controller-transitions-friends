//
//  ImageTransitionAnimator.swift
//  Friends
//
//  Created by Jonathan Ferrer on 5/23/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
//

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        guard let fromVc = transitionContext.viewController(forKey: .from) as? FriendsTableViewController,
        let toVC = transitionContext.viewController(forKey: .to) as? FriendDetailViewController,
        let toView = transitionContext.view(forKey: .to) else { return }

        let containerView = transitionContext.containerView

        containerView.addSubview(toView)
        let toViewEndFrame = transitionContext.finalFrame(for: toVC)
        toView.frame = toViewEndFrame


        toView.alpha = 0

        guard let startLabel = sourceLabel else { return }
        guard let startImage = sourcePhoto else { return }
        guard let endImage = destinationPhoto else { return }
        guard let endLabel = destinationLabel else { return }

        toView.layoutIfNeeded()

        let transitionLabelIinitialFrame = containerView.convert(startLabel.bounds, from: startLabel)
        let transitionLabelEndFrame = containerView.convert(endLabel.bounds, from: endLabel)

        let transitionLabel = UILabel(frame: transitionLabelIinitialFrame)

        transitionLabel.text = startLabel.text
        transitionLabel.font = startLabel.font
        transitionLabel.textColor = startLabel.textColor

        containerView.addSubview(transitionLabel)

        let animationDuration = self.transitionDuration(using: transitionContext)

        startLabel.alpha = 0
        endLabel.alpha = 0

        UIView.animate(withDuration: animationDuration, animations: {

            transitionLabel.frame = transitionLabelEndFrame
            transitionLabel.textColor = endLabel.textColor

            toView.alpha = 1

        }) { (_) in

            transitionLabel.removeFromSuperview()
            endLabel.alpha = 1
            startLabel.alpha = 1

           
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)

        }


        
    }

    var sourcePhoto: UIImage?
    var sourceLabel: UILabel?
    var destinationPhoto: UIImage?
    var destinationLabel: UILabel?


}
