//
//  UIKit032.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/18.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit032: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setup();
        layoutView();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


// MARK:初期化
extension UIKit032 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.whiteColor();
        
        // インスタンス生成　styleはActionSheet.
        let myAlert = UIAlertController(title: "タイトル", message: "message", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        // アクションを生成.
        let myAction_1 = UIAlertAction(title: "Hello", style: UIAlertActionStyle.Default, handler: {
            (action: UIAlertAction!) in
            print("Hello")
        })
        
        let myAction_2 = UIAlertAction(title: "yes", style: UIAlertActionStyle.Destructive, handler: {
            (action: UIAlertAction!) in
            print("yes")
        })
        
        let myAction_3 = UIAlertAction(title: "no", style: UIAlertActionStyle.Cancel, handler: {
            (action: UIAlertAction!) in
            print("no")
        })
        
        // アクションを追加.
        myAlert.addAction(myAction_1)
        myAlert.addAction(myAction_2)
        myAlert.addAction(myAction_3)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit032 {
    
}

// MARK:Actions
extension UIKit032 {
    
}
