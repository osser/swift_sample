//
//  UIKit043.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/21.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit043: UIViewController {

    private var myWebView: UIWebView!

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
extension UIKit043 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.whiteColor();
        
        // WebViewを生成.
        myWebView = UIWebView()
                
        // WebViewのサイズを設定する.
        myWebView.frame = self.view.bounds
        
        // Viewに追加する.
        self.view.addSubview(myWebView)
        
        // URLを設定する.
        let url: NSURL = NSURL(string: "https://github.com/osser/swift_sample/blob/dev/SampleList/SampleList/\(self.classForCoder).swift")!
        
        // リクエストを作成する.
        let request: NSURLRequest = NSURLRequest(URL: url)
        
        // リクエストを実行する.
        myWebView.loadRequest(request)

    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit043 {
    
}

// MARK:Actions
extension UIKit043 {
    
}
