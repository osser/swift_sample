//
//  UIKit026.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/16.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit
import Cartography
import LatoFont
import MGSwipeTableCell

class UIKit026: UIViewController {
    
    private var myWindow: UIWindow!
    private var myWindowButton: UIButton!
    private var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        setup();
        layoutView();
    }
}

// MARK:初期化
extension UIKit026 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.whiteColor();
        
        myWindow = UIWindow()
        myWindowButton = UIButton()
        myButton = UIButton()
        
        // 背景に画像を設定する.
        let myImage: UIImage = UIImage(named: "playground")!
        let myImageView: UIImageView = UIImageView()
        myImageView.image = myImage
        myImageView.frame = CGRectMake(0, 0, myImage.size.width, self.view.frame.height)
        self.view.addSubview(myImageView)
        
        // ボタンを生成する.
        myButton.frame = CGRectMake(0, 0, 60, 60)
        myButton.backgroundColor = UIColor.redColor()
        myButton.setTitle("Dialog", forState: .Normal)
        myButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 30.0
        myButton.layer.position = CGPointMake(self.view.frame.width/2, self.view.frame.height-100)
        myButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        // ボタンを追加する.
        self.view.addSubview(myButton)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit026 {
    /*
    自作Windowを生成する
    */
    internal func makeMyWindow(){
        
        // 背景を白に設定する.
        myWindow.backgroundColor = UIColor.whiteColor()
        myWindow.frame = CGRectMake(0, 0, 200, 250)
        myWindow.layer.position = CGPointMake(self.view.frame.width/2, self.view.frame.height/2)
        myWindow.alpha = 0.8
        myWindow.layer.cornerRadius = 20
        
        // myWindowをkeyWindowにする.
        myWindow.makeKeyWindow()
        
        // windowを表示する.
        self.myWindow.makeKeyAndVisible()
        
        // ボタンを作成する.
        myWindowButton.frame = CGRectMake(0, 0, 100, 60)
        myWindowButton.backgroundColor = UIColor.orangeColor()
        myWindowButton.setTitle("Close", forState: .Normal)
        myWindowButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        myWindowButton.layer.masksToBounds = true
        myWindowButton.layer.cornerRadius = 20.0
        myWindowButton.layer.position = CGPointMake(self.myWindow.frame.width/2, self.myWindow.frame.height-50)
        myWindowButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        self.myWindow.addSubview(myWindowButton)
        
        // TextViewを作成する.
        let myTextView: UITextView = UITextView(frame: CGRectMake(10, 10, self.myWindow.frame.width - 20, 150))
        myTextView.backgroundColor = UIColor.clearColor()
        myTextView.text = "Swift（スウィフト）は、アップルのiOSおよびOS Xのためのプログラミング言語。Worldwide Developers Conference (WWDC) 2014で発表された。アップル製OS上で動作するアプリケーションの開発に従来から用いられていたObjective-CやObjective-C++、C言語と共存することが意図されている。"
        myTextView.font = UIFont.systemFontOfSize(CGFloat(15))
        myTextView.textColor = UIColor.blackColor()
        myTextView.textAlignment = NSTextAlignment.Left
        myTextView.editable = false
        
        self.myWindow.addSubview(myTextView)
    }
    
    /*
    ボタンイベント
    */
    internal func onClickMyButton(sender: UIButton) {
        
        if sender == myWindowButton {
            myWindow.hidden = true
        }
        else if sender == myButton {
            makeMyWindow()
        }
    }
}

// MARK:Actions
extension UIKit026 {
    
}
