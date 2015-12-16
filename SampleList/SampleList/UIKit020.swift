//
//  UIKit020.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/16.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit020: UIViewController {

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
extension UIKit020 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");

        view.backgroundColor = UIColor.whiteColor();
        
        // 背景を灰色に設定する.
        self.view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        
        // TextView生成する.
        let myTextView: UITextView = UITextView(frame: CGRectMake(10, navigationBarHeight + ViewManager.statusBarHeight, self.view.frame.width - 20, 400))
        
        // TextViewの背景を黃色に設定する.
        myTextView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 1, alpha: 1.0)
        
        // 表示させるテキストを設定する.
        myTextView.text = "1234567890abcdefghijklmnopqrstuwxyz 1234567890 abcdefghijklmnopqrstuwxyz \na\nb\nc\ndefghijklmnopqrstuwxyz \n http://www.gclue.com\n"
        
        // 角に丸みをつける.
        myTextView.layer.masksToBounds = true
        
        // 丸みのサイズを設定する.
        myTextView.layer.cornerRadius = 20.0
        
        // 枠線の太さを設定する.
        myTextView.layer.borderWidth = 1
        
        // 枠線の色を黒に設定する.
        myTextView.layer.borderColor = UIColor.blackColor().CGColor
        
        // フォントの設定をする.
        myTextView.font = UIFont.systemFontOfSize(CGFloat(20))
        
        // フォントの色の設定をする.
        myTextView.textColor = UIColor.blackColor()
        
        // 左詰めの設定をする.
        myTextView.textAlignment = NSTextAlignment.Left
        
        // リンク、日付などを自動的に検出してリンクに変換する.
        myTextView.dataDetectorTypes = UIDataDetectorTypes.All
        
        // 影の濃さを設定する.
        myTextView.layer.shadowOpacity = 0.5
        
        // テキストを編集不可にする.
        myTextView.editable = false
        
        // TextViewをViewに追加する.
        self.view.addSubview(myTextView)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit020 {
    
}

// MARK:Actions
extension UIKit020 {
    
}
