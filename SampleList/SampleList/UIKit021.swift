//
//  UIKit021.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/16.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit021: UIViewController {

    // 画像を設定する.
    private let myInputImage = CIImage(image: UIImage(named: "playground")!)
    
    // ImageViewを.定義する.
    private var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
extension UIKit021 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");

        view.backgroundColor = UIColor.whiteColor();
        
        // UIImageViewを作成する.
        myImageView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height));
        myImageView.image = UIImage(CIImage: myInputImage!)
        self.view.addSubview(myImageView)
        
        // Sliderを作成する.
        let myGreenSlider = UISlider(frame: CGRectMake(0, 0, 200, 30))
        myGreenSlider.layer.position = CGPointMake(self.view.frame.midX, 500)
        myGreenSlider.backgroundColor = UIColor.whiteColor()
        myGreenSlider.layer.cornerRadius = 10.0
        myGreenSlider.layer.shadowOpacity = 0.5
        myGreenSlider.layer.masksToBounds = false
        
        // 最小値と最大値を設定する.
        myGreenSlider.minimumValue = 0
        myGreenSlider.maximumValue = 1
        
        // Sliderの位置を設定する.
        myGreenSlider.value = 0.5
        
        // Sliderの現在位置より右のTintカラーを変える.
        myGreenSlider.maximumTrackTintColor = UIColor.grayColor()
        
        // Sliderの現在位置より左のTintカラーを変える.
        myGreenSlider.minimumTrackTintColor = UIColor.blackColor()
        
        myGreenSlider.addTarget(self, action: "onChangeValueMySlider:", forControlEvents: UIControlEvents.ValueChanged)
        
        self.view.addSubview(myGreenSlider)
        
        self.view.backgroundColor = UIColor(red: 0, green: CGFloat(myGreenSlider.value), blue: 0, alpha: 1)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit021 {
    /*
    Sliderの値が変わった時に呼ばれるメソッド
    */
    internal func onChangeValueMySlider(sender : UISlider){
        
        // Sliderの値に応じてviewの背景のgreen値を変える.
        self.view.backgroundColor = UIColor(red: 0, green: CGFloat(sender.value), blue: 0, alpha: 1)
        
        // カラーエフェクトを指定してCIFilterをインスタンス化する.
        let myColorFilter = CIFilter(name: "CIColorCrossPolynomial")
        
        // イメージを設定する.
        myColorFilter!.setValue(myInputImage, forKey: kCIInputImageKey)
        
        // RGBの変換値を作成する.
        let r: [CGFloat] = [0.0, CGFloat(sender.value), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        let g: [CGFloat] = [0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        let b: [CGFloat] = [1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        
        // 値の調整をする.
        myColorFilter!.setValue(CIVector(values: r, count: 10), forKey: "inputRedCoefficients")
        myColorFilter!.setValue(CIVector(values: g, count: 10), forKey: "inputGreenCoefficients")
        myColorFilter!.setValue(CIVector(values: b, count: 10), forKey: "inputBlueCoefficients")
        
        // フィルターで処理した画像をアウトプットする.
        let myOutputImage : CIImage = myColorFilter!.outputImage!
        
        // 再びUIView処理済み画像を設定する.
        myImageView.image = UIImage(CIImage: myOutputImage)
        
        // 再描画をおこなう.
        myImageView.setNeedsDisplay()
    }
}

// MARK:Actions
extension UIKit021 {
    
}
