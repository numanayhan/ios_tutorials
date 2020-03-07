
//
//  SlideAnimation.swift
//  Panda
//
//  Created by TRA on 18.02.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import UIKit

class SlideAnimation: NSObject , UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate{
    let duration  = 0.5
    let animationOptions: UIView.AnimationOptions = []
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) else {
            return
        }
        guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else {
            return
        }
        let container = transitionContext.containerView
        let screenOffLeft  = CGAffineTransform(translationX: container.frame.width, y: 0)
        let screenOffRight = CGAffineTransform(translationX: -container.frame.width, y: 0)
        container.addSubview(fromView)
        container.addSubview(toView)
        toView.transform = screenOffRight
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: [], animations: {
            
            fromView.transform = screenOffRight
            fromView.alpha = 1
            toView.alpha = 1
            
        }) { (success) in
            transitionContext.completeTransition(success)
        }
    }
    
    

    
    
}
