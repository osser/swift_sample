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
        
        buildButtonController("Animation1", center:view.center, bgColor: UIColor.emerald(), clickHander:"btnAnimation1_click:");
    }
    
    func buildButtonController(title: String, center: CGPoint, bgColor: UIColor, clickHander: Selector){
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50));
        button.center = center;
        button.setTitle(title, forState: .Normal);
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal);
        button.backgroundColor = bgColor;
        
        button.addTarget(self, action: clickHander, forControlEvents: .TouchUpInside);
        
        view.addSubview(button);
    }
}

// MARK:イベント処理
extension MainViewController {
    func btnAnimation1_click(sender: UIButton){
        print("btnAnimation1_click");
        let win = Animation1ViewController();
        presentViewController(win, animated: true, completion: {});
    }
}