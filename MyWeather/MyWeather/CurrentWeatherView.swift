//
//  CurrentWeatherView.swift
//  MyWeather
//
//  Created by xiaoma on 2015/12/18.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit
import Cartography

class CurrentWeatherView: UIView {
    
    private var didSetupConstraints = false;

    required init?(coder aDecoder: NSCoder) {
        fatalError("未実装");
    }
    
    override init(frame: CGRect){
        super.init(frame: frame);
        setup();
        layoutView();
        style();
    }
    
//    override func updateConstraints() {
//        print("CurrentWeatherView.updateConstraints");
//        if didSetupConstraints {
//            super.updateConstraints();
//        }else{
//            layoutView();
//            super.updateConstraints();
//            didSetupConstraints = true;
//        }
//    }
    
}

extension CurrentWeatherView {
    func setup(){
        
    }
    func layoutView(){
//        print("CurrentWeatherView.layoutView");
//        constrain(self, block: { lview in
//            //print("1.lview.height:\(lview.height)");
//            lview.height == 160;
//            //print("2.lview.height:\(lview.height)");
//            //print("lview.height.view.frame.height:\(lview.height.view.frame.height)");
//        });
        //print("self.frame.size.height:\(self.frame.size.height)");
    }
    func style(){
        self.backgroundColor = UIColor.redColor();
    }
}