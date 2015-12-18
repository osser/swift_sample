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
        (id:"UIKit013", showname:"UITabBarControllerでタブの表示"),
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
        (id:"UIKit025", showname:"UISearchBarの表示"),
        (id:"UIKit026", showname:"UIWindowの表示"),
        (id:"UIKit027", showname:"UIToolBarの表示"),
        (id:"UIKit028", showname:"UIProgressViewで進捗の具合の確認"),
        (id:"UIKit029", showname:"UISegmentedControlの表示"),
        (id:"UIKit030", showname:"UIStepperの表示"),
        (id:"UIKit031", showname:"UINavigationItemでUINavigationBarを設定"),
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
        let class_name:String = items[indexPath.row].id;
        switch class_name {
        default:
            pushWindow(ObjectFactory.createVC(class_name));
            break;
        }
    }
}