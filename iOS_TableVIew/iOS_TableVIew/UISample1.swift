//
//  UISample1.swift
//  iOS_TableVIew
//
//  Created by xiaoma on 2015/12/11.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UISample1: UIViewController {

    var myItems: [String] = ["TEST1", "TEST2", "TEST3"];
    var myTableView: UITableView = UITableView();
    
    init(){
        super.init(nibName: nil, bundle: nil);
        setup();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("未実装");
    }

    override func viewDidLoad() {
        super.viewDidLoad();
    }

}

extension UISample1 {
    func setup(){
        view.backgroundColor = UIColor.whiteColor();
        
        // Status Barの高さを取得.
        let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height;
        
        // Viewの高さと幅を取得.
        let displayWidth: CGFloat = self.view.frame.width;
        let displayHeight: CGFloat = self.view.frame.height;
        
        // TableViewの生成( status barの高さ分ずらして表示 ).
        myTableView.frame = CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight);
        
        // Cellの登録.
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell");
        
        // DataSourceの設定.
        myTableView.dataSource = self;
        
        // Delegateを設定.
        myTableView.delegate = self;
        
        // Viewに追加する.
        self.view.addSubview(myTableView);
    }
}

// MARK:UITableViewDelegate
extension UISample1: UITableViewDelegate {
    
}

// MARK:UITableViewDataSource
extension UISample1: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myItems.count;
    }
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath);// as! UITableViewCell;
        cell.textLabel?.text = "\(myItems[indexPath.row])";
        return cell;
    }
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        // Shareボタン.
        let myShareButton: UITableViewRowAction = UITableViewRowAction(style: .Normal, title: "Share") { (action, index) -> Void in
            tableView.editing = false;
            print("share");
            self.closeTheWindow(self, cb: nil);
        }
        myShareButton.backgroundColor = UIColor.blueColor();
        
        // Archiveボタン.
        let myArchiveButton: UITableViewRowAction = UITableViewRowAction(style: .Normal, title: "Archive") { (action, index) -> Void in
            tableView.editing = false;
            print("archive");
            self.closeTheWindow(self, cb: nil);
        }
        myArchiveButton.backgroundColor = UIColor.redColor();
        
        return [myShareButton, myArchiveButton];
    }
}