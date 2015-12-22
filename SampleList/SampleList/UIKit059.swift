//
//  UIKit059.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/22.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit059: UIViewController {

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
extension UIKit059 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.whiteColor();
        
        // 背景を黒色に設定.
        self.view.backgroundColor = UIColor.blackColor()
        
        // リサイズ対象のUIImageを用意.
        let myImage = UIImage(named: "background")!
        
        // リサイズ後のUIImageを用意.
        let resize = myImage.UIKit059ResizeUIImage(self.view.frame.midX, height: self.view.frame.midY)
        
        // UIImageViewにリサイズ後のUIImageを設定.
        let myImageView = UIImageView(image: resize)
        
        myImageView.layer.position = CGPointMake(self.view.frame.midX, self.view.frame.midY)
        
        self.view.addSubview(myImageView)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit059 {
    
}

// MARK:Actions
extension UIKit059 {
    
}

extension UIImage{
    
    // Resizeするクラスメソッド.
    func UIKit059ResizeUIImage(width : CGFloat, height : CGFloat)-> UIImage!{
        
        // 指定された画像の大きさのコンテキストを用意.
        UIGraphicsBeginImageContext(CGSizeMake(width, height))
        
        // コンテキストに自身に設定された画像を描画する.
        self.drawInRect(CGRectMake(0, 0, width, height))
        
        // コンテキストからUIImageを作る.
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // コンテキストを閉じる.
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
}