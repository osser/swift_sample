//
//  UIKit031First.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/18.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit031First: UIViewController {
    
    var parentWindow: UIWindow?;

    override func viewDidLoad() {
        super.viewDidLoad()

        setup();
        layoutView();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

// MARK:初期化
extension UIKit031First {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.midnightblue();
     
        // ボタンを生成する.
        let myButton = UIButton(frame: CGRectMake(0,0,100,50))
        myButton.backgroundColor = UIColor.orangeColor()
        myButton.layer.masksToBounds = true
        myButton.setTitle("Click me!", forState: .Normal)
        myButton.layer.cornerRadius = 20.0
        myButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:200)
        myButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        // ボタンをViewに追加する.
        self.view.addSubview(myButton);
        
        
        // BarButtonItemを作成する.
        let myBarButton_1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Camera, target: self, action: "onClickMyBarButton:");
        let myBarButton_2 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "onClickMyBarButton:");
        let myBarButton_3 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "onClickMyBarButton:");
        
        myBarButton_1.tag = 1;
        myBarButton_2.tag = 2;
        myBarButton_3.tag = 3;
        
        // Barの右に配置するボタンを配列に格納する.
        let myRightButtons: [UIBarButtonItem] = [myBarButton_1, myBarButton_2];
        
        // NavigationBarを取得する.
        self.navigationController?.navigationBar
        
        // NavigationBarの表示する.
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        // NavigationItemの取得する.
        self.navigationItem
        
        // タイトルを設定する.
        self.navigationItem.title = "Title"
        
        // プロンプトを設定する.
        self.navigationItem.prompt = "Prompt"
        
        // Barの右側に複数配置する.
        self.navigationItem.setRightBarButtonItems(myRightButtons, animated: true)
        
        // Barの左側に配置する.
        self.navigationItem.setLeftBarButtonItem(myBarButton_3, animated: true)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit031First {
    func onClickMyButton(sender: UIButton){
        pushWindow(UIKit031Second());
    }
    func onClickMyBarButton(sender: UIBarButtonItem){
        switch sender.tag {
        case 1:
            break;
        case 2:
            break;
        case 3: //Done
            parentWindow?.hidden = true;
            break;
        default:
            break;
        }
    }
}

// MARK:Actions
extension UIKit031First {
    
}
