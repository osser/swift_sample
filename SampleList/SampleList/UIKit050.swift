//
//  UIKit050.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/21.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit050: UIViewController {

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
extension UIKit050 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.whiteColor();
        
        let myButton = UIButton(frame: CGRectMake(50, 50, 100, 100))
        myButton.setTitle("UIボタン", forState: UIControlState.Normal)
        myButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        myButton.backgroundColor = UIColor.greenColor()
        
        let myLabel = UILabel(frame: CGRectMake(50, 200, 100, 100))
        myLabel.text = "UIラベル"
        myLabel.textColor = UIColor.greenColor()
        myLabel.backgroundColor = UIColor.redColor()
        
        self.view.addSubview(myButton)
        
        print("View:\(view.description)")
        
        let views = self.view.subviews
        for myView in views {
            print("View:\(myView.description)")
            
            if myView.isKindOfClass(UIButton) {
                myView.removeFromSuperview()
                self.view.addSubview(myLabel)
            }
        }
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit050 {
    
}

// MARK:Actions
extension UIKit050 {
    
}
