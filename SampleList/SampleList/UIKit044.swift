//
//  UIKit044.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/21.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit044: UIViewController {
    
    var mySecondWindow: UIWindow!

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
extension UIKit044 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.whiteColor();
        
        let screen: NSArray = UIScreen.screens()
        
        // 接続中の画面が2つある場合、2番目を表示.
        if screen.count > 1 {
            let screen: UIScreen = UIScreen.screens()[1]; // as! UIScreen
            showSecondScreenWindow(screen)
        }
        
        // 画面の接続がおこなわれた時に発生するNotification.
        let myDefaultCenter: NSNotificationCenter = NSNotificationCenter.defaultCenter()
        myDefaultCenter.addObserver(self, selector: "screenDidConnect:", name: UIScreenDidConnectNotification, object: nil)
        myDefaultCenter.addObserver(self, selector: "screenDidDisconnect:", name: UIScreenDidDisconnectNotification, object: nil)
        myDefaultCenter.addObserver(self, selector: "screenDidModeChange:", name: UIScreenModeDidChangeNotification, object: nil)
        
        // Labelを作成.
        let myLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,50))
        myLabel.backgroundColor = UIColor.orangeColor()
        myLabel.layer.masksToBounds = true
        myLabel.layer.cornerRadius = 20.0
        myLabel.text = "Hello 1st Screen"
        myLabel.textColor = UIColor.whiteColor()
        myLabel.shadowColor = UIColor.grayColor()
        myLabel.textAlignment = NSTextAlignment.Center
        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)
        self.view.addSubview(myLabel)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit044 {
    /*
    画面の接続された時.
    */
    func screenDidConnect(notification: NSNotification){
        
        print("screenDidConnect")
        
        let screen: NSArray = UIScreen.screens()
        
        if screen.count > 1 {
            let screen: UIScreen = UIScreen.screens()[1]; // as! UIScreen
            showSecondScreenWindow(screen)
        }
    }
    
    /*
    画面が切断された時.
    */
    func screenDidDisconnect(notification: NSNotification){
        print("screenDidDisconnect")
    }
    
    /*
    画面のモードが変わった時.
    */
    func screenDidModeChange(notification: NSNotification){
        print("screenDidModeChange")
    }
    
    /*
    2画面目の画面のレイアウト.
    */
    func showSecondScreenWindow(screen: UIScreen!){
        
        mySecondWindow = UIWindow()
        mySecondWindow.screen = screen
        mySecondWindow.frame = CGRectMake(0, 0, screen.bounds.width, screen.bounds.height)
        mySecondWindow.backgroundColor = UIColor.redColor()
        self.mySecondWindow.makeKeyAndVisible()
        
        // Labelを作成.
        let myLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,50))
        myLabel.backgroundColor = UIColor.orangeColor()
        myLabel.layer.masksToBounds = true
        myLabel.layer.cornerRadius = 20.0
        myLabel.text = "Hello Second Screen"
        myLabel.textColor = UIColor.whiteColor()
        myLabel.shadowColor = UIColor.grayColor()
        myLabel.textAlignment = NSTextAlignment.Center
        myLabel.layer.position = CGPoint(x: self.mySecondWindow.bounds.width/2,y: 200)
        self.mySecondWindow.addSubview(myLabel)
    }
}

// MARK:Actions
extension UIKit044 {
    
}
