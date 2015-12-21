//
//  UIKit056.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/21.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit056: UIViewController {

    var myImagePicker: UIImagePickerController!
    var myImageView: UIImageView!
    
    var isCanceled:Bool = false;
    
    override func viewDidLoad() {
        super.viewDidLoad();

        setup();
        layoutView();
    }
    
    override func viewDidAppear(animated: Bool) {
        print("viewDidAppear")
        if !isCanceled {
            self.presentViewController(myImagePicker, animated: true, completion: nil);
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK:初期化
extension UIKit056 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.whiteColor();
        
        self.title = "Select a Image"
        
        myImageView = UIImageView(frame: self.view.bounds)
        
        // インスタンス生成
        myImagePicker = UIImagePickerController()
        
        // デリゲート設定
        myImagePicker.delegate = self
        
        // 画像の取得先はフォトライブラリ
        myImagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        // 画像取得後の編集を不可に
        myImagePicker.allowsEditing = false
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit056: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    /**
     画像が選択された時に呼ばれる.
     */
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        //選択された画像を取得.
        let myImage: AnyObject?  = info[UIImagePickerControllerOriginalImage]
        
        //選択された画像を表示するViewControllerを生成.
        let secondViewController = UIKit056SecondViewController()
        
        //選択された画像を表示するViewContorllerにセットする.
        secondViewController.mySelectedImage = myImage as! UIImage
        
        myImagePicker.pushViewController(secondViewController, animated: true)
    }

    /**
     画像選択がキャンセルされた時に呼ばれる.
     */
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        print("imagePickerControllerDidCancel");
        // モーダルビューを閉じる
        self.dismissViewControllerAnimated(true, completion: nil)
        
        isCanceled = true;
    }
}

// MARK:Actions
extension UIKit056 {
    
}



class UIKit056SecondViewController: UIViewController {
    
    var mySelectedImage: UIImage!
    var mySelectedImageView: UIImageView!
    
    override func viewDidLoad() {
        
        self.edgesForExtendedLayout = UIRectEdge.None
        self.view.backgroundColor = UIColor.whiteColor()
        
        setImage()
    }
    
    /**
     選択された画像をUIImageViewにセットする.
     */
    func setImage(){
        self.title = "Selected Image"
        
        self.view.backgroundColor = UIColor.midnightblue();
        
        mySelectedImageView = UIImageView(frame: self.view.bounds)
        mySelectedImageView.contentMode = UIViewContentMode.ScaleAspectFit
        mySelectedImageView.image = mySelectedImage
        self.view.addSubview(mySelectedImageView)
    }
    
}

