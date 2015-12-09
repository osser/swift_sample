//
//  ViewController.swift
//  iOS_Animation
//
//  Created by xiaoma on 2015/12/09.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setup();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK:初期化
extension MainViewController {
    func setup() {
        view.backgroundColor = UIColor.greenSea();
        
        let height = 80;
        
        let center1:CGPoint = CGPoint(x: Int(view.center.x), y: height * 1);
        let center2:CGPoint = CGPoint(x: Int(view.center.x), y: height * 2);
        let center3:CGPoint = CGPoint(x: Int(view.center.x), y: height * 3);
        let center4:CGPoint = CGPoint(x: Int(view.center.x), y: height * 4);
        
        buildButtonController("Animation1", center: center1, bgColor: UIColor.midnightblue(), clickHander:"btnAnimation1_click:");
        buildButtonController("Animation2", center: center2, bgColor: UIColor.wisteria(), clickHander:"btnAnimation2_click:");
        buildButtonController("Animation3", center: center3, bgColor: UIColor.alizarin(), clickHander:"btnAnimation3_click:");
        buildButtonController("Animation4", center: center4, bgColor: UIColor.belizehole(), clickHander:"btnAnimation4_click:");
    }
}

// MARK:イベント処理
extension MainViewController {
    func btnAnimation1_click(sender: UIButton){
        let win = Animation1ViewController();
        openTheWindow(win);
    }

    func btnAnimation2_click(sender: UIButton){
        let win = Animation2ViewController();
        openTheWindow(win);
    }
    
    func btnAnimation3_click(sender: UIButton){
        let win = Animation3ViewController();
        openTheWindow(win);
    }
    
    func btnAnimation4_click(sender: UIButton){
        let win = Animation4ViewController();
        openTheWindow(win);
    }
    
    func openTheWindow(win:UIViewController){
        win.modalPresentationStyle = .OverCurrentContext;
        win.modalTransitionStyle = .CoverVertical;
        presentViewController(win, animated: true, completion: {});
    }
}