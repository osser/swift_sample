//
//  UIKit031.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/18.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit
import Cartography

class UIKit031: UIViewController {
    
    let startButton:UIButton = UIButton();
    
    private var myWindow: UIWindow = UIWindow();

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
extension UIKit031 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.whiteColor();
        
        startButton.setTitle("Start", forState: .Normal);
        startButton.setTitleColor(UIColor.whiteColor(), forState: .Normal);
        startButton.backgroundColor = UIColor.orange();
        startButton.layer.cornerRadius = 20;
        startButton.addTarget(self, action: "startButton_click:", forControlEvents: .TouchUpInside);
        view.addSubview(startButton);
    }
    func layoutView(){
        constrain(startButton, block: { lview in
            lview.centerX == lview.superview!.centerX;
            lview.centerY == lview.superview!.centerY;
            lview.height == 50;
            lview.width == 100;
        });
    }
}

// MARK:イベント
extension UIKit031 {
    func startButton_click(sender:UIButton){
        
        // 背景を白に設定する.
        myWindow.backgroundColor = UIColor.concrete()
        myWindow.frame = view.frame;
        myWindow.alpha = 1
        myWindow.layer.cornerRadius = 50

        let myFirst:UIKit031First = UIKit031First();
        myFirst.parentWindow = myWindow;
        let myNav: UINavigationController = UINavigationController(rootViewController: myFirst);
        myWindow.rootViewController = myNav;
        
        // myWindowをkeyWindowにする.
        myWindow.makeKeyWindow()
        
        // windowを表示する.
        self.myWindow.makeKeyAndVisible()
    }
}

// MARK:Actions
extension UIKit031 {
    
}
