//
//  UIKit035.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/18.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit035: UIViewController {

    private var effectView : UIVisualEffectView!
    private var mySegcon : UISegmentedControl!
    
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
extension UIKit035 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.whiteColor();
        
        // 背景画像を生成.
        let image = UIImage(named: "background")
        let imageView = UIImageView(frame: self.view.bounds)
        imageView.image = image
        self.view.addSubview(imageView)
        
        // SegmentedControlを生成.
        mySegcon = UISegmentedControl(items: ["Dark", "ExtraLight", "Light"])
        mySegcon.center = CGPointMake(self.view.center.x, self.view.bounds.maxY - 50)
        mySegcon.backgroundColor = UIColor.grayColor()
        mySegcon.tintColor = UIColor.whiteColor()
        mySegcon.addTarget(self, action: "onClickMySegmentedControl:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(mySegcon)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit035 {
    /*
    エフェクトを適用する.
    */
    internal func addVirtualEffectView(effect : UIBlurEffect!){
        
        if effectView != nil {
            effectView.removeFromSuperview()
        }
        
        // Blurエフェクトを適用するEffectViewを作成.
        effectView = UIVisualEffectView(effect: effect)
        effectView.frame = CGRectMake(0, 0, 200, 400)
        effectView.layer.position = CGPointMake(mySegcon.bounds.midX, -(effectView.frame.midY + 20) )
        effectView.layer.masksToBounds = true
        effectView.layer.cornerRadius = 20.0
        mySegcon.addSubview(effectView)
    }
    
    /*
    SegmentedControlの値が変わった時に呼び出されるメソッド.
    */
    internal func onClickMySegmentedControl(sender : UISegmentedControl){
        
        var effect : UIBlurEffect!
        
        switch sender.selectedSegmentIndex {
            
        case 0:
            // LightなBlurエフェクトを作る.
            effect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
            
        case 1:
            // DarkなBlurエフェクトを作る.
            effect = UIBlurEffect(style: UIBlurEffectStyle.Light)
            
        case 2:
            // ExtraLightなBlurエフェクトを作る.
            effect = UIBlurEffect(style: UIBlurEffectStyle.ExtraLight)
            
        default:
            print("Error")
        }
        
        self.addVirtualEffectView(effect)
    }
}

// MARK:Actions
extension UIKit035 {
    
}
