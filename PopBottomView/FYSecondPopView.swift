//
//  FYSecondPopView.swift
//  PopBottomView
//
//  Created by 岑志军 on 2019/3/14.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

class FYSecondPopView: FYBasePopUpView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func contentSize() -> CGSize {
        return CGSize.init(width: UIScreen.main.bounds.width - 80, height: 400)
    }
    
}
