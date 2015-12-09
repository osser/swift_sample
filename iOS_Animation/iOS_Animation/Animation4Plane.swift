//
//  Animation4Plane.swift
//  iOS_Animation
//
//  Created by xiaoma on 2015/12/09.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class Animation4Plane:NSObject {
    var planeImageView:UIImageView!;
    
    override init() {
        super.init();
    }
    
}

// MARK:初期化
extension Animation4Plane {
    func setup(){
        
    }
    
    func buildPlane(frame: CGRect) -> UIImageView {
        planeImageView = UIImageView(frame: frame);
        planeImageView.image = UIImage(named: "plane");
        return planeImageView;
    }
    
    func start(){
        if let plane = planeImageView {
            let originalCenter = plane.center
            
            UIView.animateKeyframesWithDuration(1.5, delay: 0.0, options: .Repeat, animations: {
                
                UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.25, animations: {
                    plane.center.x += 80;
                    plane.center.y += 10;
                });
                
                UIView.addKeyframeWithRelativeStartTime(0.1, relativeDuration: 0.4, animations: {
                    plane.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_4/2));
                });
                
                UIView.addKeyframeWithRelativeStartTime(0.25, relativeDuration: 0.25, animations: {
                    plane.center.x += 100.0;
                    plane.center.y -= 50.0;
                    plane.alpha = 0.0;
                });
                
                UIView.addKeyframeWithRelativeStartTime(0.51, relativeDuration: 0.01, animations: {
                    plane.transform = CGAffineTransformIdentity;
                    plane.center = CGPoint(x: 0.0, y: originalCenter.y);
                });
                
                UIView.addKeyframeWithRelativeStartTime(0.55, relativeDuration: 0.45, animations: {
                    plane.alpha = 1.0;
                    plane.center = originalCenter;
                });
            }, completion: { result in
                //print("animateKeyframesWithDuration.result:" + String(result));
            });
        }
    }
}