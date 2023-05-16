//
//  CustomPresentationAnimator.swift
//  twitter
//
//  Created by Karon Bell on 5/15/23.
//

import Foundation
import UIKit



class CustomPresentationAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    private let isPresenting: Bool
    private let duration: TimeInterval = 1
    
    init(isPresenting: Bool) {
        self.isPresenting = isPresenting
        super.init()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        if isPresenting {
            guard let toView = transitionContext.view(forKey: .to) else { return }
            containerView.addSubview(toView)
            
            // Set the initial position and size of the presenting view
            let finalFrame = transitionContext.finalFrame(for: transitionContext.viewController(forKey: .to)!)
            var initialFrame = finalFrame
            initialFrame.size.width /= 20 // Set the initial width to cover half of the screen
            toView.frame = initialFrame
            
            // Animate the presentation
            UIView.animate(withDuration: duration, animations: {
                toView.frame = finalFrame
            }, completion: { finished in
                transitionContext.completeTransition(finished)
            })
        } else {
            guard let fromView = transitionContext.view(forKey: .from) else { return }
            
            // Set the final position and size of the presenting view
            var finalFrame = fromView.frame
            finalFrame.size.width /= -200 // Set the final width to cover half of the screen
            finalFrame.origin.x += finalFrame.width // Set the final x position to slide out to the right
            
            // Animate the dismissal
            UIView.animate(withDuration: duration, animations: {
                fromView.frame = finalFrame
            }, completion: { finished in
                fromView.removeFromSuperview()
                transitionContext.completeTransition(finished)
            })
        }
    }
}
