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

       


        
    }

    var sourcePhoto: UIImage?
    var sourceLabel: UILabel?
    var destinationPhoto: UIImage?
    var destinationLabel: UILabel?


}
