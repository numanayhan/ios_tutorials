//
//  BasicTransactionForMenu.swift
//  Panda
//
//  Created by TRA on 17.02.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import Foundation

import UIKit

public class BasicTransactionForMenu: NSObject, UIViewControllerAnimatedTransitioning {
    let animationOptions: UIView.AnimationOptions
    let duration: TimeInterval
    
  
    public init(options: UIView.AnimationOptions = .transitionCrossDissolve, duration: TimeInterval = 0.4) {
        self.animationOptions = options
        self.duration = duration
    }
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromViewController = transitionContext.viewController(forKey: .from),
            let toViewController = transitionContext.viewController(forKey: .to) else {
                return
        }
        
        transitionContext.containerView.addSubview(toViewController.view)
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.transition(from: fromViewController.view,
                          to: toViewController.view,
                          duration: duration,
                          options: animationOptions,
                          completion: { (_) in
                            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}
