//
//  UIKit029.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/16.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit029: UIViewController {
    
    private let mySegLabel: UILabel = UILabel(frame: CGRectMake(0,0,150,150))
    
    override func viewDidLoad() {
        super.viewDidLoad();
        setup();
        layoutView();
    }
}

// MARK:初期化
extension UIKit029 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.whiteColor();
        
        // 表示する配列を作成する.
        let myArray: NSArray = ["Red","Blue","Green"]
        
        // SegmentedControlを作成する.
        let mySegcon: UISegmentedControl = UISegmentedControl(items: myArray as [AnyObject])
        mySegcon.center = CGPoint(x: self.view.frame.width/2, y: 400)
        mySegcon.backgroundColor = UIColor.pumpkin()
        mySegcon.tintColor = UIColor.whiteColor()
        
        // イベントを追加する.
        mySegcon.addTarget(self, action: "segconChanged:", forControlEvents: UIControlEvents.ValueChanged)
        
        // Viewに追加する.
        self.view.addSubview(mySegcon)
        
        // Labelを作成する.
        mySegLabel.backgroundColor = UIColor.whiteColor()
        mySegLabel.layer.masksToBounds = true
        mySegLabel.layer.cornerRadius = 75.0
        mySegLabel.textColor = UIColor.whiteColor()
        mySegLabel.shadowColor = UIColor.grayColor()
        mySegLabel.font = UIFont.systemFontOfSize(CGFloat(30))
        mySegLabel.textAlignment = NSTextAlignment.Center
        mySegLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)
        
        // Viewの背景色をCyanにする.
        self.view.backgroundColor = UIColor.midnightblue()
        
        // Viewに追加する.
        self.view.addSubview(mySegLabel);
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit029 {
    /*
    SwgmentedControlの値が変わったときに呼び出される.
    */
    internal func segconChanged(segcon: UISegmentedControl){
        
        switch segcon.selectedSegmentIndex {
        case 0:
            mySegLabel.backgroundColor = UIColor.redColor()
            
        case 1:
            mySegLabel.backgroundColor = UIColor.blueColor()
            
        case 2:
            mySegLabel.backgroundColor = UIColor.greenColor()
            
        default:
            print("Error")
        }
    }
}

// MARK:Actions
extension UIKit029 {
    
}
