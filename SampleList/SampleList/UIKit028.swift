//
//  UIKit028.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/16.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit028: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad();
        setup();
        layoutView();
    }
}

// MARK:初期化
extension UIKit028 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        // 背景色を黒色にする.
        self.view.backgroundColor = UIColor.midnightblue()
        
        // ProgressViewを作成する.
        let myProgressView: UIProgressView = UIProgressView(frame: CGRectMake(0, 0, 200, 10))
        myProgressView.progressTintColor = UIColor.greenColor()
        myProgressView.trackTintColor = UIColor.whiteColor()
        
        // 座標を設定する.
        myProgressView.layer.position = CGPoint(x: self.view.frame.width/2, y: 200)
        
        // バーの高さを設定する(横に1.0倍,縦に2.0倍).
        myProgressView.transform = CGAffineTransformMakeScale(1.0, 2.0)
        
        // 進捗具合を設定する(0.0~1.0).
        myProgressView.progress = 0.3
        
        // アニメーションを付ける.
        myProgressView.setProgress(1.0, animated: true)
        
        // Viewに追加する.
        self.view.addSubview(myProgressView)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit028 {
    
}

// MARK:Actions
extension UIKit028 {
    
}
