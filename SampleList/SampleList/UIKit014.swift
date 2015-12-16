//
//  UIKit014.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/16.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit
import Cartography
import LatoFont

class UIKit014: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup();
        layoutView();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK:初期化
extension UIKit014 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");

        view.backgroundColor = UIColor.whiteColor();
        
        // 画像を設定する.
        let myImage: UIImage = UIImage(named: "facebook")!;
        
        let headerHeight = navigationBarHeight;
        
        // 画像を縮小する.
        let myScaleDownView: UIImageView = UIImageView(frame:  CGRect(x: 100, y: 30+headerHeight, width: 80, height: 80))
        
        // UIImageViewに画像を設定する.
        myScaleDownView.image = myImage
        
        // 縮小用(0.5倍)のアフィン行列を生成する.
        myScaleDownView.transform = CGAffineTransformMakeScale(0.5, 0.5)
        
        // Viewに追加する.
        self.view.addSubview(myScaleDownView)
        
        
        // 画像を拡大する.
        let myScaleUpView: UIImageView = UIImageView(frame:  CGRect(x: 100, y: 120+headerHeight, width: 80, height: 80))
        
        // UIImageViewに画像を設定する.
        myScaleUpView.image = myImage
        
        // 縮小用(0.5倍)のアフィン行列を生成する.
        myScaleUpView.transform = CGAffineTransformMakeScale(1.5, 1.5)
        
        // Viewに追加する.
        self.view.addSubview(myScaleUpView)
        
        
        // 画像を回転する.
        let myRotateView:UIImageView = UIImageView(frame: CGRect(x: 100, y: 250+headerHeight, width: 80, height: 80))
        
        // UIImageViewに画像を設定する.
        myRotateView.image = myImage
        
        // radianで回転角度を指定(30度)する.
        let angle:CGFloat = CGFloat((30.0 * M_PI) / 180.0)
        
        // 回転用のアフィン行列を生成する.
        myRotateView.transform = CGAffineTransformMakeRotation(angle)
        
        // Viewに張りつけ.
        self.view.addSubview(myRotateView)
        
        
        // 画像を反転する.
        let myReverseView: UIImageView = UIImageView(frame:  CGRect(x: 100, y: 360+headerHeight, width: 80, height: 80))
        
        // 画像を設定する.
        myReverseView.image = myImage
        
        // 縮小用(0.5倍)のアフィン行列を生成する.
        myReverseView.transform = CGAffineTransformScale(myReverseView.transform, -1.0, 1.0)
        
        // Viewに追加する.
        self.view.addSubview(myReverseView)
    }
    func layoutView(){
    }
}

// MARK:イベント
extension UIKit014 {
    
}

// MARK:Actions
extension UIKit014 {
    
}
