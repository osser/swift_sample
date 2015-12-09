//
//  Animation3ViewController.swift
//  iOS_Animation
//
//  Created by xiaoma on 2015/12/09.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class Animation3ViewController: UIViewController {

    var card:Animation3Card!;

    init(){
        super.init(nibName: nil, bundle: nil);
        setup();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("未実装");
    }
}

// MARK:初期化
extension Animation3ViewController {
    func setup() {
        card  = Animation3Card();
        
        view.backgroundColor = UIColor.concrete();
        
        let cardImageView = card.buildCard(CGPoint(x: view.center.x, y: view.frame.size.height - 200), size: CGSize(width: 100, height: 150));
        view.addSubview(cardImageView);
        buildCloseButton();
    }
}
