//
//  ObjectFactory.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/16.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit
import Foundation

class ObjectFactory {
    static func createVC(classString: String) -> UIViewController {
//      var className:String = NSStringFromClass(NotImplementViewController);
        let theVC = NSClassFromString("SampleList.\(classString)") as! UIViewController.Type;
        return theVC.init();
    }
}