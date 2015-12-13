//
//  IndexViewController.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/12.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit
import Cartography

class UIKitIndexViewController: UIViewController {
    
    var listView: UITableView = UITableView();

    var items:[(id: String, showname: String)] = [
        (id:"UIKit001", showname:"UILabelで文字を表示"),
        (id:"UIKit002", showname:"UIButtonでボタンを表示"),
        (id:"UIKit003", showname:"UIButtonでいろいろなボタンを表示"),
        (id:"UIKit004", showname:"UITextFieldで文字を入力"),
        (id:"UIKit005", showname:"UIImageViewで画像を表示"),
        (id:"UIKit006", showname:"UITableViewでテーブルを表示"),
    ];
    
    var arr: [(firstname: String, lastname: String?)] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad();
        setup();
        layoutView();
    }
}

// MARK:初期化
extension UIKitIndexViewController {
    func setup(){
        view.backgroundColor = UIColor.greenColor();

        listView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "myCell");
        listView.dataSource = self;
        listView.delegate = self;
        view.addSubview(listView);
    }
    func layoutView(){
        constrain(listView, block: { thisView in
            thisView.left == thisView.superview!.left;
            thisView.right == thisView.superview!.right;
            thisView.top == thisView.superview!.top;
            thisView.bottom == thisView.superview!.bottom;
        });
    }
}

// MARK:イベント
extension UIKitIndexViewController {
    
}

// MARK:UITableViewDataSource
extension UIKitIndexViewController : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell")! as UITableViewCell;
        cell.textLabel?.text = items[indexPath.row].showname;
        return cell;
    }
}

// MARK:UITableViewDelegate
extension UIKitIndexViewController : UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(items[indexPath.row]);
        switch items[indexPath.row].id {
        case "UIKit001":
            pushWindow(UIKit001());
        case "UIKit002":
            pushWindow(UIKit002());
        case "UIKit003":
            pushWindow(UIKit003());
        case "UIKit004":
            pushWindow(UIKit004());
        case "UIKit005":
            pushWindow(UIKit005());
        case "UIKit006":
            pushWindow(UIKit006());
        default:
            break;
        }
    }
}