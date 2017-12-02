//
//  BaseViewController.swift
//  StatusBarChangeSample
//
//  Created by maru on 2017/12/02.
//  Copyright © 2017年 mbyk. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    lazy var statusStyleUpdator = StatusStyleUpdator(delegateController: self)

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK:- StatusStyleUpdatorProvider

extension BaseViewController: StatusStyleUpdatorProvider {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusStyleUpdator.statusBarStyle
    }
    
    override var prefersStatusBarHidden: Bool {
        return statusStyleUpdator.statusBarHidden
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return statusStyleUpdator.statusBarUpdateAnimation
    }

}
