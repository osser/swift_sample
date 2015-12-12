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
    class func separatorColor() -> UIColor {
        return UIColor.colorComponents((209, 209, 212));
    }
    
    class func turquoise() -> UIColor {
        return UIColor.colorComponents((26, 188, 156));
    }
    class func greenSea() -> UIColor {
        return UIColor.colorComponents((22,160,133));
    }
    class func sunflower() -> UIColor {
        return UIColor.colorComponents((241,196,15));
    }
    class func orange() -> UIColor {
        return UIColor.colorComponents((243, 156, 18));
    }
    
    class func emerald() -> UIColor {
        return UIColor.colorComponents((46,204,113));
    }
    class func nephritis() -> UIColor {
        return UIColor.colorComponents((39, 174, 96));
    }
    class func carrot() -> UIColor {
        return UIColor.colorComponents((230, 126, 34));
    }
    class func pumpkin() -> UIColor {
        return UIColor.colorComponents((211, 84, 0));
    }
    
    class func peterriver() -> UIColor {
        return UIColor.colorComponents((52, 152, 219));
    }
    class func belizehole() -> UIColor {
        return UIColor.colorComponents((41, 128, 185));
    }
    class func alizarin() -> UIColor {
        return UIColor.colorComponents((231,76,60));
    }
    class func pomegranate() -> UIColor {
        return UIColor.colorComponents((192, 57, 43));
    }
    
    class func amethyst() -> UIColor {
        return UIColor.colorComponents((155, 89, 182));
    }
    class func wisteria() -> UIColor {
        return UIColor.colorComponents((142, 68, 173));
    }
    class func clouds() -> UIColor {
        return UIColor.colorComponents((236, 240, 241));
    }
    class func silver() -> UIColor {
        return UIColor.colorComponents((189, 195, 199));
    }
    
    class func wetasphalt() -> UIColor {
        return UIColor.colorComponents((52, 73, 94));
    }
    class func midnightblue() -> UIColor {
        return UIColor.colorComponents((44, 62, 80));
    }
    class func concrete() -> UIColor {
        return UIColor.colorComponents((149, 165, 166));
    }
    class func asbestos() -> UIColor {
        return UIColor.colorComponents((127, 140, 141));
    }
    
    class func colorComponents(components: (CGFloat, CGFloat, CGFloat)) -> UIColor {
        return UIColor(red: components.0/255, green: components.1/255, blue: components.2/255, alpha: 1);
    }
}