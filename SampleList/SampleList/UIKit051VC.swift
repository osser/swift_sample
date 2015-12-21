//
//  UIKit051VC.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/21.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit051VC: UIViewController {

    var parentWindow: UIWindow?;

    let myItems: NSMutableArray = ["TEST1", "TEST2", "TEST3"]
    var myTableView: UITableView!
    
    var closeButton:UIBarButtonItem!;
    
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
extension UIKit051VC {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        closeButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "closeButton_click:");
        self.navigationItem.leftBarButtonItem = closeButton;
        
        view.backgroundColor = UIColor.orange();
        
        // ナビゲーションバーに表示するタイトル.
        self.title = "TableView Test"
        
        // ナビゲーションバーを取得.
        self.navigationController?.navigationBar
        
        // ナビゲーションバーを表示.
        self.navigationController?.navigationBarHidden = false
        
        // ナビゲーションバーの右側に編集ボタンを追加.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // Status Barの高さを取得.
        let barHeight: CGFloat = 0; //UIApplication.sharedApplication().statusBarFrame.size.height
        
        // Viewの高さと幅を取得.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // TableViewの生成( status barの高さ分ずらして表示 ).
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        
        // Cellの登録.
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        // DataSourceの設定.
        myTableView.dataSource = self
        
        // Delegateを設定.
        myTableView.delegate = self
        
        // 罫線を青色に設定.
        myTableView.separatorColor = UIColor.blueColor()
        
        // 編集中のセル選択を許可.
        myTableView.allowsSelectionDuringEditing = true
        
        // TableViewをViewに追加する.
        self.view.addSubview(myTableView)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit051VC: UITableViewDelegate, UITableViewDataSource {
    
    func closeButton_click(sender: UIBarButtonItem){
        parentWindow?.hidden = true;
    }
    
    /*
    Cellが選択された際に呼び出される.
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // 選択中のセルが何番目か.
        print("Num: \(indexPath.row)")
        
        // 選択中のセルのvalue.
        print("Value: \(myItems[indexPath.row])")
        
        // 選択中のセルを編集できるか.
        print("Editing: \(tableView.editing)")
    }
    
    
    /*
    Cellの総数を返す
    (実装必須)
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myItems.count
    }
    
    /*
    Cellに値を設定する
    (実装必須)
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath); // as! UITableViewCell
        
        // Cellに値を設定.
        cell.textLabel?.text = "\(myItems[indexPath.row])"
        
        return cell
    }
    
    /*
    編集ボタンが押された際に呼び出される
    */
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        // TableViewを編集可能にする
        myTableView.setEditing(editing, animated: true)
        
        // 編集中のときのみaddButtonをナビゲーションバーの左に表示する
        if editing {
            print("編集中")
            let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addCell:")
            self.navigationItem.setLeftBarButtonItem(addButton, animated: true)
        } else {
            print("通常モード")
            self.navigationItem.setLeftBarButtonItem(closeButton, animated: true)
        }
    }
    
    /*
    addButtonが押された際呼び出される
    */
    func addCell(sender: AnyObject) {
        print("追加")
        
        // myItemsに追加.
        myItems.addObject("add Cell")
        
        // TableViewを再読み込み.
        myTableView.reloadData()
    }
    
    /*
    Cellを挿入または削除しようとした際に呼び出される
    */
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        // 削除のとき.
        if editingStyle == UITableViewCellEditingStyle.Delete {
            print("削除")
            
            // 指定されたセルのオブジェクトをmyItemsから削除する.
            myItems.removeObjectAtIndex(indexPath.row)
            
            // TableViewを再読み込み.
            myTableView.reloadData()
        }
    }
}

// MARK:Actions
extension UIKit051VC {
    
}
