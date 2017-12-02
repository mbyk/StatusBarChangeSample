//
//  StatusStyleUpdateObject.swift
//  StatusBarChangeSample
//
//  Created by maru on 2017/12/02.
//  Copyright © 2017年 mbyk. All rights reserved.
//

import UIKit

protocol StatusStyleUpdatorProvider {
    var statusStyleUpdator: StatusStyleUpdator { get set }
    
    var preferredStatusBarStyle: UIStatusBarStyle { get }
    var prefersStatusBarHidden: Bool { get }
    var preferredStatusBarUpdateAnimation: UIStatusBarAnimation { get }
}

class StatusStyleUpdator {

    private var _statusBarStyleAnimationDuration: TimeInterval = 0.3
    private var _statusBarHiddenAnimationDuration: TimeInterval = 0.3
    private var _statusBarUpdateAnimationDuration: TimeInterval = 0.3
    
    private var _statusBarStyle: UIStatusBarStyle = .default {
        didSet {
            guard oldValue != _statusBarStyle else { return }
            UIView.animate(withDuration: _statusBarStyleAnimationDuration) { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.delegateController?.setNeedsStatusBarAppearanceUpdate()
            }
        }
    }
    
    private var _statusBarHidden = false {
        didSet {
            guard oldValue != _statusBarHidden else { return }
            UIView.animate(withDuration: _statusBarHiddenAnimationDuration) { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.delegateController?.setNeedsStatusBarAppearanceUpdate()
            }
        }
    }
    
    private var _statusBarUpdateAnimation: UIStatusBarAnimation = .fade {
        didSet {
            guard oldValue != _statusBarUpdateAnimation else { return }
            UIView.animate(withDuration: _statusBarUpdateAnimationDuration) { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.delegateController?.setNeedsStatusBarAppearanceUpdate()
            }
        }
    }
    
    var statusBarStyle: UIStatusBarStyle {
        return _statusBarStyle
    }
    
    var statusBarHidden: Bool {
        return _statusBarHidden
    }
    
    var statusBarUpdateAnimation: UIStatusBarAnimation {
        return _statusBarUpdateAnimation
    }
    
    private weak var delegateController: UIViewController?
    
    init(delegateController: UIViewController) {
        self.delegateController = delegateController
    }

    func updateStatusBar(statusBarStyle: UIStatusBarStyle? = nil, statusBarHidden: Bool? = nil, statusBarUpdateAnimation: UIStatusBarAnimation? = nil) {
        
        if let statusBarStyle = statusBarStyle {
            _statusBarStyle = statusBarStyle
        }

        if let statusBarHidden = statusBarHidden {
            _statusBarHidden = statusBarHidden
        }
        
        if let statusBarUpdateAnimation = statusBarUpdateAnimation {
            _statusBarUpdateAnimation = statusBarUpdateAnimation
        }
    }
    
    func updateStatusBarAnimationDuration(statusBarStyleAnimationDuration: TimeInterval? = nil,
                                          statusBarHiddenAnimationDuration: TimeInterval? = nil,
                                          statusBarUpdateAnimationDuration: TimeInterval? = nil) {
        
        if let statusBarStyleAnimationDuration = statusBarStyleAnimationDuration {
            _statusBarStyleAnimationDuration = statusBarStyleAnimationDuration
        }
        
        if let statusBarHiddenAnimationDuration = statusBarHiddenAnimationDuration {
            _statusBarHiddenAnimationDuration = statusBarHiddenAnimationDuration
        }
        
        if let statusBarUpdateAnimationDuration = statusBarUpdateAnimationDuration {
            _statusBarUpdateAnimationDuration = statusBarUpdateAnimationDuration
        }

    }
    
}
