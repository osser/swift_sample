//
//  UILabelSample.swift
//  iOS_TableVIew
//
//  Created by xiaoma on 2015/12/11.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UISample: UIViewController {

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

extension UISample {
    func setup(){
        view.backgroundColor = UIColor.greenColor();
    }
}