//
//  ViewController.swift
//  iOS_TableVIew
//
//  Created by xiaoma on 2015/12/09.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private var items:[String] = ["Test1", "Test2", "Test3"];
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
        // Status Barの高さを取得する.
        let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height;
        
        // Viewの高さと幅を取得する.
        let displayWidth: CGFloat = self.view.frame.width;
        let displayHeight: CGFloat = self.view.frame.height;
        
        tableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight), style: .Plain);
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        tableView.dataSource = self;
        tableView.delegate = self;

        view.addSubview(tableView);
        
    }
}

// MARK:UITableViewDelegate
extension MainViewController:UITableViewDelegate{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Num: \(indexPath.row)");
        print("Value: \(items[indexPath.row])");
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

