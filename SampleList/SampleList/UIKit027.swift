//
//  UIKit027.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/16.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit
import Cartography
import LatoFont
import MGSwipeTableCell

class UIKit027: UIViewController {
    
    private var myToolbar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        setup();
        layoutView();
    }
}

// MARK:初期化
extension UIKit027 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        // 背景を青色に変更する.
        self.view.backgroundColor = UIColor.cyanColor()
        
        // ツールバーのサイズを決める.
        myToolbar = UIToolbar(frame: CGRectMake(0, self.view.bounds.size.height - 44, self.view.bounds.size.width, 44.0))

        // ツールバーの位置を決める.
        //myToolbar.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height-40.0)
        
        // ツールバーの色を決める.
//        myToolbar.barStyle = .BlackTranslucent
        myToolbar.barStyle = .Default
        myToolbar.tintColor = UIColor.orange()
        myToolbar.barTintColor = UIColor.whiteColor();
//        myToolbar.backgroundColor = UIColor.blackColor()
        
        // ボタン１を生成する.
        let myUIBarButtonGreen: UIBarButtonItem = UIBarButtonItem(title: "Green", style:.Plain, target: self, action: "onClickBarButton:")
        myUIBarButtonGreen.tag = 1
        
        // ボタン２を生成する.
        let myUIBarButtonBlue: UIBarButtonItem = UIBarButtonItem(title: "Blue", style:.Plain, target: self, action: "onClickBarButton:")
        myUIBarButtonBlue.tag = 2
        
        // ボタン3を生成する.
        let myUIBarButtonRed: UIBarButtonItem = UIBarButtonItem(title: "Red", style:.Plain, target: self, action: "onClickBarButton:")
        myUIBarButtonRed.tag = 3
        
        // ボタンをツールバーに入れる.
        myToolbar.items = [myUIBarButtonGreen, myUIBarButtonBlue, myUIBarButtonRed]
        
        // ツールバーに追加する.
        self.view.addSubview(myToolbar)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit027 {
    /*
    UIBarButtonItemが押された際に呼ばれる.
    */
    internal func onClickBarButton(sender: UIBarButtonItem) {
        
        switch sender.tag {
        case 1:
            self.view.backgroundColor = UIColor.greenColor()
        case 2:
            self.view.backgroundColor = UIColor.blueColor()
        case 3:
            self.view.backgroundColor = UIColor.redColor()
        default:
            print("ERROR!!")
        }
    }
}

// MARK:Actions
extension UIKit027 {
    
}
