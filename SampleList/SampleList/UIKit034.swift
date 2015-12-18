//
//  UIKit034.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/18.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit034: UIViewController {

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
extension UIKit034 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.whiteColor();
        
        // UIViewを作成.
        let myBox = UIView(frame: CGRectMake(0,0,200,200))
        myBox.backgroundColor = UIColor.blackColor()
        myBox.layer.masksToBounds = true
        myBox.layer.cornerRadius = 20.0
        myBox.layer.position = self.view.center
        myBox.layer.zPosition = 1
        self.view.addSubview(myBox)
        
        // Labelを作成.
        let myLabel = UILabel(frame: CGRectMake(0,0,150,150))
        myLabel.backgroundColor = UIColor.grayColor()
        myLabel.layer.masksToBounds = true
        myLabel.layer.cornerRadius = 20.0
        myLabel.text = "Hello Swift!!"
        myLabel.textColor = UIColor.whiteColor()
        myLabel.shadowColor = UIColor.grayColor()
        myLabel.textAlignment = NSTextAlignment.Center
        myLabel.layer.position = self.view.center
        myLabel.layer.zPosition = 2
        self.view.addSubview(myLabel)
        
        //端末のｘ軸方向の傾きに応じてmyBoxの位置を変えるエフェクトを作成.
        let xAxis1 = UIInterpolatingMotionEffect(keyPath: "center.x", type: UIInterpolatingMotionEffectType.TiltAlongHorizontalAxis)
        xAxis1.minimumRelativeValue = -100.0
        xAxis1.maximumRelativeValue = 100.0
        
        //端末のy軸方向の傾きに応じてmyBoxの位置を変えるエフェクトを作成.
        let yAxis1 = UIInterpolatingMotionEffect(keyPath: "center.y", type: UIInterpolatingMotionEffectType.TiltAlongVerticalAxis)
        yAxis1.minimumRelativeValue = -100.0
        yAxis1.maximumRelativeValue = 100.0
        
        //モーションエフェクトのグループを作成.
        let group1 = UIMotionEffectGroup()
        group1.motionEffects = [xAxis1, yAxis1]
        
        //端末のｘ軸方向の傾きに応じてmyLabelの位置を変えるエフェクトを作成.
        let xAxis = UIInterpolatingMotionEffect(keyPath: "center.x", type: UIInterpolatingMotionEffectType.TiltAlongHorizontalAxis)
        xAxis.minimumRelativeValue = -50.0
        xAxis.maximumRelativeValue = 50.0
        
        //端末のy軸方向の傾きに応じてmyLabelの位置を変えるエフェクトを作成.
        let yAxis = UIInterpolatingMotionEffect(keyPath: "center.y", type: UIInterpolatingMotionEffectType.TiltAlongVerticalAxis)
        yAxis.minimumRelativeValue = -50.0
        yAxis.maximumRelativeValue = 50.0
        
        //モーションエフェクトのグループを作成.
        let group = UIMotionEffectGroup()
        group.motionEffects = [xAxis, yAxis]
        
        //myLabelにエフェクトを適用させる.
        myBox.addMotionEffect(group)
        myLabel.addMotionEffect(group1)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit034 {
    
}

// MARK:Actions
extension UIKit034 {
    
}
