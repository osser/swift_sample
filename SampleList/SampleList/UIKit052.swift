//
//  UIKit052.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/21.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit052: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setup();
        layoutView();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK:初期化
extension UIKit052 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.midnightblue();
        
        // viewの背景色を設定.
        self.view.backgroundColor = UIColor(red: 0.902, green: 0.803, blue: 0.890, alpha: 1.0)
        
        // SegmentedControllerを生成.
        let mySegcon = UISegmentedControl(items: ["Circle", "Rectangle", "Line"])
        mySegcon.layer.position = CGPointMake(self.view.frame.width/2, self.view.frame.height - 50)
        mySegcon.tintColor = UIColor.blueColor()
        mySegcon.addTarget(self, action: "changedValue:", forControlEvents: UIControlEvents.ValueChanged)
        
        // viewにSegmentedControllerを追加.
        self.view.addSubview(mySegcon)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit052 {
    /*
    SegmentedControllerの値が変わった時に呼ばれるメソッド.
    */
    func changedValue(sender: UISegmentedControl) {
        var myDrawView: UIView!
        
        // SegmentedControllerの値によってそれぞれのクラスのインスタンスを生成.
        switch(sender.selectedSegmentIndex) {
            
        case 0:
            myDrawView = drawCircleView(frame: CGRectMake(0, 0, 300, 300))
            
        case 1:
            myDrawView = drawRectangleView(frame: CGRectMake(0, 0, 300, 300))
            
        case 2:
            myDrawView = drawLineView(frame: CGRectMake(0, 0, 300, 300))
            
        default:
            print("error")
            return
        }
        
        // 描画用viewの中心を設定.
        myDrawView.center = CGPointMake(self.view.frame.width/2, 250)
        myDrawView.backgroundColor = UIColor.whiteColor()
        
        // 描画用viewをviewに追加.
        self.view.addSubview(myDrawView)
    }
}

// MARK:Actions
extension UIKit052 {
    
}

/*
直線を描写するclass.
*/
class drawCircleView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    表示を更新する必要が生ずると自動的に呼び出される.
    */
    override func drawRect(rect: CGRect) {
        
        // viewの設定.
        self.layer.borderColor = UIColor.brownColor().CGColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
        
        let circlePoint = CGPointMake(100, 100)
        let ovalPoint = CGPointMake(200, 200)
        
        // 円のBezierPathを生成
        let myCircle: UIBezierPath = UIBezierPath(arcCenter: circlePoint,
            // 半径.
            radius: 70.0,
            // 初角度.
            startAngle: 0.0,
            // 最終角度.
            endAngle: CGFloat(M_PI*2/4),
            // 反時計回り.
            clockwise: false)
        
        // 線の色を赤色に設定.
        UIColor.redColor().setStroke()
        
        // 塗りつぶしの色を黄色に設定.
        UIColor.yellowColor().setFill()
        
        // 線で閉じた内側を塗りつぶす.
        myCircle.fill()
        
        // 線の太さを設定.
        myCircle.lineWidth = 3.0
        
        // 描画.
        myCircle.stroke()
        
        // 楕円のBezierPathを生成.
        let myOval: UIBezierPath = UIBezierPath(ovalInRect: CGRectMake(130, 150, 150, 100))
        UIColor.blueColor().setStroke()
        UIColor.grayColor().setFill()
        myOval.fill()
        myOval.lineWidth = 2.0
        
        // 描画.
        myOval.stroke()
    }
}

/*
直線を描写するclass.
*/
class drawRectangleView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    表示を更新する必要が生ずると自動的に呼び出される.
    */
    override func drawRect(rect: CGRect) {
        
        // viewの設定.
        self.layer.borderColor = UIColor.brownColor().CGColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
        
        // 長方形のUIBezierPathを生成.
        let myRect1: UIBezierPath = UIBezierPath(rect: CGRectMake(5, 5, 290, 290))
        
        // 線の色を青色に設定.
        UIColor.blueColor().setStroke()
        
        // 線の太さを設定.
        myRect1.lineWidth = 1.0
        
        // 描画.
        myRect1.stroke()
        
        // 角丸の長方形のUIBezierPathを生成.
        let myRect2: UIBezierPath = UIBezierPath(roundedRect: CGRectMake(50, 50, 200, 100),
            
            // 全ての角を丸くする.
            byRoundingCorners: UIRectCorner.AllCorners,
            
            // 丸くする度を設定.
            cornerRadii: CGSizeMake(5.0, 5.0))
        
        // 線の色をオレンジ色に設定.
        UIColor.orangeColor().setStroke()
        
        // 塗りつぶしの色を黄色に設定.
        UIColor.yellowColor().setFill()
        
        // 塗りつぶし.
        myRect2.fill()
        
        // 線の太さを設定.
        myRect2.lineWidth = 3.0
        
        // 描画.
        myRect2.stroke()
        
    }
}


/*
直線を描写するclass.
*/
class drawLineView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    表示を更新する必要が生ずると自動的に呼び出される.
    */
    override func drawRect(rect: CGRect) {
        
        // viewの設定.
        self.layer.borderColor = UIColor.brownColor().CGColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
        
        // BezierPathを生成.
        let myLine: UIBezierPath = UIBezierPath()
        
        // 線の色を青色に設定.
        UIColor.redColor().setStroke()
        
        // 始点を設定.
        myLine.moveToPoint(CGPointZero)
        
        // 次点を設定.
        myLine.addLineToPoint(CGPointMake(50, 150))
        myLine.addLineToPoint(CGPointMake(200, 100))
        
        // 終点を設定.
        myLine.addLineToPoint(CGPointMake(self.bounds.width, self.bounds.height))
        
        // 始点と終着点を繋いで閉じる.
        myLine.closePath()
        
        // 塗りつぶしの色を設定.
        UIColor.yellowColor().setFill()
        
        // 線で閉じた内側を塗りつぶす.
        myLine.fill()
        
        // 線の太さを設定.
        myLine.lineWidth = 3.0
        
        // 描画.
        myLine.stroke()
    }
}