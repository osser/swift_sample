//
//  UIKit033.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/18.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit033: UIViewController {

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
extension UIKit033 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.whiteColor();
        
        // 背景を青色に設定.
        self.view.backgroundColor = UIColor.cyanColor()
        
        // TextField作成.
        let myTextField: UITextField = UITextField(frame: CGRectMake(0, 0, 200, 30))
        myTextField.text = "Hello Swift!"
        myTextField.delegate = self
        myTextField.borderStyle = UITextBorderStyle.RoundedRect
        myTextField.layer.position = CGPointMake(self.view.frame.width/2, 200)
        
        // TextFieldをviewに追加.
        self.view.addSubview(myTextField)
        
        // MenuController生成.
        let myMenuController: UIMenuController = UIMenuController.sharedMenuController()
        
        // MenuControllerを表示.
        myMenuController.menuVisible = true
        
        // 矢印の向きを下に設定.
        myMenuController.arrowDirection = UIMenuControllerArrowDirection.Down
        
        // rect、viewを設定.
        myMenuController.setTargetRect(CGRectZero, inView: self.view)
        
        
        // MenuItem生成.
        let myMenuItem_1: UIMenuItem = UIMenuItem(title: "Menu1", action: "onMenu1:")
        let myMenuItem_2: UIMenuItem = UIMenuItem(title: "Menu2", action: "onMenu2:")
        let myMenuItem_3: UIMenuItem = UIMenuItem(title: "Menu3", action: "onMenu3:")
        
        // MenuItemを配列に格納.
        let myMenuItems: [UIMenuItem] = [myMenuItem_1, myMenuItem_2, myMenuItem_3]
        
        // MenuControllerにMenuItemを追加.
        myMenuController.menuItems = myMenuItems;// as [AnyObject]
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit033: UITextFieldDelegate {
    /*
    UITextFieldが編集開始された直後に呼ばれる.
    */
    func textFieldDidBeginEditing(textField: UITextField) {
        print("textFieldDidBeginEditing:\(textField.text)")
    }
    
    /*
    UITextFieldが編集終了する直前に呼ばれる.
    */
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing:\(textField.text)")
        return true
    }
    
    /*
    作成したMenuItemが表示されるようにする.
    */
    override func canPerformAction(action: Selector, withSender sender: AnyObject!) -> Bool {
        if action == "onMenu1:" || action == "onMenu2:" || action == "onMenu3:" {
            return true
        }
        return false
    }
    
    /*
    作成したMenuItemが押された際に呼び出される.
    */
    internal func onMenu1(sender: UIMenuItem) {
        print("onMenu1")
    }
    
    internal func onMenu2(sender: UIMenuItem) {
        print("onMenu2")
    }
    
    internal func onMenu3(sender: UIMenuItem) {
        print("onMenu3")
    }
}

// MARK:Actions
extension UIKit033 {
    
}
