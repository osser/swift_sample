//
//  UIViewController.swift
//  iOS_Animation
//
//  Created by xiaoma on 2015/12/09.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

extension UIViewController {
    func buildButtonController(title: String, center: CGPoint, bgColor: UIColor, clickHander: Selector) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50));
        button.center = center;
        button.setTitle(title, forState: .Normal);
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal);
        button.backgroundColor = bgColor;
        
        button.addTarget(self, action: clickHander, forControlEvents: .TouchUpInside);
        
        view.addSubview(button);
        return button;
    }
    
    func buildImageViewController(name: String, center: CGPoint, size: CGSize, handler: UIGestureRecognizer) -> UIImageView {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height));
        imageView.center = center;
        imageView.image = UIImage(named: name);
        imageView.userInteractionEnabled = true;
        imageView.addGestureRecognizer(handler);
        view.addSubview(imageView);
        return imageView;
    }
}

// MARK:閉じるボタン
extension UIViewController {
    func buildCloseButton(){
        buildButtonController("Close", center: CGPoint(x: view.center.x, y: view.frame.size.height - 50), bgColor: UIColor.sunflower(), clickHander: "btnClose_click:");
    }
    func btnClose_click(sender: UIButton){
        self.modalTransitionStyle = .CoverVertical;
        dismissViewControllerAnimated(true, completion: {});
    }    
}