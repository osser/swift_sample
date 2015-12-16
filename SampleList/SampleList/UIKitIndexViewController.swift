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
        (id:"UIKit007", showname:"UIFontで文字を装飾"),
        (id:"UIKit008", showname:"UILocalNotificationの表示"),
        (id:"UIKit009", showname:"UIWebViewでページを表示"),
        (id:"UIKit010", showname:"UIAlertControllerでアラートを表示"),
        (id:"UIKit011", showname:"UIPickerViewで値の選択"),
        (id:"UIKit012", showname:"UINavigationControllerの表示"),
        (id:"UIKit013", showname:"?UITabBarControllerでタブの表示"),
        (id:"UIKit014", showname:"UIImageViewの画像の回転/拡縮/反転"),
        (id:"UIKit015", showname:"UIViewControllerで画面遷移する"),
        (id:"UIKit016", showname:"UIScrollViewの表示"),
        (id:"UIKit017", showname:"UIBarButtonItemの設置"),
        (id:"UIKit018", showname:"UIPageControlの表示"),
        (id:"UIKit019", showname:"セクション分けしたUITableViewを作る"),
        (id:"UIKit020", showname:"UITextViewで複数行のテキストの表示"),
        (id:"UIKit021", showname:"UISliderの表示"),
        (id:"UIKit022", showname:"UISwitchの表示"),
        (id:"UIKit023", showname:"UIDatePickerの表示"),
        (id:"UIKit024", showname:"UIActivityIndicatorの表示"),
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
        items.sortInPlace({ p1, p2 in
            return p1.id > p2.id;
        });
        
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
        case "UIKit007":
            pushWindow(UIKit007());
        case "UIKit008":
            pushWindow(UIKit008());
        case "UIKit009":
            pushWindow(UIKit009());
        case "UIKit010":
            pushWindow(UIKit010());
        case "UIKit011":
            pushWindow(UIKit011());
        case "UIKit012":
            pushWindow(UIKit012());
        case "UIKit013":
            pushWindow(UIKit013());
        case "UIKit014":
            pushWindow(UIKit014());
        case "UIKit015":
            pushWindow(UIKit015());
        case "UIKit016":
            pushWindow(UIKit016());
        case "UIKit017":
            pushWindow(UIKit017());
        case "UIKit018":
            pushWindow(UIKit018());
        case "UIKit019":
            pushWindow(UIKit019());
        case "UIKit020":
            pushWindow(UIKit020());
        case "UIKit021":
            pushWindow(UIKit021());
        case "UIKit022":
            pushWindow(UIKit022());
        case "UIKit023":
            pushWindow(UIKit023());
        case "UIKit024":
            pushWindow(UIKit024());
        default:
            break;
        }
    }
}