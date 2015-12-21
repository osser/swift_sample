//
//  UIKit040.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/21.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit040: UIViewController {

    private var tapLabel: UILabel!
    private var pinchGestureLabel: UILabel!
    private var swipeLabel: UILabel!
    private var longPressLabel: UILabel!
    private var panLabel: UILabel!
    private var rotateLabel: UILabel!
    private var edgeLabel: UILabel!
    
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
extension UIKit040 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.whiteColor();
     
        // タップを認識.
        let myTap = UITapGestureRecognizer(target: self, action: "tapGesture:")
        
        // ピンチを認識.
        let myPinchGesture = UIPinchGestureRecognizer(target: self, action: "pinchGesture:")
        
        // スワイプ認識.
        let mySwipe = UISwipeGestureRecognizer(target: self, action: "swipeGesture:")
        
        // スワイプ認識-2本指でスワイプ.
        mySwipe.numberOfTouchesRequired = 2
        
        // 長押しを認識.
        let myLongPressGesture = UILongPressGestureRecognizer(target: self, action: "longPressGesture:")
        
        // 長押し-最低2秒間は長押しする.
        myLongPressGesture.minimumPressDuration = 2.0
        
        // 長押し-指のズレは15pxまで.
        myLongPressGesture.allowableMovement = 150
        
        // パン認識.
        let myPan = UIPanGestureRecognizer(target: self, action: "panGesture:")
        
        // パン認識-3本指でパン.
        myPan.minimumNumberOfTouches = 3
        
        // 回転を認識.
        let myRotate = UIRotationGestureRecognizer(target: self, action: "rotateGesture:")
        
        // エッジを認識.
        let mySEdghePan = UIScreenEdgePanGestureRecognizer(target: self, action: "edgeGesture:")
        
        // エッジを認識-最低指3本で反応.
        mySEdghePan.minimumNumberOfTouches = 4
        
        // エッジを認識-左側.
        mySEdghePan.edges = UIRectEdge.Left
        
        // Viewに追加.
        self.view.addGestureRecognizer(myTap)
        self.view.addGestureRecognizer(myPinchGesture)
        self.view.addGestureRecognizer(mySwipe)
        self.view.addGestureRecognizer(myLongPressGesture)
        self.view.addGestureRecognizer(myPan)
        self.view.addGestureRecognizer(myRotate)
        self.view.addGestureRecognizer(mySEdghePan)
        
        let centerOfX = self.view.bounds.width / 2
        
        // Labelを作成.
        tapLabel = makeMyLabel("Tap", color: UIColor.redColor(), myX: centerOfX - 50 , myY: 100)
        pinchGestureLabel = makeMyLabel("Pinch", color: UIColor.greenColor(), myX: centerOfX + 50, myY: 100)
        swipeLabel = makeMyLabel("Swipe", color: UIColor.blueColor(), myX: centerOfX - 50, myY: 190)
        longPressLabel = makeMyLabel("Long", color: UIColor.orangeColor(), myX: centerOfX + 50, myY: 190)
        panLabel = makeMyLabel("Pan", color: UIColor.blackColor(), myX: centerOfX - 50, myY: 280)
        rotateLabel = makeMyLabel("Rotate", color: UIColor.cyanColor(), myX: centerOfX + 50, myY: 280)
        edgeLabel = makeMyLabel("Edge", color: UIColor.purpleColor(), myX: centerOfX - 50, myY: 370)
        
        // Viewに貼付ける.
        self.view.addSubview(tapLabel)
        self.view.addSubview(pinchGestureLabel)
        self.view.addSubview(swipeLabel)
        self.view.addSubview(longPressLabel)
        self.view.addSubview(panLabel)
        self.view.addSubview(rotateLabel)
        self.view.addSubview(edgeLabel)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit040 {
    /*
    タップイベント.
    */
    internal func tapGesture(sender: UITapGestureRecognizer){
        tapLabel.text = "\(sender.numberOfTouches())"
    }
    
    /*
    ピンチイベントの実装.
    */
    internal func pinchGesture(sender: UIPinchGestureRecognizer){
        let firstPoint = sender.scale
        let secondPoint = sender.velocity
        pinchGestureLabel.text = "\(Double(Int(firstPoint*100))/100)\n\(Double(Int(secondPoint*100))/100)"
    }
    
    /*
    スワイプイベント
    */
    internal func swipeGesture(sender: UISwipeGestureRecognizer){
        let touches = sender.numberOfTouches()
        swipeLabel.text = "\(touches)"
    }
    
    /*
    長押しイベント.
    */
    internal func longPressGesture(sender: UILongPressGestureRecognizer){
        // 指が離れたことを検知
        if(sender.state == UIGestureRecognizerState.Ended){
            longPressLabel.text = "On"
        }
    }
    
    /*
    パン.
    */
    internal func panGesture(sender: UIPanGestureRecognizer){
        panLabel.text = "\(sender.numberOfTouches())"
    }
    
    /*
    回転.
    */
    internal func rotateGesture(sender: UIRotationGestureRecognizer){
        
        let firstPoint = sender.rotation
        let secondPoint = sender.velocity
        rotateLabel.text = "\(Double(Int(firstPoint*100))/100)\n\(Double(Int(secondPoint*100))/100)"
    }
    
    /*
    エッジ.
    */
    internal func edgeGesture(sender: UIScreenEdgePanGestureRecognizer){
        let touches = sender.numberOfTouches()
        swipeLabel.text = "\(touches)"
    }
}

// MARK:Actions
extension UIKit040 {
    internal func makeMyLabel(title: NSString, color: UIColor, myX: CGFloat, myY: CGFloat) -> UILabel{
        let myLabel: UILabel = UILabel()
        myLabel.frame = CGRectMake(0,0,80,80)
        myLabel.backgroundColor = color
        myLabel.textColor = UIColor.whiteColor()
        myLabel.layer.masksToBounds = true
        myLabel.text = title as String
        myLabel.textAlignment = NSTextAlignment.Center
        myLabel.layer.cornerRadius = 40.0
        myLabel.layer.position = CGPoint(x: myX, y: myY)
        myLabel.numberOfLines = 2
        return myLabel
    }
}
