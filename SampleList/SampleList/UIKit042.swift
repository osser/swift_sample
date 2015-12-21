//
//  UIKit042.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/21.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit042: UIViewController {

    var InputStr:String!;
    
    // 入力できる最大文字数.
    let maxLength: Int = 6;
    
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
extension UIKit042 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.whiteColor();
        
        let myButton = UIButton(frame: CGRectMake(0, 0, 200, 40))
        myButton.layer.position = CGPointMake(self.view.frame.width/2, 200)
        myButton.layer.cornerRadius = 20.0
        myButton.backgroundColor = UIColor.redColor()
        myButton.setTitle("UIAlertを発動", forState: .Normal)
        myButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(myButton)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit042 {
    func onClickMyButton(sender: UIButton) {
        
        // Alert生成.
        let myAlert: UIAlertController = UIAlertController(title: "title", message: "6文字以下で入力", preferredStyle: UIAlertControllerStyle.Alert)
        
        
        // OKアクション生成.
        let OkAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (action: UIAlertAction!) -> Void in
            print("OK")
        }
        
        // Cancelアクション生成.
        let CancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Destructive) { (action: UIAlertAction!) -> Void in
            print("Cancel")
        }
        
        // AlertにTextFieldを追加.
        myAlert.addTextFieldWithConfigurationHandler { (textField: UITextField!) -> Void in
            
            // NotificationCenterを生成.
            let myNotificationCenter = NSNotificationCenter.defaultCenter()
            
            // textFieldに変更があればchangeTextFieldメソッドに通知.
            myNotificationCenter.addObserver(self, selector: "changeTextField:", name: UITextFieldTextDidChangeNotification, object: nil)
        }
        
        // Alertにアクションを追加.
        myAlert.addAction(OkAction)
        myAlert.addAction(CancelAction)
        
        // Alertを発動する.
        presentViewController(myAlert, animated: true, completion: nil)
    }
    
    func changeTextField (sender: NSNotification) {
        
        let textField = sender.object as! UITextField
        
        // 入力された文字を取得.
        InputStr = textField.text
        
        // 入力された文字が6文字を超えたら入力を制限.
        if "\(InputStr)".characters.count < maxLength {
            textField.enabled = true
            
            // 入力された文字を表示.
            print(textField.text)
        } else {
            textField.enabled = false
            print("6文字を超えています")
        }
    }
}

// MARK:Actions
extension UIKit042 {
    
}
