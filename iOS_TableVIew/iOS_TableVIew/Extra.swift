//
//  Extra.swift
//  iOS_TableVIew
//
//  Created by xiaoma on 2015/12/11.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    func openTheWindow(win:UIViewController, cb: (() -> Void)?){
        win.modalPresentationStyle = .OverCurrentContext;
        win.modalTransitionStyle = .CoverVertical;
        presentViewController(win, animated: true, completion: cb);
    }
    func closeTheWindow(win:UIViewController, cb: (() -> Void)?){
        win.dismissViewControllerAnimated(true, completion: cb);
    }
}