//
//  Animation2ViewController.swift
//  iOS_Animation
//
//  Created by xiaoma on 2015/12/09.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class Animation2ViewController: UIViewController {

    init(){
        super.init(nibName: nil, bundle: nil);
        
        setup();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("未実装");
    }
}

// MARK:初期化
extension Animation2ViewController {
    func setup() {
        view.backgroundColor = UIColor.midnightblue();
        
        let cardImageView = Animation2CardImageView(frame: CGRect(x: (view.frame.size.width - 200) / 2, y: (view.frame.size.height - 300) / 2, width: 200, height: 300));
        view.addSubview(cardImageView);
        buildCloseButton(); 
    }
}
