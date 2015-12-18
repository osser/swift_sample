//
//  WeatherHourlyForecastView.swift
//  MyWeather
//
//  Created by xiaoma on 2015/12/18.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit
import Cartography

class WeatherHourlyForecastView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    required init?(coder aDecoder: NSCoder) {
        fatalError("未実装");
    }

    override init(frame: CGRect){
        super.init(frame: frame);
        setup();
        layoutView();
        style();
    }
}

extension WeatherHourlyForecastView {
    func setup(){
        self.backgroundColor = UIColor.yellowColor();
    }
    func layoutView(){
//        constrain(self, block: { lview in
//            lview.height == 50;
//        });
    }
    func style(){
        
    }
}