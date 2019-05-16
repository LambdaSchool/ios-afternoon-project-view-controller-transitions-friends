//
//  ImageTransitionAnimator.swift
//  view-controller-transitions-friends
//
//  Created by Hector Steven on 5/16/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
	func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
		return 0.5
	}
	
	func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
		guard let toVC = transitionContext.viewController(forKey: .from) as? DetailViewController,
			let toView = transitionContext.view(forKey: .to) else { return }
		
		let containerView = transitionContext.containerView
		let toViewEndFrame = transitionContext.finalFrame(for: toVC)
	
		
		
		containerView.addSubview(toView)
		toView.frame = toViewEndFrame
		toView.alpha = 0
	}
	
	
	

}
