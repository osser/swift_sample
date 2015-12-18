//
//  UIKit013.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/16.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit
import Cartography
import LatoFont

class UIKit013: UIViewController {

    private var startButton: UIButton!;

    private var myWindow: UIWindow = UIWindow();
    private var myTabBarController: UITabBarController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup();
        layoutView();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


// MARK:初期化
extension UIKit013 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");

        view.backgroundColor = UIColor.whiteColor();
        
        startButton = UIButton();
        startButton.setTitle("TabBar Sample", forState: .Normal);
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
            lview.width == 150;
        });
    }
}

// MARK:イベント
extension UIKit013 {
    func startButton_click(sender: UIButton){
        //myWindow = UIWindow(frame: UIScreen.mainScreen().bounds);
        myWindow = UIWindow(frame: CGRect(
            x: 0,
            y: UIApplication.sharedApplication().statusBarFrame.height,
            width: view.frame.width,
            height: view.frame.height - UIApplication.sharedApplication().statusBarFrame.height
        ));
        
        let first = UIKit013First();
        let second = UIKit013Second();
        second.parentWindow = myWindow;
        
        let tabList:[UIViewController] = [first, second];
        
        myTabBarController = UITabBarController();
        myTabBarController.setViewControllers(tabList, animated: true);
        
        myTabBarController.selectedIndex = 1;
        myTabBarController.selectedViewController = first;

        myWindow.rootViewController = myTabBarController;
        myWindow.makeKeyAndVisible();
    }
}

// MARK:Actions
extension UIKit013 {
    
}
