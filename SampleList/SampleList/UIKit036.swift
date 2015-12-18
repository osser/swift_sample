//
//  UIKit036.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/18.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit036: UIViewController {

    private var myView: UIView!
    private var myButton: UIButton!
    
    // View切り替え用フラグ.
    var viewFlag = true
    
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
extension UIKit036 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.midnightblue();
        
        // myViewを生成.
        myView = UIView(frame: self.view.frame)
        myView.backgroundColor = UIColor.orangeColor()
        myView.hidden = true
        myView.layer.position = CGPointMake(self.view.frame.width/2, self.view.frame.height/2)
        
        // ボタンを生成.
        myButton = UIButton(frame: CGRectMake(0, 0, 100, 50))
        myButton.backgroundColor = UIColor.redColor()
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 20.0
        myButton.setTitle("Transition", forState: .Normal)
        myButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        myButton.layer.position = CGPointMake(self.view.frame.width/2, self.view.frame.height/2)
        myButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        // self.viewにmyViewを追加.
        self.view.addSubview(myView)
        
        // self.viewにボタンを追加.
        self.view.addSubview(myButton)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit036 {
    /*
    ボタンイベント
    */
    internal func onClickMyButton(sender: UIButton) {
        
        // フラグがtrue.
        if viewFlag {
            
            // アニメーション処理.
            // どのviewからtransitionするか.
            UIView.transitionFromView(self.view,
                
                // transition先のview.
                toView: myView,
                
                // 秒数(1秒).
                duration: 1.0,
                
                // transitionを設定.
                options: UIViewAnimationOptions.TransitionCurlUp,
                
                // アニメーション完了時の処理.
                completion: { (Bool) -> Void in
                    
                    print("self.view -> myView")
                    
                    // myViewを表示.
                    self.myView.hidden = false
                    
                    // myViewにボタンを追加.
                    self.myView.addSubview(self.myButton)
            })
            // フラグを折る.
            viewFlag = false
            
        } else {
            UIView.transitionFromView(myView,
                toView: self.view,
                duration: 1.0,
                options: UIViewAnimationOptions.TransitionFlipFromLeft,
                completion: { (Bool) -> Void in
                    
                    print("myView -> self.view")
                    
                    // self.viewにボタンを追加.
                    self.view.addSubview(self.myButton)
            })
            // フラグを立てる.
            viewFlag = true
        }
    }
}

// MARK:Actions
extension UIKit036 {
    
}
