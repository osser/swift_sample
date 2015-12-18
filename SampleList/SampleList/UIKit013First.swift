//
//  UIKit013First.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/18.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit013First: UIViewController {

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
extension UIKit013First {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.belizehole();
        
        self.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Featured, tag: 1);
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit013First {
    
}

// MARK:Actions
extension UIKit013First {
    
}
