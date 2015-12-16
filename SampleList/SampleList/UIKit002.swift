//
//  UIKit002.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/12.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit002: UIViewController {
    
    private var myButton: UIButton!;

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
extension UIKit002 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.whiteColor();
        
        // Buttonを生成する.
        myButton = UIButton();
        
        // サイズを設定する.
        myButton.frame = CGRectMake(0,0,200,40);
        
        // 背景色を設定する.
        myButton.backgroundColor = UIColor.midnightblue();
        
        // 枠を丸くする.
        myButton.layer.masksToBounds = true;
        
        // タイトルを設定する(通常時).
        myButton.setTitle("ボタン(通常)", forState: UIControlState.Normal);
        myButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal);
        
        // タイトルを設定する(ボタンがハイライトされた時).
        myButton.setTitle("ボタン(押された時)", forState: UIControlState.Highlighted);
        myButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted);
        
        // コーナーの半径を設定する.
        myButton.layer.cornerRadius = 20.0;
        
        // ボタンの位置を指定する.
        myButton.layer.position = CGPoint(x: self.view.frame.width/2, y:200);
        
        // タグを設定する.
        myButton.tag = 1;
        
        // イベントを追加する.
        myButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside);
        
        // ボタンをViewに追加する.
        self.view.addSubview(myButton);
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit002 {
    func onClickMyButton(sender: UIButton) {
        print("onClickMyButton:")
        print("sender.currentTitile: \(sender.currentTitle)")
        print("sender.tag:\(sender.tag)")
    }
}
