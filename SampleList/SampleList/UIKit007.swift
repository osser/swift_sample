//
//  UIKit007.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/15.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit007: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup();
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
extension UIKit007 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.whiteColor();
        
        // 小さめのフォントの文字列をラベルに表示する.
        let mySmallLabel: UILabel = UILabel()
        mySmallLabel.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
        mySmallLabel.text = "小さめのフォントサイズ"
        mySmallLabel.frame = CGRect(x: 25, y: 0, width: 300, height: 150)
        self.view.addSubview(mySmallLabel)
        
        // システムの標準フォントサイズの文字列をラベルに表示する.
        let myNormalLabel: UILabel = UILabel()
        myNormalLabel.font = UIFont.systemFontOfSize(UIFont.systemFontSize())
        myNormalLabel.text = "システム標準のフォントサイズ"
        myNormalLabel.frame = CGRect(x: 25, y: 30, width: 200, height: 150)
        self.view.addSubview(myNormalLabel)
        
        // UIButton用のフォントサイズの文字列をラベルに表示する.
        let myButtonLabel: UILabel = UILabel()
        myButtonLabel.font = UIFont.systemFontOfSize(UIFont.buttonFontSize())
        myButtonLabel.text = "UIButtonのフォントサイズ"
        myButtonLabel.frame = CGRect(x: 25, y: 60, width: 300, height: 150)
        self.view.addSubview(myButtonLabel)
        
        // カスタムしたフォントサイズ(20)の文字列をラベルに表示する.
        let myCustomLabel: UILabel = UILabel()
        myCustomLabel.font = UIFont.systemFontOfSize(CGFloat(20))
        myCustomLabel.text = "ポイント20のフォントサイズ"
        myCustomLabel.frame = CGRect(x: 25, y: 90, width: 300, height: 150)
        self.view.addSubview((myCustomLabel))
        
        // Italic System Fontの文字列をラベルに表示する.
        let myItalicLabel: UILabel = UILabel()
        myItalicLabel.font = UIFont.italicSystemFontOfSize(UIFont.labelFontSize())
        myItalicLabel.text = "Italicフォント"
        myItalicLabel.frame = CGRect(x: 25, y: 150, width: 300, height: 150)
        self.view.addSubview(myItalicLabel)
        
        // Boldの文字列をラベルに表示する.
        let myBoldLabel: UILabel = UILabel()
        myBoldLabel.font = UIFont.boldSystemFontOfSize(UIFont.labelFontSize())
        myBoldLabel.text = "Boldフォント"
        myBoldLabel.frame = CGRect(x: 25, y: 180, width: 300, height: 150)
        self.view.addSubview(myBoldLabel)
        
        // Arialの文字列をラベルに表示する.
        let myAlialLabel: UILabel = UILabel()
        myAlialLabel.font = UIFont(name:"ArialHebew", size:UIFont.labelFontSize())
        myAlialLabel.text = "ArialHebrew"
        myAlialLabel.frame = CGRect(x: 25, y: 230, width: 300, height: 150)
        self.view.addSubview(myAlialLabel)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit007 {
    
}
