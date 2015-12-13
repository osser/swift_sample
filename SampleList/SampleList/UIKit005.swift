//
//  UIKit005.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/13.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit
import Cartography

class UIKit005: UIViewController {
    
    private var myImageView: UIImageView!;

    override func viewDidLoad() {
        super.viewDidLoad()

        setup();
        layoutView();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK:初期化
extension UIKit005 {
    func setup(){
        view.backgroundColor = UIColor.whiteColor();
        
        // UIImageViewを作成する.
        myImageView = UIImageView(frame: CGRectMake(0,0,128,128));
        
        // 表示する画像を設定する.
        let myImage = UIImage(named: "twitter");
        
        // 画像をUIImageViewに設定する.
        myImageView.image = myImage;
        
        // 画像の表示する座標を指定する.
        //myImageView.layer.position = CGPoint(x: self.view.bounds.width/2, y: 200.0);
        
        // UIImageViewをViewに追加する.
        self.view.addSubview(myImageView);
    }
    func layoutView(){
        constrain(myImageView, block: { lview in
            lview.centerX == lview.superview!.centerX;
            lview.centerY == lview.superview!.centerY;
            lview.width == lview.height;
            lview.width == 128;
        });
    }
}

// MARK:イベント
extension UIKit005 {
    
}
