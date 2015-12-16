//
//  ViewController.swift
//  MyWeather
//
//  Created by xiaoma on 2015/12/16.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit
import Cartography

class PrettyWeatherViewController: UIViewController {

    private let backgroundView = UIImageView();
    
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
    }
    func layoutView(){
        constrain(backgroundView, block: { lview in
            lview.top == lview.superview!.top;
            lview.bottom == lview.superview!.bottom;
            lview.left == lview.superview!.left;
            lview.right == lview.superview!.right;
        });
    }
    func style(){
        
    }
    func render(image: UIImage?){
        if let image = image {
            backgroundView.image = image;
        }
    }
}