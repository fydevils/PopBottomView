//
//  FYBasePopView.swift
//  PopBottomView
//
//  Created by 岑志军 on 2019/3/14.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

class FYBasePopBottomView: UIView, FYBasePresentControllerDelegate{

    weak var presentController : FYBasePresentController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let viewFrame = CGRect(x: 0, y: 0, width: self.contentSize().width, height: self.contentSize().height)
        
        self.frame = viewFrame
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func contentHeight() -> CGFloat {
        return 300
    }
    
    public func contentSize() -> CGSize {
        return CGSize.init(width: UIScreen.main.bounds.width, height: self.contentHeight())
    }
    
    public func shouldDismissOnBackgroundTouch() -> Bool {
        return true
    }
    
    public class func showInController(controller: UIViewController)  {
        
        let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let cls:AnyClass? = NSClassFromString(clsName + "." + NSStringFromClass(self).components(separatedBy: ".").last!)
        
        let vcType = cls as! FYBasePopBottomView.Type
        
        let popView = vcType.init()
        
        controller.showPopViewFromBottom(popView: popView, animated: true)
    }
    
    func popupControllerWillPresent() {
        
    }
    
    func popupControllerDidPresent() {
        
    }
    
    func popupControllerWillDismiss() {
        
    }
    
    func popupControllerDidDismiss() {
        
    }
    
    func dismissView(animated: Bool) {
        presentController?.dismiss(animated: animated, completion: nil)
    }
}
