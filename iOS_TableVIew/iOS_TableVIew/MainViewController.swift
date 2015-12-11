//
//  ViewController.swift
//  iOS_TableVIew
//
//  Created by xiaoma on 2015/12/09.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private var items:[String] = [
        "TableViewのボタンの拡張",
        "Sample2",
        "Sample3",
    ];
    private var tableView:UITableView!;

    override func viewDidLoad() {
        super.viewDidLoad()

        setup();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


// MARK:初期化
extension MainViewController {
    func setup(){
        title = "iOSテーブルサンプル";
        
        let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height;
        let displayWidth: CGFloat = self.view.frame.width;
        let displayHeight: CGFloat = self.view.frame.height;
        tableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight), style: .Plain);
        
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "MyCell")
        tableView.dataSource = self;
        tableView.delegate = self;

        view.addSubview(tableView);
        
    }
}

// MARK:UITableViewDelegate
extension MainViewController:UITableViewDelegate{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Num: \(indexPath.row), Value: \(items[indexPath.row])");
        
        switch indexPath.row+1 {
            case 1:
                openTheWindow(UISample1(), cb: nil);
                break;
            case 2:
                break;
            case 3:
                break;
            default:
                break;
        }
    }
}

// MARK:UITableViewDataSource
extension MainViewController:UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath);
        cell.textLabel!.text = "\(items[indexPath.row])";
        return cell;
    }
}

// MARK:イベント
extension MainViewController {
    
}

