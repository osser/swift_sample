//
//  ViewController.swift
//  MemoryGame
//
//  Created by xiaoma on 2015/12/07.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

enum Difficulty {
    case Easy
    case Medium
    case Hard
}

// MARK:基本
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// MARK:拡張
private extension ViewController {
    func setup(){
        view.backgroundColor = UIColor.greenSea();

        buildButtonWithCenter(CGPoint(x: view.center.x, y: view.center.y/2.0), title: "EASY", color: UIColor.emerald(), action: "onEasyTapped:");
        buildButtonWithCenter(CGPoint(x: view.center.x, y: view.center.y), title: "MEDIUM", color: UIColor.sunflower(), action: "onMediumTapped:");
        buildButtonWithCenter(CGPoint(x: view.center.x, y: view.center.y*3.0/2.0), title: "HARD", color: UIColor.alizarin(), action: "onHardTapped:");
    }
    
    func buildButtonWithCenter(center:CGPoint, title:String, color:UIColor, action: Selector){
        //
        let button = UIButton();
        button.setTitle(title, forState: .Normal);
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal);
        button.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 200, height: 50));
        button.center = center;
        button.backgroundColor = color;
        
        button.addTarget(self, action: action, forControlEvents: .TouchUpInside);
        view.addSubview(button);
    }
}

extension ViewController {
    
    func onEasyTapped(sender: UIButton){
        newGameDifficulty(.Easy);
    }
    func onMediumTapped(sender: UIButton){
        newGameDifficulty(.Medium);
    }
    func onHardTapped(sender: UIButton){
        newGameDifficulty(.Hard);
    }
    
    func newGameDifficulty(difficulty: Difficulty){
        let gameViewController = MemoryViewController(difficulty: difficulty);
        presentViewController(gameViewController, animated: true, completion: nil);
        
//        switch(difficulty){
//        case .Easy:
//            print("Easy");
//        case .Medium:
//            print("Medium");
//        case .Hard:
//            print("Hard");
//        }
    }
}

private extension UIColor {
    class func colorComponents(components: (CGFloat, CGFloat, CGFloat)) -> UIColor {
        return UIColor(red: components.0/255, green: components.1/255, blue: components.2/255, alpha: 1);
    }
}

extension UIColor {
    class func greenSea() -> UIColor {
        //return UIColor(red: 22, green: 160, blue: 133, alpha: 1);
        return UIColor.colorComponents((22,160,133));
    }
    class func emerald() -> UIColor {
        //return UIColor(red: 46, green: 204, blue: 113, alpha: 1);
        return UIColor.colorComponents((46,204,113));
    }
    class func sunflower() -> UIColor {
        //return UIColor(red: 241, green: 196, blue: 15, alpha: 1);
        return UIColor.colorComponents((241,196,15));
    }
    class func alizarin() -> UIColor {
        //return UIColor(red: 231, green: 76, blue: 60, alpha: 1);
        return UIColor.colorComponents((231,76,60));
    }
}
