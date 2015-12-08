//
//  UIColor.swift
//  iOS_Animation
//
//  Created by xiaoma on 2015/12/09.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

// 参照サイト:
// https://flatuicolors.com/
extension UIColor {
    class func greenSea() -> UIColor {
        return UIColor.colorComponents((22,160,133));
    }
    class func emerald() -> UIColor {
        return UIColor.colorComponents((46,204,113));
    }
    class func sunflower() -> UIColor {
        return UIColor.colorComponents((241,196,15));
    }
    class func alizarin() -> UIColor {
        return UIColor.colorComponents((231,76,60));
    }
    class func clouds() -> UIColor {
        return UIColor.colorComponents((236, 240, 241));
    }

    class func colorComponents(components: (CGFloat, CGFloat, CGFloat)) -> UIColor {
        return UIColor(red: components.0/255, green: components.1/255, blue: components.2/255, alpha: 1);
    }
}