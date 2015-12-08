//
//  Animation1ViewController.swift
//  iOS_Animation
//
//  Created by xiaoma on 2015/12/09.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class Animation1ViewController: UIViewController {

    init(){
        super.init(nibName: nil, bundle: nil);
        
        setup();
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("未実装");
    }
}

extension Animation1ViewController {
    func setup() {
        view.backgroundColor = UIColor.clouds();
    }
}