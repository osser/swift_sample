//
//  UIKit022.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/16.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit022: UIViewController {

    private var myLabel: UILabel!
    
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
extension UIKit022 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");

        view.backgroundColor = UIColor.whiteColor();
        
        // 背景色をCyanに設定する.
        self.view.backgroundColor = UIColor.cyanColor()
        
        // Swicthを作成する.
        let mySwicth: UISwitch = UISwitch()
        mySwicth.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height - 200)
        
        // Swicthの枠線を表示する.
        mySwicth.tintColor = UIColor.blackColor()
        
        // SwitchをOnに設定する.
        mySwicth.on = true
        
        // SwitchのOn/Off切り替わりの際に、呼ばれるイベントを設定する.
        mySwicth.addTarget(self, action: "onClickMySwicth:", forControlEvents: UIControlEvents.ValueChanged)
        
        // SwitchをViewに追加する.
        self.view.addSubview(mySwicth)
        
        // On/Offを表示するラベルを作成する.
        myLabel = UILabel(frame: CGRectMake(0,0,150,150))
        myLabel.backgroundColor = UIColor.orangeColor()
        myLabel.layer.masksToBounds = true
        myLabel.layer.cornerRadius = 75.0
        myLabel.textColor = UIColor.whiteColor()
        myLabel.shadowColor = UIColor.grayColor()
        myLabel.font = UIFont.systemFontOfSize(CGFloat(30))
        myLabel.textAlignment = NSTextAlignment.Center
        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)
        myLabel.text = "On"
        
        // ラベルをviewに追加
        self.view.addSubview(myLabel)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit022 {
    internal func onClickMySwicth(sender: UISwitch){
        
        if sender.on {
            myLabel.text = "On"
            myLabel.backgroundColor = UIColor.orangeColor()
        }
        else {
            myLabel.text = "Off"
            myLabel.backgroundColor = UIColor.grayColor()
        }
    }
}

// MARK:Actions
extension UIKit022 {
    
}
