//
//  FYBasePopUpAnimation.swift
//  PopBottomView
//
//  Created by 岑志军 on 2019/3/28.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

enum FYPopupPresentationStyle{
    case bottom     // 底部弹出视图
    case center     // 中心视图
}

class FYPopUpTheme: NSObject {
    var duration: TimeInterval = 0.3
    var delay: TimeInterval = 0.0
    var springWithDamping: CGFloat = 0.8
    var springVelocity: CGFloat = 2.0
    var presentationStyle: FYPopupPresentationStyle = .bottom
}

class FYBasePopUpShowAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    var popUpTheme = FYPopUpTheme.init()
    
    init(theme: FYPopUpTheme) {
        super.init()
        
        self.popUpTheme = theme
    }
    
    open func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.popUpTheme.duration
    }
    
    open func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController( forKey: UITransitionContextViewControllerKey.to),
            let toView = transitionContext.view( forKey: UITransitionContextViewKey.to)
            else {
                return
        }
        
        let containerView = transitionContext.containerView
        toView.frame = transitionContext.finalFrame(for: toViewController)
        containerView.addSubview(toView)
        
        if self.popUpTheme.presentationStyle == .center {
            toView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        } else {
            toView.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height)
        }
        
        UIView.animate(withDuration: self.popUpTheme.duration,
                       delay: self.popUpTheme.delay,
                       usingSpringWithDamping: self.popUpTheme.springWithDamping,
                       initialSpringVelocity: self.popUpTheme.springVelocity,
                       options: .curveEaseOut, animations: {
                        
                        if self.popUpTheme.presentationStyle == .center {
                            toView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                        } else {
                            toView.transform = CGAffineTransform(translationX: 0, y: 0)
                        }
                        
        }) { (finished) in
            transitionContext.completeTransition(finished)
        }
    }
}

open class FYBasePopUpDismissAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    var popUpTheme = FYPopUpTheme.init()
    
    init(theme: FYPopUpTheme) {
        super.init()
        
        self.popUpTheme = theme
    }
    
    open func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.popUpTheme.duration
    }
    
    open func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view( forKey: UITransitionContextViewKey.from)
            else {
                return
        }
        
        UIView.animate(withDuration: self.popUpTheme.duration,
                       delay: self.popUpTheme.delay,
                       options: .curveEaseInOut,
                       animations: {
                        
                        if self.popUpTheme.presentationStyle == .center {
                            fromView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
                        } else {
                            fromView.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height)
                        }
                        
                        fromView.alpha = 0.0
        }) { (finished) in
            
            if self.popUpTheme.presentationStyle == .center {
                fromView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            } else {
                fromView.transform = CGAffineTransform(translationX: 0, y: 0)
            }
            
            fromView.alpha = 1.0
            transitionContext.completeTransition(finished)
        }
    }
}

