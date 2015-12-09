//
//  Animation3Card.swift
//  iOS_Animation
//
//  Created by xiaoma on 2015/12/09.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class Animation3Card : NSObject {
    var cardImageView: UIImageView!;

    var isTurnUp:Bool = false;

    var initPos:CGPoint!;
    var gotoPos:CGPoint!;

    override init(){
        super.init();
        setup();
    }
}

// MARK:初期化
extension Animation3Card {
    func setup(){
    }
    
    func buildCard(center:CGPoint, size:CGSize) -> UIImageView {
        initPos = center;
        gotoPos = CGPoint(x: center.x, y: 50 + size.height / 2);
        
        cardImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height));
        cardImageView.center = center;
        cardImageView.image = UIImage(named: "back");
        cardImageView.userInteractionEnabled = true;
        let tapHandler:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "tapHandler:");
        cardImageView.addGestureRecognizer(tapHandler);
        return cardImageView;
    }
}

// MARK:イベント
extension Animation3Card {
    func tapHandler(sender:UITapGestureRecognizer){
        let animation_duration = 0.5;
        if isTurnUp {
            UIView.transitionWithView(self.cardImageView, duration: animation_duration, options: .TransitionFlipFromBottom, animations: {
                self.cardImageView.image = UIImage(named: "back");
            }, completion: { result in
                UIView.animateWithDuration(animation_duration, animations: {
                    self.cardImageView.center = self.initPos;
                }, completion: { result in
                    self.isTurnUp = false;
                });
            });
        }else{
            UIView.animateWithDuration(animation_duration, animations: {
                self.cardImageView.center = self.gotoPos;
            }, completion: { result in
                UIView.transitionWithView(self.cardImageView, duration: animation_duration, options: .TransitionFlipFromTop, animations: {
                    self.cardImageView.image = UIImage(named: "ace_of_hearts");
                }, completion: { result in
                    self.isTurnUp = true;
                });
            });
        }
    }
}