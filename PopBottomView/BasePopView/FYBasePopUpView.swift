//
//  FYBasePopUpView.swift
//  PopBottomView
//
//  Created by 岑志军 on 2019/3/28.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

class FYBasePopUpView: FYBasePopBottomView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func contentSize() -> CGSize {
        return CGSize.init(width: UIScreen.main.bounds.width - 60, height: 300)
    }
    
    public override class func showInController(controller: UIViewController)  {
        
        let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let cls:AnyClass? = NSClassFromString(clsName + "." + NSStringFromClass(self).components(separatedBy: ".").last!)
        
        let vcType = cls as! FYBasePopUpView.Type
        
        let popView = vcType.init()
        
        controller.showPopViewFromCenter(popView: popView, animated: true)
    }

}
