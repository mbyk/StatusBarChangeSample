//
//  UINavigationController+statusbar.swift
//  StatusBarChangeSample
//
//  Created by maru on 2017/12/02.
//  Copyright © 2017年 mbyk. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    override open var childViewControllerForStatusBarStyle: UIViewController? {
        return visibleViewController
    }
    
    override open var childViewControllerForStatusBarHidden: UIViewController? {
        return visibleViewController
    }
    
}
