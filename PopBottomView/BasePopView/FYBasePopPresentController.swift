//
//  FYBasePopPresent.swift
//  PopBottomView
//
//  Created by 岑志军 on 2019/3/14.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

class FYBasePopPresentController: UIPresentationController {
    
    lazy var blackView: UIView = {
        let view = UIView()
        if let frame = self.containerView?.bounds {
            view.frame = frame
        }
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        view.addGestureRecognizer(gesture)
        return view
    }()
    
    var controllerSize: CGSize = CGSize.zero
    var popUpTheme : FYPopUpTheme = FYPopUpTheme()
    
    public override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        if case let controller as FYBasePresentController = presentedViewController {
            self.popUpTheme = controller.popUpTheme
            controllerSize = controller.basePopView.contentSize()
        }
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    public override func presentationTransitionWillBegin() {
        blackView.alpha = 0
        containerView?.addSubview(blackView)
        
        if self.presentedViewController.isKind(of: FYBasePresentController.self) {
            let bottomVc = self.presentedViewController as! FYBasePresentController
            
            bottomVc.popupControllerWillPresent()
            UIView.animate(withDuration: 0.5) {
                self.blackView.alpha = 1
            }
        }
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        if self.presentedViewController.isKind(of: FYBasePresentController.self) {
            
            let bottomVc = self.presentedViewController as! FYBasePresentController
            bottomVc.popupControllerDidPresent()
        }
    }
    
    public override func dismissalTransitionWillBegin() {
        
        if self.presentedViewController.isKind(of: FYBasePresentController.self) {
            
            let bottomVc = self.presentedViewController as! FYBasePresentController
            bottomVc.popupControllerWillDismiss()
            
            UIView.animate(withDuration: 0.5) {
                self.blackView.alpha = 0
            }
        }
    }
    
    public override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            blackView.removeFromSuperview()
            
            if self.presentedViewController.isKind(of: FYBasePresentController.self) {
                
                let bottomVc = self.presentedViewController as! FYBasePresentController
                bottomVc.popupControllerDidDismiss()
            }
        }
    }
    
    public override var frameOfPresentedViewInContainerView: CGRect {
        
        if self.popUpTheme.presentationStyle == .bottom {
            
            return CGRect(x: 0,
                          y: UIScreen.main.bounds.height - controllerSize.height,
                          width: UIScreen.main.bounds.width,
                          height: controllerSize.height)
            
        } else {
            // center
            return CGRect(x: (UIScreen.main.bounds.width - controllerSize.width) / 2,
                          y: (UIScreen.main.bounds.height - controllerSize.height) / 2,
                          width: controllerSize.width,
                          height: controllerSize.height)
        }
        
    }
    
    @objc func dismissView() {
        
        if self.presentedViewController.isKind(of: FYBasePresentController.self) {
            
            let bottomVc = self.presentedViewController as! FYBasePresentController
            
            bottomVc.dismissView(animated: true)
        }
    }
}
