//
//  UIKit060.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/22.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit060: UIViewController {

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
extension UIKit060 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.whiteColor();
        
        // 1つ目のUIImageを作る.
        var myImage1 = UIImage(named: "background")!
        
        // リサイズする.
        myImage1 = UIImage.UIKit060ResizeUIImage(myImage1,width: self.view.frame.maxX, height: self.view.frame.maxY)
        
        // 2つ目のUIImageを作る.
        var myImage2 = UIImage(named: "playground")!
        
        // リサイズする.
        myImage2 = UIImage.UIKit060ResizeUIImage(myImage2,width: self.view.frame.midX, height: self.view.frame.midY)

        // 画像を合成する.
        let ComposedImage = UIImage.UIKit060ComposeUIImage([myImage1, myImage2], width: self.view.frame.maxX, height: self.view.frame.maxY)

        // UIImageViewに合成されたUIImageを指定する.
        let myImageView = UIImageView(image: ComposedImage)
        
        self.view.addSubview(myImageView)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit060 {
    
}

// MARK:Actions
extension UIKit060 {
    
}


extension UIImage{
    
    /*
    画像をResizeするクラスメソッド.
    */
    class func UIKit060ResizeUIImage(image : UIImage,width : CGFloat, height : CGFloat) -> UIImage!{
        
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
    
    /*
    画像を合成するクラスメソッド.
    */
    class func UIKit060ComposeUIImage(list:[UIImage], width:CGFloat, height:CGFloat) -> UIImage! {
        
        // 指定された画像の大きさのコンテキストを用意.
        UIGraphicsBeginImageContext(CGSizeMake(width, height))
        
        // UIImageのある分回す.
        for image : UIImage in list {
            
            // コンテキストに画像を描画する.
            image.drawInRect(CGRectMake(0, 0, image.size.width, image.size.height))
        }
        
        // コンテキストからUIImageを作る.
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // コンテキストを閉じる.
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
