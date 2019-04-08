//
//  FYBasePresentController.swift
//  PopBottomView
//
//  Created by 岑志军 on 2019/3/28.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

protocol FYBasePresentControllerDelegate : NSObjectProtocol{
    func popupControllerWillPresent()
    func popupControllerDidPresent()
    func popupControllerWillDismiss()
    func popupControllerDidDismiss()
    func dismissView(animated: Bool)
}

class FYBasePresentController: UIViewController {
    
    var basePopView = FYBasePopBottomView()
    var popUpTheme:FYPopUpTheme = FYPopUpTheme()
    weak var delegate : FYBasePresentControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(basePopView)
    }
    
    init(popView: FYBasePopBottomView, popUpTheme:FYPopUpTheme) {
        super.init(nibName: nil, bundle: nil)
        self.configInit()
        
        self.popUpTheme = popUpTheme
        self.basePopView = popView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func popupControllerWillPresent() {
        
        if delegate != nil {
            delegate!.popupControllerWillPresent()
        }
    }
    
    func popupControllerDidPresent() {
        if delegate != nil {
            delegate?.popupControllerDidPresent()
        }
    }
    
    func popupControllerWillDismiss() {
        
        if delegate != nil {
            delegate!.popupControllerWillDismiss()
        }
    }
    
    func popupControllerDidDismiss() {
        
        if delegate != nil {
            delegate!.popupControllerDidDismiss()
        }
    }
    
    func dismissView(animated: Bool) {
        
        guard basePopView.shouldDismissOnBackgroundTouch() else {
            return
        }
        
        if delegate != nil {
            delegate?.dismissView(animated: animated)
        }
    }
    
    // MARK: Private Methods
    
    fileprivate func configInit() {
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
}

extension FYBasePresentController: UIViewControllerTransitioningDelegate {
    
    // 弹窗出现
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FYBasePopUpShowAnimation(theme: self.popUpTheme)
    }
    
    // 弹窗消失
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FYBasePopUpDismissAnimation(theme: self.popUpTheme)
    }
    
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let present = FYBasePopPresentController(presentedViewController: presented, presenting: presenting)
        return present
    }
}
