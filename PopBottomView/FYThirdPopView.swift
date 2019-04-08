//
//  FYThirdPopView.swift
//  PopBottomView
//
//  Created by 岑志军 on 2019/3/14.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

class FYThirdPopView: FYBasePopBottomView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.orange
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func contentHeight() -> CGFloat {
        return 300
    }
}
