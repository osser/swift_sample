//
//  ViewController.swift
//  MyWeather
//
//  Created by xiaoma on 2015/12/16.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit
import Cartography
import FXBlurView

class PrettyWeatherViewController: UIViewController {

    private let backgroundView = UIImageView();
    private let overlayView = UIImageView();
    
    private let scrollView = UIScrollView();
    private let currentWeatherView = CurrentWeatherView(frame: CGRectZero);
    private let hourlyForecastView = WeatherHourlyForecastView(frame: CGRectZero);
    private let daysForecastView = WeatherDaysForecastView(frame: CGRectZero);
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup();
        layoutView();
        style();
        render(UIImage(named: "backgroundImage"));
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension PrettyWeatherViewController {
    func setup(){
        view.backgroundColor = UIColor.grayColor();
        
        backgroundView.contentMode = .ScaleAspectFill;
        backgroundView.clipsToBounds = true;
        view.addSubview(backgroundView);
        
        overlayView.contentMode = .ScaleAspectFill;
        overlayView.clipsToBounds = true;
        view.addSubview(overlayView);
        
        //scrollView.backgroundColor = UIColor.blueColor();
        scrollView.showsVerticalScrollIndicator = false;
        scrollView.addSubview(currentWeatherView);
        scrollView.addSubview(hourlyForecastView);
        scrollView.addSubview(daysForecastView);
        view.addSubview(scrollView);
    }
    func layoutView(){
        //print("PrettyWeatherViewController.layoutView");
        constrain(backgroundView, block: { lview in
            lview.top == lview.superview!.top;
            lview.bottom == lview.superview!.bottom;
            lview.left == lview.superview!.left;
            lview.right == lview.superview!.right;
        });
        constrain(overlayView, block: { lview in
            lview.top == lview.superview!.top;
            lview.bottom == lview.superview!.bottom;
            lview.left == lview.superview!.left;
            lview.right == lview.superview!.right;
        });
        
        constrain(scrollView, block: { lview in
            lview.top == lview.superview!.top;
            lview.bottom == lview.superview!.bottom;
            lview.left == lview.superview!.left;
            lview.right == lview.superview!.right;
        });
        constrain(currentWeatherView, block: { lview in
            lview.width == lview.superview!.width;
            lview.centerX == lview.superview!.centerX;
            lview.top == lview.superview!.top + CGFloat(UIApplication.sharedApplication().statusBarFrame.size.height);
            lview.height == 160;
        });
        constrain(hourlyForecastView, currentWeatherView, block: { lview1, lview2 in
            lview1.top == lview2.bottom + 20;
            lview1.width == lview1.superview!.width;
            lview1.centerX == lview1.superview!.centerX;
            lview1.height == 50;
        });
        constrain(daysForecastView, hourlyForecastView, currentWeatherView, scrollView, block: { lview1, lview2, lview3, lviewP in
            lview1.top == lview2.bottom + 10;
            lview1.width == lview2.width;
            lview1.bottom == lview3.bottom + 150;
            //lview1.bottom == lview1.superview!.bottom - 20;
            //lview1.bottom == lviewP.superview!.bottom - 20;
            lview1.centerX == lview1.superview!.centerX;
            //lview1.height == 100;
        });
        
        
        
//        let currentWeatherInsect: CGFloat = CGFloat(view.frame.height) - CGFloat(currentWeatherView.frame.height) - 10;
        //let currentWeatherInsect: CGFloat = CGFloat(view.frame.height) - CGFloat(160) - 10;
//        print("currentWeatherInsect=\(currentWeatherInsect)");
//        print("currentWeatherView.frame.height:=\(currentWeatherView.frame.height)");
        
//        constrain(currentWeatherView, block: { lview in
//            print("lview.height:\(lview.height)");
//            lview.top == lview.superview!.top + CGFloat(UIApplication.sharedApplication().statusBarFrame.size.height);// + currentWeatherInsect;
//        });
        
        
    }
    func style(){
        
    }
    func render(image: UIImage?){
        if let image = image {
            backgroundView.image = image;
            overlayView.image = image.blurredImageWithRadius(10, iterations: 20, tintColor: UIColor.clearColor());
            overlayView.alpha = 0.8;
        }
    }
}