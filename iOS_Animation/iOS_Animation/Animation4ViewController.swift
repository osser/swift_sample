//
//  Animation4ViewController.swift
//  iOS_Animation
//
//  Created by xiaoma on 2015/12/09.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class Animation4ViewController: UIViewController {
    
    var plane:Animation4Plane!;
    
    init(){
        super.init(nibName: nil, bundle: nil);
        setup();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("未実装");
    }
}

// MARK:初期化
extension Animation4ViewController {
    func setup() {
        view.backgroundColor = UIColor.belizehole();
        
        plane = Animation4Plane();
        view.addSubview(plane.buildPlane(CGRect(x: 0, y: view.center.y, width: 170, height: 72)));
        
        buildButtonController("飛ぶ", center: CGPoint(x: view.center.x, y: view.frame.size.height - 120), bgColor: UIColor.asbestos(), clickHander:"btnFly_click:");
        buildCloseButton();
    }
}

// MARK:イベント
extension Animation4ViewController {
    func btnFly_click(sender:UIButton) {
        plane.start();
    }
}