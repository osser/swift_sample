//
//  ViewTemplate.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/11.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit
import Cartography
import LatoFont
import MGSwipeTableCell

class ViewTemplate: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
        setup();
        layoutView();
    }
}

// MARK:初期化
extension ViewTemplate {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.whiteColor();
        
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension ViewTemplate {
    
}

// MARK:Actions
extension ViewTemplate {
    
}
