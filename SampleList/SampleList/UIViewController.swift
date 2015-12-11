//
//  UIViewController.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/11.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

extension UIViewController {
    func openTheWindow(win:UIViewController){
        win.modalPresentationStyle = .OverCurrentContext;
        win.modalTransitionStyle = .CoverVertical;
        presentViewController(win, animated: true, completion: {});
    }
    func closeTheWindow(win:UIViewController){
        win.dismissViewControllerAnimated(true, completion: {});
    }
}
