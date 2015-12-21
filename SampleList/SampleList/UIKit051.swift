//
//  UIKit051.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/21.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit
import Cartography

class UIKit051: UIViewController {

    var startButton:UIButton!;
    
    private var myWindow: UIWindow = UIWindow();
    
    override func viewDidLoad() {
        super.viewDidLoad();

        setup();
        layoutView();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


// MARK:初期化
extension UIKit051 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
                
        view.backgroundColor = UIColor.whiteColor();
        
        startButton = UIButton();
        startButton.setTitle("Open The Window", forState: .Normal);
        startButton.setTitleColor(UIColor.whiteColor(), forState: .Normal);
        startButton.setTitleColor(UIColor.midnightblue(), forState: UIControlState.Highlighted);
        startButton.backgroundColor = UIColor.orange();
        startButton.layer.cornerRadius = 20;
        startButton.addTarget(self, action: "startButton_click:", forControlEvents: .TouchUpInside);
        self.view.addSubview(startButton);
    }
    func layoutView(){
        constrain(startButton, block: { lview in
            lview.centerX == lview.superview!.centerX;
            lview.centerY == lview.superview!.centerY;
            lview.width == 200;
            lview.height == 50;
        });
    }
}

// MARK:イベント
extension UIKit051 {
    func startButton_click(sender: UIButton) {
        myWindow = UIWindow(frame: CGRect(
            x: 0,
            y: UIApplication.sharedApplication().statusBarFrame.height,
            width: view.frame.width,
            height: view.frame.height - UIApplication.sharedApplication().statusBarFrame.height
            ));
        
        let myWin = UIKit051VC();
        myWin.parentWindow = myWindow;
        let myNav: UINavigationController = UINavigationController(rootViewController: myWin);
        
        myWindow.rootViewController = myNav;
        myWindow.makeKeyAndVisible();
    }
    
}

// MARK:Actions
extension UIKit051 {
    
}
