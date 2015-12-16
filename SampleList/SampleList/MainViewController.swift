//
//  ViewController.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/11.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit
import Cartography
import LatoFont
import MGSwipeTableCell

class MainViewController: UIViewController {
    
    var items:[String] = [
        "UIKit",
        "Utility",
        "AVFoundation",
        "PhotoKit",
        "CoreMotion",
        "CoreLocation",
        "MapKit",
        "CoreImage",
        "Social",
        "TouchID",
        "CoreBluetooth",
        "HealthKit",
        "Connection",
        "HomeKit",
        "AppExtension",
        "CoreData",
        "CloudKit",
        "GoogleMap",
        "YouTube",
        "WebKit",
        "SpriteKit",
        "AutoLayout",
        "Tips",
        "XCTest",
        "WatchKit",
        "PassKit",
        "SceneKit",
        "CoreAudio",
        "CoreGraphics",
        "CoreText",
        "EventKit",
        "MyoKit",
    ];

    private let tableView = UITableView();

    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
        setup();
        layoutView();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }


}


// MARK:初期化
extension MainViewController {
    func setup(){
        title = "swift samples";
        view.backgroundColor = UIColor.clouds();
        
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "myCell");
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.rowHeight = 50;
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);
        view.addSubview(tableView);
        
    }
    
    func layoutView(){
        constrain(tableView) { view in
            view.top == view.superview!.top;
            view.bottom == view.superview!.bottom;
            view.left == view.superview!.left;
            view.right == view.superview!.right;
        }
    }
}

// MARK:
extension MainViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("didSelectRowAtIndexPath: \(indexPath.row)");
        
        switch(items[indexPath.row]) {
            case "UIKit":
                pushWindow(UIKitIndexViewController());
            default:
                openTheWindow(NotImplementViewController());
        }
    }

}

// MARK:UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell")! as UITableViewCell;
        cell.selectionStyle = .Blue;
        cell.textLabel?.font = UIFont.latoBoldFontOfSize(20);
        cell.textLabel?.text = items[indexPath.row]; //"サンプル \(indexPath.row)";
        return cell;
    }
}