//
//  UIKit038.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/21.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit038: UIViewController {

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
extension UIKit038 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.whiteColor();
        
        //  UITextFieldを生成.
        let myTextField: UITextField = UITextField(frame: CGRectMake(0, 0, 200, 30))
        
        // 最初に表示する文字.
        myTextField.text = "Hi"
        
        // Delegateを設定.
        myTextField.delegate = self
        
        // 枠の線を表示.
        myTextField.borderStyle = UITextBorderStyle.RoundedRect
        
        // UITextFieldの表示する位置.
        myTextField.layer.position = CGPointMake(self.view.bounds.width/2, 100)
        
        // TextViewをviewに追加する.
        self.view.addSubview(myTextField)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit038: UITextFieldDelegate {
    /*
    UITextFieldが編集開始された直後に呼ばれる.
    */
    func textFieldDidBeginEditing(textField: UITextField) {
        print("textFieldDidBeginEditing: \(textField.text)")
    }
    
    /*
    テキストが編集された際に呼ばれる.
    */
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        // 文字数最大を決める.
        let maxLength: Int = 6
        
        // 入力済みの文字と入力された文字を合わせて取得.
        let str = textField.text! + string
        
        // 文字数がmaxLength以下ならtrueを返す.
        if "\(str)".characters.count < maxLength {
            return true
        }
        print("6文字を超えています")
        return false
    }
    
    /*
    UITextFieldが編集終了する直前に呼ばれる.
    */
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing: \(textField.text)")
        return true
    }
    
    /*
    改行ボタンが押された際に呼ばれる.
    */
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("textFieldShouldReturn: \(textField.text)")
        return true
    }
}

// MARK:Actions
extension UIKit038 {
    
}
