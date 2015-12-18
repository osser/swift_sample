//
//  UIKit037.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/18.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit037: UIViewController {

    private var cnt : Float = 0
    private var myLabel : UILabel!
    private var ButtonCnt: Int = 0
    private var TimerMergin: Float = 0
    private var ignoreBegineTime: Float = 0
    
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
extension UIKit037 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.whiteColor();
        
        // UIButtonを作る.
        let myButton: UIButton = UIButton()
        myButton.frame = CGRectMake(0, 0, 200, 50)
        myButton.layer.cornerRadius = 20.0
        myButton.layer.position = CGPointMake(self.view.frame.width/2, 400)
        myButton.backgroundColor = UIColor.redColor()
        myButton.setTitle("有効/無効", forState: .Normal)
        myButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        // タイマー用ラベルを作る.
        myLabel = UILabel(frame: CGRectMake(0,0,200,50))
        myLabel.backgroundColor = UIColor.orangeColor()
        myLabel.layer.masksToBounds = true
        myLabel.layer.cornerRadius = 20.0
        myLabel.text = "Time:\(Int(cnt))"
        myLabel.textColor = UIColor.whiteColor()
        myLabel.shadowColor = UIColor.grayColor()
        myLabel.textAlignment = NSTextAlignment.Center
        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)
        self.view.backgroundColor = UIColor.cyanColor()
        
        // viewにラベルとボタンを追加.
        self.view.addSubview(myLabel)
        self.view.addSubview(myButton)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit037 {
    //NSTimerIntervalで指定された秒数毎に呼び出されるメソッド.
    internal func onUpdate(timer : NSTimer){
        
        cnt += 0.1
        
        //桁数を指定して文字列を作る.
        let str = "Time: \(Int(cnt))"
        myLabel.text = str
        
        // 現在のタイマー時間から無効が始まった時間の差.
        TimerMergin = cnt - ignoreBegineTime
        
        // タッチイベントが無効のとき.
        if UIApplication.sharedApplication().isIgnoringInteractionEvents() {
            
            // 無効になってから5秒経った時.
            if Int(TimerMergin) == 5 {
                
                print("タッチイベントが無効です")
                self.view.backgroundColor = UIColor.cyanColor()
                
                // タッチイベントを有効にする.
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                print("タッチイベントを有効にしました")
            }
        }
    }
    
    internal func onClickMyButton(sender: UIButton) {
        
        // ボタンを押した回数.
        ButtonCnt += 1
        
        // タッチイベントが有効のとき.
        if UIApplication.sharedApplication().isIgnoringInteractionEvents() == false {
            
            print("タッチイベントが有効です")
            self.view.backgroundColor = UIColor.greenColor()
            
            // タッチイベントを無効にする.
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            // 無効が始まった時間を取得.
            ignoreBegineTime = cnt
            
            print("タッチイベントを無効にしました")
            print("5秒後に有効になります")
            
            // 最初にボタンを押したときだけタイマーを作る.
            if ButtonCnt == 1 {
                
                // タイマーを作る.
                // 更新のインターバル(0.1秒).
                NSTimer.scheduledTimerWithTimeInterval(0.1,
                    
                    // そのクラスのメソッドか.
                    target: self,
                    
                    // メソッド.
                    selector: "onUpdate:",
                    userInfo: nil,
                    
                    // 何回も呼び出すかどうか.
                    repeats: true)
            }
        }
    }
}

// MARK:Actions
extension UIKit037 {
    
}
