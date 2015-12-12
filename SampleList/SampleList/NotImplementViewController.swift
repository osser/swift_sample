//
//  NotImplementViewController.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/12.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit
import Cartography

class NotImplementViewController: UIViewController {
    
    var lblTitle: UILabel!;
    var btnClose: UIButton!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        setup();
        layoutView();
    }
}

// MARK:初期化
extension NotImplementViewController {
    func setup(){
        view.backgroundColor = UIColor.whiteColor();
        
        btnClose = UIButton();
        btnClose.setTitle("閉じる", forState: .Normal);
        btnClose.backgroundColor = UIColor.grayColor();
        btnClose.setTitleColor(UIColor.whiteColor(), forState: .Normal);
        btnClose.layer.masksToBounds = true;
        btnClose.layer.cornerRadius = 20.0;
        btnClose.addTarget(self, action: "btnClose_click:", forControlEvents: .TouchUpInside);
        view.addSubview(btnClose);
        
        lblTitle = UILabel();
        lblTitle.text = "準備中...";
        lblTitle.font = UIFont(name: lblTitle.font.fontName, size: 30);
        lblTitle.textAlignment = .Center;
        view.addSubview(lblTitle);
    }
    func layoutView(){
        constrain(lblTitle, block: { view in
            view.centerX == view.superview!.centerX;
            view.centerY == view.superview!.centerY;
            view.left == view.superview!.left;
            view.right == view.superview!.right;
        });
        constrain(btnClose, block: { view in
            view.bottom == view.superview!.bottom - 50;
            view.width == 100;
            view.height == 50;
            view.centerX == view.superview!.centerX;
        });
    }
}

// MARK:イベント
extension NotImplementViewController {
    func btnClose_click(sender: UIButton){
        closeTheWindow(self);
    }
}
