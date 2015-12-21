//
//  UIKit039.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/21.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit039: UIViewController {

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
extension UIKit039 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.whiteColor();
        
        //  UITextFieldを生成.
        let myTextField: UITextField = UITextField(frame: CGRectMake(0, 0, 200, 30))
        
        // Delegateを設定.
        myTextField.delegate = self
        
        // 枠の線を表示.
        myTextField.borderStyle = UITextBorderStyle.RoundedRect
        
        // UITextFieldの表示する位置.
        myTextField.layer.position = CGPointMake(self.view.bounds.width/2, 100)
        
        // 入力された文字を非表示モードにする.
        myTextField.secureTextEntry = true
        
        // TextViewをviewに追加する.
        self.view.addSubview(myTextField)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit039: UITextFieldDelegate {
    
}

// MARK:Actions
extension UIKit039 {
    
}
