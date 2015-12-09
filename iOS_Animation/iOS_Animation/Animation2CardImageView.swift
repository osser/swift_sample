//
//  Animation2CardImageView.swift
//  iOS_Animation
//
//  Created by xiaoma on 2015/12/09.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class Animation2CardImageView: UIImageView {

    var isTurnUp = false;
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("未実装");
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        self.image = UIImage(named: "back");
        self.userInteractionEnabled = true;
        let tapHandler: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "imageView_tapGesture:")
        self.addGestureRecognizer(tapHandler);
    }
}

// MARK:イベント処理
extension Animation2CardImageView {
    func imageView_tapGesture(sender:UITapGestureRecognizer){
        if isTurnUp {
            UIView.transitionWithView(self, duration: 0.5, options: .TransitionFlipFromBottom, animations: {
                self.image = UIImage(named: "back");
            }, completion: nil);
            isTurnUp = false;
        }else{
            UIView.transitionWithView(self, duration: 0.5, options: .TransitionFlipFromTop, animations: {
                self.image = UIImage(named: "ace_of_hearts");
            }, completion: nil);
            isTurnUp = true;
        }
    }
}