//
//  UIViewController.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/11.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

// MARK:画面関数
extension UIViewController {
    func openTheWindow(win:UIViewController){
        win.modalPresentationStyle = .OverCurrentContext;
        win.modalTransitionStyle = .CoverVertical;
        presentViewController(win, animated: true, completion: {});
    }
    func closeTheWindow(win:UIViewController){
        win.dismissViewControllerAnimated(true, completion: {});
    }
    func pushWindow(win:UIViewController){
        navigationController?.pushViewController(win, animated: true);
    }
    func popWindow(win:UIViewController){
        navigationController?.popToViewController(win, animated: true);
    }
}

// MARK:コントール作成
extension UIViewController {
    func buildTestLabel(){
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height));
        label.font = UIFont(name: label.font!.familyName, size: 30);
        label.textAlignment = .Center;
        label.text = "確認用";
        view.addSubview(label);
    }
}