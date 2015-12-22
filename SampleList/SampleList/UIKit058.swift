//
//  UIKit058.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/22.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit058: UIViewController {

    var myImageView : UIImageView?
    
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
extension UIKit058 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.whiteColor();
        
        // ラスタライズ化の初期化値.
        let initRasterizeValue : CGFloat = 1.0
        
        // スライダーを用意.
        let rasterizeSlider = UISlider()
        rasterizeSlider.layer.position = CGPointMake(self.view.frame.midX, self.view.frame.maxY - 50)
        rasterizeSlider.layer.zPosition = 1
        rasterizeSlider.minimumValue = 0.1
        rasterizeSlider.maximumValue = 1.0
        rasterizeSlider.value = Float(1.0 - initRasterizeValue)
        rasterizeSlider.addTarget(self, action: "onValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(rasterizeSlider)
        
        // UIImageを作る.
        let myImage = UIImage(named: "background")!
        
        // リサイズされたUIImageを指定して、UIImageViewを作る.
        myImageView = UIImageView(image: UIImage.UIKit058ResizeUIImage(myImage, width: self.view.frame.maxX, height: self.view.frame.maxY))
        
        if myImageView != nil {
            
            // ラスタライズ化する.
            myImageView!.layer.shouldRasterize = true
            
            // 値の初期化.
            myImageView!.layer.rasterizationScale = initRasterizeValue
            
            self.view.addSubview(myImageView!)
        }
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit058 {
    /*
    Sliderの値が変わった時に呼ばれるメソッド.
    */
    func onValueChanged(slider : UISlider){
        
        if myImageView != nil {
            
            // ラスタライズ化する.
            myImageView!.layer.rasterizationScale = CGFloat(1.1 - slider.value)
        }
    }
}

// MARK:Actions
extension UIKit058 {
    
}


extension UIImage{
    
    // 画像をResizeするクラスメソッド.
    class func UIKit058ResizeUIImage(image : UIImage, width : CGFloat, height : CGFloat)-> UIImage!{
        
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