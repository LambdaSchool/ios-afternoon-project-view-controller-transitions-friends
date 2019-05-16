//
//  ImageTransitionAnimator.swift
//  Friends
//
//  Created by Michael Redig on 5/16/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

protocol ImageTransitionProtocol: UIViewController {
	var transitionImageView: UIImageView? { get }
	var transitionLabel: UILabel? { get }
}

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {

	var sourceImageView: UIImageView?
	var destImageView: UIImageView?

	var sourceTextLabel: UILabel?
	var destTextLabel: UILabel?

	func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
		return 0.5
	}

	func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
		guard let sourceImageView = sourceImageView, let destImageView = destImageView,
			let sourceTextLabel = sourceTextLabel, let destTextLabel = destTextLabel else { return }
		guard let toVC = transitionContext.viewController(forKey: .to), let fromVC = transitionContext.viewController(forKey: .from) else { return }

		// transition container view
		let container = transitionContext.containerView

		let toViewEndFrame = transitionContext.finalFrame(for: toVC)

		guard let destView = transitionContext.view(forKey: .to) else { return }
		let sourceView = transitionContext.view(forKey: .from)
		destView.frame = toViewEndFrame
		container.addSubview(destView)

		let startImageFrame = container.convert(sourceImageView.bounds, from: sourceImageView)// sourceImageView.frame
		let destImageFrame = container.convert(destImageView.bounds, from: destImageView)//destImageView.frame
		let startTextFrame = container.convert(sourceTextLabel.bounds, from: sourceTextLabel)//sourceTextLabel.frame
		let destTextFrame = container.convert(destTextLabel.bounds, from: destTextLabel)//destTextLabel.frame

		print(startTextFrame, destTextFrame)


		let tempImageView = UIImageView(frame: startImageFrame)
		tempImageView.image = sourceImageView.image
		tempImageView.contentMode = .scaleAspectFit

		let tempLabelView = UILabel(frame: startTextFrame)
//		tempLabelView.sizeToFit()
		tempLabelView.text = sourceTextLabel.text
		tempLabelView.textAlignment = sourceTextLabel.textAlignment
		tempLabelView.textColor = sourceTextLabel.textColor
		tempLabelView.font = sourceTextLabel.font

		container.addSubview(tempImageView)
		container.addSubview(tempLabelView)

		destView.alpha = 0
		sourceTextLabel.alpha = 0
		destTextLabel.alpha = 0
		sourceImageView.alpha = 0
		destImageView.alpha = 0

		destView.layoutIfNeeded()

		let duration = transitionDuration(using: transitionContext)
		UIView.animate(withDuration: duration, animations: {
			tempLabelView.frame = destTextFrame
			tempLabelView.frame.size = sourceTextLabel.frame.size
			tempImageView.frame = destImageFrame
			tempLabelView.font = destTextLabel.font
			destView.alpha = 1
//			sourceView?.alpha = 0

		}) { _ in
			tempImageView.removeFromSuperview()
			tempLabelView.removeFromSuperview()
//			destView.alpha = 1
			sourceTextLabel.alpha = 1
			destTextLabel.alpha = 1
			sourceImageView.alpha = 1
			destImageView.alpha = 1
			sourceView?.alpha = 1
			transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
		}
	}
}
