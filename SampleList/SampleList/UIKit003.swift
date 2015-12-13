//
//  UIKit003.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/13.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit003: UIViewController {

    private var myInfoDarkButton: UIButton!
    private var myInfoLightButton: UIButton!
    private var myAddButton: UIButton!
    private var myDetailButton: UIButton!
    private var mySystemButton: UIButton!
    
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
extension UIKit003 {
    func setup(){
        view.backgroundColor = UIColor.whiteColor();
        
        // ボタンを生成.
        myInfoDarkButton = UIButton(type: UIButtonType.InfoDark)
        myInfoLightButton = UIButton(type: UIButtonType.InfoLight)
        myAddButton = UIButton(type: UIButtonType.ContactAdd)
        myDetailButton = UIButton(type: UIButtonType.DetailDisclosure)
        mySystemButton = UIButton(type: UIButtonType.System)
        
        // ボタンの位置を指定する.
        let headerHeight:CGFloat = (navigationController?.navigationBar.frame.size.height)!;
        myInfoDarkButton.layer.position = CGPoint(x: self.view.frame.width/2, y:50 + headerHeight)
        myInfoLightButton.layer.position = CGPoint(x: self.view.frame.width/2, y:100 + headerHeight)
        myAddButton.layer.position = CGPoint(x: self.view.frame.width/2, y:150 + headerHeight)
        myDetailButton.layer.position = CGPoint(x: self.view.frame.width/2, y:200 + headerHeight)
        
        // mySystemButtonに枠を追加する.
        mySystemButton.frame = CGRectMake(0, 0, 200, 50)
        
        // mySystemButtonの位置を設定する.
        mySystemButton.layer.position = CGPoint(x: self.view.frame.width/2, y:250 + headerHeight)
        
        // mySystemButtonにタイトルを設定する.
        mySystemButton.setTitle("mySystemButton", forState: UIControlState.Normal)
        
        // タグを設定する.
        myInfoDarkButton.tag = 1
        myInfoLightButton.tag = 2
        myAddButton.tag = 3
        myDetailButton.tag = 4
        mySystemButton.tag = 5
        
        // イベントを追加する.
        myInfoDarkButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        myInfoLightButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        myAddButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        myDetailButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        mySystemButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        // ボタンをViewに追加する.
        self.view.addSubview(myInfoDarkButton)
        self.view.addSubview(myInfoLightButton)
        self.view.addSubview(myAddButton)
        self.view.addSubview(myDetailButton)
        self.view.addSubview(mySystemButton)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit003 {
    internal func onClickMyButton(sender: UIButton){
        print("onClickMyButton:");
        print("sender.currentTitile: \(sender.currentTitle)");
        print("sender.tag: \(sender.tag)");
    }
}
