//
//  ViewController.swift
//  StatusBarChangeSample
//
//  Created by maru on 2017/12/02.
//  Copyright © 2017年 mbyk. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        statusStyleUpdator.updateStatusBar(statusBarStyle: .default)
    }
}


