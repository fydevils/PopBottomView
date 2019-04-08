//
//  UIViewController+FYAddition.swift
//  PopBottomView
//
//  Created by 岑志军 on 2019/4/3.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

extension UIViewController{
    
    // 底部弹窗通用
    func showPopViewFromBottom(popView: FYBasePopBottomView,  animated: Bool) {
        
        let popTheme = FYPopUpTheme()
        popTheme.presentationStyle = .bottom
        popTheme.springWithDamping = 1
        
        self.showPopupView(popView: popView, popTheme: popTheme, animated: true)
    }
    
    // 中心弹窗通用
    func showPopViewFromCenter(popView: FYBasePopBottomView,  animated: Bool) {
        let popTheme = FYPopUpTheme()
        popTheme.presentationStyle = .center
        popTheme.springWithDamping = 1
        
        self.showPopupView(popView: popView, popTheme: popTheme, animated: true)
    }
    
    // 自定义主题
    func showPopupView(popView: FYBasePopBottomView, popTheme:FYPopUpTheme,  animated: Bool) {
        
        let presentController = FYBasePresentController.init(popView: popView, popUpTheme: popTheme)
        
        presentController.delegate = popView
        popView.presentController = presentController
        
        self.present(presentController, animated: true, completion: nil)
    }
}
