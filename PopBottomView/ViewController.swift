//
//  ViewController.swift
//  PopBottomView
//
//  Created by 岑志军 on 2019/3/14.
//  Copyright © 2019 岑志军. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func firstBtnClicked(_ sender: Any) {
        FYFirstPopView.showInController(controller: self)
    }
    
    @IBAction func secondBtnClicked(_ sender: Any) {
        FYSecondPopView.showInController(controller: self)
    }
    
    @IBAction func thirdBtnClicked(_ sender: Any) {
        FYThirdPopView.showInController(controller: self)
    }
}

