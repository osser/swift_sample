//
//  UIKit008.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/15.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit008: UIViewController {

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
extension UIKit008 {
    func setup(){
        view.backgroundColor = UIColor.whiteColor();
        
        // アラート表示の許可をもらう.
        let setting = UIUserNotificationSettings(forTypes: [.Sound, .Alert], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(setting)
        
        // すぐにNotificationを発火するボタンを作成する.
        let myNotificationButton: UIButton = UIButton(frame: CGRectMake(0,0,200,80))
        myNotificationButton.backgroundColor = UIColor.orangeColor()
        myNotificationButton.layer.masksToBounds = true
        myNotificationButton.setTitle("Notification", forState: .Normal)
        myNotificationButton.layer.cornerRadius = 20.0
        myNotificationButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:200)
        myNotificationButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        myNotificationButton.tag = 1
        
        // 時間をおいてNotificationを発火するボタンを作成する.
        let myNotificationFireButton: UIButton = UIButton(frame: CGRectMake(0,0,200,80))
        myNotificationFireButton.backgroundColor = UIColor.blueColor()
        myNotificationFireButton.layer.masksToBounds = true
        myNotificationFireButton.setTitle("Notification(Fire)", forState: .Normal)
        myNotificationFireButton.layer.cornerRadius = 20.0
        myNotificationFireButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:400)
        myNotificationFireButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        myNotificationFireButton.tag = 2
        
        // ViewにButtonを追加する.
        view.addSubview(myNotificationButton)
        view.addSubview(myNotificationFireButton)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit008 {
    /*
    ボタンイベント
    */
    internal func onClickMyButton(sender: UIButton){
        print("onClickMyButton")
        if sender.tag == 1 {
            showNotification()
        } else if sender.tag == 2 {
            showNotificationFire()
        }
    }
}

// MARK:Actions
extension UIKit008 {
    /*
    Show Notification
    */
    private func showNotification(){
        print("showNotification")
        
        // Notificationの生成する.
        let myNotification: UILocalNotification = UILocalNotification()
        
        // メッセージを代入する.
        myNotification.alertBody = "TEST"
        
        // Timezoneを設定をする.
        myNotification.timeZone = NSTimeZone.defaultTimeZone()
        
        // Notificationを表示する.
        UIApplication.sharedApplication().scheduleLocalNotification(myNotification)
    }
    
    /*
    Show Notification(10 sec後に発火)
    */
    private func showNotificationFire(){
        
        // Notificationの生成する.
        let myNotification: UILocalNotification = UILocalNotification()
        
        // メッセージを代入する.
        myNotification.alertBody = "TEST(Fire)"
        
        // 再生サウンドを設定する.
        myNotification.soundName = UILocalNotificationDefaultSoundName
        
        // Timezoneを設定する.
        myNotification.timeZone = NSTimeZone.defaultTimeZone()
        
        // 10秒後に設定する.
        myNotification.fireDate = NSDate(timeIntervalSinceNow: 10)
        
        // Notificationを表示する.
        UIApplication.sharedApplication().scheduleLocalNotification(myNotification)
    }
}