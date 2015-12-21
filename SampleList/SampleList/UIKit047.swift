//
//  UIKit047.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/21.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit047: UIViewController {

    // UIPageControl.
    var pageControl: UIPageControl!
    // UIScrillView.
    var scrollViewHeader: UIScrollView!
    var scrollViewMain: UIScrollView!
    // ページ番号.
    let pageSize = 10
    
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
extension UIKit047 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.whiteColor();
        
        // 画面サイズの取得.
        let width = self.view.frame.maxX, height = self.view.frame.maxY
        
        // ScrollViewHeaderの設定.
        scrollViewHeader = UIScrollView(frame: self.view.frame)
        scrollViewHeader.showsHorizontalScrollIndicator = false
        scrollViewHeader.showsVerticalScrollIndicator = false
        scrollViewHeader.pagingEnabled = true
        scrollViewHeader.delegate = self
        scrollViewHeader.contentSize = CGSizeMake(CGFloat(pageSize) * width, 0)
        self.view.addSubview(scrollViewHeader)
        
        // ScrollViewMainの設定.
        scrollViewMain = UIScrollView(frame: self.view.frame)
        scrollViewMain.showsHorizontalScrollIndicator = false
        scrollViewMain.showsVerticalScrollIndicator = false
        scrollViewMain.pagingEnabled = true
        scrollViewMain.delegate = self
        scrollViewMain.contentSize = CGSizeMake(CGFloat(pageSize) * width, 0)
        self.view.addSubview(scrollViewMain)
        
        // ScrollView1に貼付けるLabelの生成.
        for var i = 0; i < pageSize; i++ {
            
            //ページごとに異なるラベルを表示.
            let myLabel:UILabel = UILabel(frame: CGRectMake(CGFloat(i) * width + width/2 - 40, height/2 - 40, 80, 80))
            myLabel.backgroundColor = UIColor.blackColor()
            myLabel.textColor = UIColor.whiteColor()
            myLabel.textAlignment = NSTextAlignment.Center
            myLabel.layer.masksToBounds = true
            myLabel.text = "Page\(i)"
            myLabel.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
            myLabel.layer.cornerRadius = 40.0
            
            scrollViewMain.addSubview(myLabel)
        }
        
        // ScrollView2に貼付ける Labelの生成.
        for var i = 0; i < pageSize; i++ {
            
            //ページごとに異なるラベルを表示.
            let myLabel:UILabel = UILabel(frame: CGRectMake(CGFloat(i) * width/4 + width/2 - 40, 50, 80, 60))
            myLabel.backgroundColor = UIColor.redColor()
            myLabel.textColor = UIColor.whiteColor()
            myLabel.textAlignment = NSTextAlignment.Center
            myLabel.layer.masksToBounds = true
            myLabel.text = "Page\(i)"
            myLabel.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
            myLabel.layer.cornerRadius = 30.0
            
            scrollViewHeader.addSubview(myLabel)
        }
        
        // PageControlを作成.
        pageControl = UIPageControl(frame: CGRectMake(0, self.view.frame.maxY - 50, width, 50))
        pageControl.backgroundColor = UIColor.lightGrayColor()
        
        // PageControlするページ数を設定.
        pageControl.numberOfPages = pageSize
        
        // 現在ページを設定.
        pageControl.currentPage = 0
        pageControl.userInteractionEnabled = false
        
        self.view.addSubview(pageControl)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit047: UIScrollViewDelegate {
    /*
    ScrollViewが移動した際に呼ばれる.
    */
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView == scrollViewMain {
            scrollViewHeader.contentOffset.x = scrollViewMain.contentOffset.x/4
        }
    }
    
    /*
    移動が完了したら呼ばれる.
    */
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        // スクロール数が1ページ分になったら.
        if fmod(scrollViewMain.contentOffset.x, scrollViewMain.frame.maxX) == 0 {
            // ページの場所を切り替える.
            pageControl.currentPage = Int(scrollViewMain.contentOffset.x / scrollViewMain.frame.maxX)
        }
    }
}

// MARK:Actions
extension UIKit047 {
    
}
