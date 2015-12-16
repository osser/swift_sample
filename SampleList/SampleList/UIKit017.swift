//
//  UIKit017.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/16.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit017: UIViewController {

    private var myLeftButton: UIBarButtonItem!
    private var myRightButton: UIBarButtonItem!
    
    private var myCloseButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
extension UIKit017 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");

        view.backgroundColor = UIColor.whiteColor();
        
        // 背景色をCyanに設定する.
        self.view.backgroundColor = UIColor.cyanColor()
        
        // NavigationControllerのタイトルを設定する.
        self.title = "My Navigation"
        
        // 左ボタンを作成する..
        myLeftButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "onClickMyButton:")
        
        // 右ボタンを作成する.
        myRightButton = UIBarButtonItem(title: "RightBtn", style: .Plain, target: self, action: "onClickMyButton:")
        
        // Closeボタン
        myCloseButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "onClickMyButton:");
            
        // tagを設定する.
        myLeftButton.tag = 1
        myRightButton.tag = 2
        myCloseButton.tag = 3
        
        // ナビゲーションバーの左に設置する.
        //self.navigationItem.leftBarButtonItem = myLeftButton
        self.navigationItem.leftBarButtonItems = [myCloseButton, myLeftButton];
        
        // ナビゲーションバーの右に設置する.
        self.navigationItem.rightBarButtonItem = myRightButton
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit017 {
    /*
    ボタンイベント.
    */
    internal func onClickMyButton(sender: UIButton){
        
        switch(sender.tag){
            
            // 背景色を青色に変える.
        case 1:
            self.view.backgroundColor = UIColor.blueColor()
            
            // 背景色を赤色に変える.
        case 2:
            self.view.backgroundColor = UIColor.redColor()
            
        case 3:
            popWindow(self);

        default:
            print("error")
        }
    }
}

// MARK:Actions
extension UIKit017 {
    
}
