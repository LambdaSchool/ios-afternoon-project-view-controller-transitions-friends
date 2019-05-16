//
//  ImageTransitionAnimator.swift
//  Friends
//
//  Created by Michael Redig on 5/16/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {

	var sourceImageView: UIImageView?
	var destImageView: UIImageView?

	var sourceTextLabel: UILabel?
	var destTextLabel: UILabel?

	func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
		return 0.5
	}

	func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

	}
}
