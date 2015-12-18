//
//  UIKit013Second.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/18.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit
import Cartography

class UIKit013Second: UIViewController {

    private var closeButton: UIButton!;
    
    var parentWindow: UIWindow?;    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup();
        layoutView();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


// MARK:初期化
extension UIKit013Second {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.midnightblue();
        
        self.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Contacts, tag: 2);
        
        closeButton = UIButton();
        closeButton.setTitle("Close", forState: .Normal);
        closeButton.backgroundColor = UIColor.pomegranate();
        closeButton.layer.cornerRadius = 20;
        closeButton.setTitleColor(UIColor.whiteColor(), forState: .Normal);
        closeButton.addTarget(self, action: "closeButton_click:", forControlEvents: .TouchUpInside);
        view.addSubview(closeButton);
    }
    func layoutView(){
        constrain(closeButton, block: { lview in
            lview.centerX == lview.superview!.centerX;
            lview.centerY == lview.superview!.centerY;
            lview.width == 100;
            lview.height == 50;
        });
    }
}

// MARK:イベント
extension UIKit013Second {
    func closeButton_click(sender: UIButton) {
        parentWindow?.hidden = true;
        parentWindow?.resignKeyWindow();
        parentWindow?.removeFromSuperview();
    }
}

// MARK:Actions
extension UIKit013Second {
    
}
