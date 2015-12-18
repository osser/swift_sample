//
//  UIKit031Second.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/18.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit
import Cartography

class UIKit031Second: UIViewController {

    let closeButton:UIButton = UIButton();

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
extension UIKit031Second {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.wisteria();
     
        self.title = "My 2nd View"
        
        closeButton.setTitle("Close", forState: .Normal);
        closeButton.backgroundColor = UIColor.midnightblue();
        closeButton.layer.cornerRadius = 20;
        closeButton.addTarget(self, action: "closeButton_click:", forControlEvents: .TouchUpInside);
        view.addSubview(closeButton);
    }
    func layoutView(){
        constrain(closeButton, block: { lview in
            lview.centerX == lview.superview!.centerX;
            lview.centerY == lview.superview!.centerY;
            lview.height == 50;
            lview.width == 100;
        });
    }
}

// MARK:イベント
extension UIKit031Second {
    func closeButton_click(sender: UIButton){
        //print("closeButton_click");
        //closeTheWindow(self);
        popWindow(self);
    }
}

// MARK:Actions
extension UIKit031Second {
    
}
