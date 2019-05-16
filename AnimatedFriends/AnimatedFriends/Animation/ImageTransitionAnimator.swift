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
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        <#code#>
    }
    

}
