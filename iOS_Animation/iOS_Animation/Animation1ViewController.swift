//
//  Animation1ViewController.swift
//  iOS_Animation
//
//  Created by xiaoma on 2015/12/09.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class Animation1ViewController: UIViewController {

    var isTurnUp:Bool = false;

    init(){
        super.init(nibName: nil, bundle: nil);
        
        setup();
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("未実装");
    }
}

// MARK:初期化
extension Animation1ViewController {
    func setup() {
        view.backgroundColor = UIColor.asbestos();
        buildImageViewController("back", center: view.center, size: CGSize(width: 200, height: 300), handler: UITapGestureRecognizer(target: self, action: "imageView_tapGesture:"));
        buildCloseButton();
    }
}

// MARK:イベント
extension Animation1ViewController {
    func imageView_tapGesture(sender:UITapGestureRecognizer){
        if let imageView = sender.view as? UIImageView {
            if isTurnUp {
                UIView.transitionWithView(imageView, duration: 0.5, options: .TransitionFlipFromLeft, animations: {
                    imageView.image = UIImage(named: "back");
                }, completion: nil);
                isTurnUp = false;
            }else{
                UIView.transitionWithView(imageView, duration: 0.5, options: .TransitionFlipFromRight, animations: {
                    imageView.image = UIImage(named: "ace_of_spades");
                }, completion: nil);
                isTurnUp = true;
            }
        }
    }
}