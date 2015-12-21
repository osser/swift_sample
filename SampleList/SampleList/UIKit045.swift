//
//  UIKit045.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/21.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit045: UIViewController {

    var myItems: [String] = ["TEST1", "TEST2", "TEST3"];
    var myTableView: UITableView = UITableView();
    
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
extension UIKit045 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.whiteColor();
        
        // Status Barの高さを取得.
        let barHeight: CGFloat = 0; // UIApplication.sharedApplication().statusBarFrame.size.height
        
        // Viewの高さと幅を取得.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // TableViewの生成( status barの高さ分ずらして表示 ).
        myTableView.frame = CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight)
        
        // Cellの登録.
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        // DataSourceの設定.
        myTableView.dataSource = self
        
        // Delegateを設定.
        myTableView.delegate = self
        
        // Viewに追加する.
        self.view.addSubview(myTableView)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit045: UITableViewDelegate, UITableViewDataSource {
    /*
    Cellが選択された際に呼び出される.
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myItems[indexPath.row])")
    }
    
    /*
    Cellの総数を返す.
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection")
        return myItems.count
    }
    
    /*
    Editableの状態にする.
    */
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        print("canEditRowAtIndexPath")
        
        return true
    }
    
    /*
    特定の行のボタン操作を有効にする.
    */
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        print("commitEdittingStyle:\(editingStyle)")
    }
    
    /*
    Cellに値を設定する.
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("cellForRowAtIndexPath")
        
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath); // as! UITableViewCell
        
        cell.textLabel?.text = "\(myItems[indexPath.row])"
        
        return cell
    }
    
    /*
    Buttonを拡張する.
    */
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        // Shareボタン.
        let myShareButton: UITableViewRowAction = UITableViewRowAction(style: .Normal, title: "Share") { (action, index) -> Void in
            
            tableView.editing = false
            print("share")
            
        }
        myShareButton.backgroundColor = UIColor.blueColor()
        
        // Archiveボタン.
        let myArchiveButton: UITableViewRowAction = UITableViewRowAction(style: .Normal, title: "Archive") { (action, index) -> Void in
            
            tableView.editing = false
            print("archive")
            
        }
        myArchiveButton.backgroundColor = UIColor.redColor()
        
        return [myShareButton, myArchiveButton]
    }
}

// MARK:Actions
extension UIKit045 {
    
}
