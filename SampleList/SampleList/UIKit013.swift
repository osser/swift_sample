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

    private var lblTitle: UILabel!;
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


// MARK:初期化
extension UIKit013 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");

        view.backgroundColor = UIColor.whiteColor();
        
        lblTitle = UILabel();
        lblTitle.text = "準備中...";
        lblTitle.font = UIFont.latoBlackFontOfSize(24);
        lblTitle.textColor = UIColor.pomegranate();
        
        view.addSubview(lblTitle);
    }
    func layoutView(){
        constrain(lblTitle, block: { lview in
            lview.centerX == lview.superview!.centerX;
            lview.centerY == lview.superview!.centerY;
        });
    }
}

// MARK:イベント
extension UIKit013 {
    
}

// MARK:Actions
extension UIKit013 {
    
}
