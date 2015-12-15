//
//  ViewManager.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/13.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

struct ViewManager {
    
    static let rootViewController = UIApplication.sharedApplication().keyWindow?.rootViewController;
    
    static let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height;
    
    static var currentWindow: UIWindow? {
        if let window = UIApplication.sharedApplication().keyWindow {
            return window;
        } else {
            return UIApplication.sharedApplication().windows[0];// as? UIWindow
        }
    }
    
//    // デフォルトFloat(44)としてUnwrap
//    static func navigationBarHeight(win: UIViewController) -> CGFloat {
//        return win.navigationController?.navigationBar.frame.size.height ?? 44;
//    }
}