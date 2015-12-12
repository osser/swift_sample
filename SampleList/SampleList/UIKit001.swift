//
//  UIKit001.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/11.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit
import Cartography

class UIKit001: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
        setup();
        layoutView();
    }
}

// MARK:初期化
extension UIKit001 {
    func setup(){
        view.backgroundColor = UIColor.midnightblue();
        
        // Labelを作成.
        let myLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,50));
        
        // 背景をオレンジ色にする.
        myLabel.backgroundColor = UIColor.orangeColor();
        
        // 枠を丸くする.
        myLabel.layer.masksToBounds = true;
        
        // コーナーの半径.
        myLabel.layer.cornerRadius = 20.0;
        
        // Labelに文字を代入.
        myLabel.text = "Hello Swift!!";
        
        // 文字の色を白にする.
        myLabel.textColor = UIColor.whiteColor();
        
        // 文字の影の色をグレーにする.
        myLabel.shadowColor = UIColor.grayColor();
        
        // Textを中央寄せにする.
        myLabel.textAlignment = NSTextAlignment.Center;
        
        // 配置する座標を設定する.
        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200);
                
        // ViewにLabelを追加.
        self.view.addSubview(myLabel);
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit001 {
    
}
