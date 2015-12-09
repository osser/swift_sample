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
        
        buildButtonController("Animation1", center: CGPoint(x: view.center.x, y: view.center.y / 2), bgColor: UIColor.emerald(), clickHander:"btnAnimation1_click:");
        buildButtonController("Animation2", center:view.center, bgColor: UIColor.wisteria(), clickHander:"btnAnimation2_click:");
        buildButtonController("Animation3", center: CGPoint(x: view.center.x, y: view.center.y * 3 / 2), bgColor: UIColor.alizarin(), clickHander:"btnAnimation3_click:");
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
    
    func openTheWindow(win:UIViewController){
        win.modalPresentationStyle = .OverCurrentContext;
        win.modalTransitionStyle = .CoverVertical;
        presentViewController(win, animated: true, completion: {});
    }
}