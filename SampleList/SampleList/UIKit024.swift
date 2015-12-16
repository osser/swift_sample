//
//  UIKit024.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/16.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit024: UIViewController {

    private var myActivityIndicator: UIActivityIndicatorView!
    private var myButton: UIButton!
    
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
extension UIKit024 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");

        self.view.backgroundColor = UIColor.midnightblue()
        
        // インジケータを作成する.
        myActivityIndicator = UIActivityIndicatorView()
        myActivityIndicator.frame = CGRectMake(0, 0, 50, 50)
        myActivityIndicator.center = self.view.center
        
        // アニメーションが停止している時もインジケータを表示させる.
        myActivityIndicator.hidesWhenStopped = false
        myActivityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.White
        
        // アニメーションを開始する.
        myActivityIndicator.startAnimating()
        
        // インジケータをViewに追加する.
        self.view.addSubview(myActivityIndicator)
        
        // ボタンを生成する.
        myButton = UIButton(frame: CGRectMake(0, 0, 60, 60))
        myButton.backgroundColor = UIColor.redColor()
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 30.0
        myButton.setTitle("Stop", forState: .Normal)
        myButton.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height-50)
        myButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        // ボタンをViewに追加する.
        self.view.addSubview(myButton)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit024 {
    /*
    ボタンイベント.
    */
    internal func onClickMyButton(sender: UIButton){
        if myActivityIndicator.isAnimating() {
            myActivityIndicator.stopAnimating()
            myButton.setTitle("Start", forState: .Normal)
            myButton.backgroundColor = UIColor.blueColor()
        }
        else {
            myActivityIndicator.startAnimating()
            myButton.setTitle("Stop", forState: .Normal)
            myButton.backgroundColor = UIColor.redColor()
        }
    }
}

// MARK:Actions
extension UIKit024 {
    
}
