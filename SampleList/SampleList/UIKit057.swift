//
//  UIKit057.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/21.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit057: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        // 画像の設定.
        let myImage:UIImage = UIImage(named:"background")!
        
        // リサイズされたUIImageを指定して、UIImageViewを作る.
        let myImageView = UIImageView(image: UIImage.UIKit057ResizeUIImage(myImage, width: self.view.frame.maxX, height: self.view.frame.maxY))
        
        // 透過する.
        myImageView.alpha = 0.05
        
        // viewにUIImageViewを追加.
        self.view.addSubview(myImageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UIImage{
    
    // Resizeのクラスメソッドを作る.
    class func UIKit057ResizeUIImage(image : UIImage,width : CGFloat, height : CGFloat)-> UIImage!{
        
        // 指定された画像の大きさのコンテキストを用意.
        UIGraphicsBeginImageContext(CGSizeMake(width, height))
        
        // コンテキストに画像を描画する.
        image.drawInRect(CGRectMake(0, 0, width, height))
        
        // コンテキストからUIImageを作る.
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // コンテキストを閉じる.
        UIGraphicsEndImageContext()
        
        return newImage
    }
}