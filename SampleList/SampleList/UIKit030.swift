//
//  UIKit030.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/16.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit030: UIViewController {
    
    private let myStepLabel: UILabel = UILabel(frame: CGRectMake(0,0,150,150))
    
    override func viewDidLoad() {
        super.viewDidLoad();
        setup();
        layoutView();
    }
}

// MARK:初期化
extension UIKit030 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.whiteColor();
        
        // Stepperの作成する.
        let myStepper: UIStepper = UIStepper()
        myStepper.center = CGPointMake(self.view.frame.width/2, 400)
        myStepper.backgroundColor = UIColor.grayColor()
        myStepper.tintColor = UIColor.whiteColor()
        myStepper.addTarget(self, action: "stepperOneChanged:", forControlEvents: UIControlEvents.ValueChanged)
        
        // 最小値, 最大値, 規定値の設定をする.
        myStepper.minimumValue = 0
        myStepper.maximumValue = 100
        myStepper.value = 50
        
        // ボタンを押した際に動く値の.を設定する.
        myStepper.stepValue = 10
        
        // Viewに追加する.
        self.view.addSubview(myStepper)
        
        // Labelを作成する.
        myStepLabel.backgroundColor = UIColor.blueColor()
        myStepLabel.layer.masksToBounds = true
        myStepLabel.layer.cornerRadius = 75.0
        myStepLabel.textColor = UIColor.whiteColor()
        myStepLabel.shadowColor = UIColor.grayColor()
        myStepLabel.font = UIFont.systemFontOfSize(CGFloat(30))
        myStepLabel.textAlignment = NSTextAlignment.Center
        myStepLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)
        myStepLabel.text = "\(myStepper.value)"
        
        // Viewの背景色を青にする.
        self.view.backgroundColor = UIColor.cyanColor()
        
        // viewにLabelを追加.
        self.view.addSubview(myStepLabel)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit030 {
    /*
    Stepperの値が変わったときに呼び出される.
    */
    internal func stepperOneChanged(stepper: UIStepper){
        myStepLabel.text = "\(stepper.value)"
    }
}

// MARK:Actions
extension UIKit030 {
    
}
