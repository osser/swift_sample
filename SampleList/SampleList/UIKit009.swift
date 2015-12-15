//
//  UIKit009.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/15.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit009: UIViewController {
    
    private var myWebView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup();
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
extension UIKit009 {
    func setup(){
        view.backgroundColor = UIColor.whiteColor();
        
        // WebViewを生成.
        myWebView = UIWebView()
        
        // Delegateを設定する.
        myWebView.delegate = self
        
        // WebViewのサイズを設定する.
        myWebView.frame = self.view.bounds
        
        // Viewに追加する.
        self.view.addSubview(myWebView)
        
        // URLを設定する.
        let url: NSURL = NSURL(string: "https://www.google.co.jp")!
        
        // リクエストを作成する.
        let request: NSURLRequest = NSURLRequest(URL: url)
        
        // リクエストを実行する.
        myWebView.loadRequest(request)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit009: UIWebViewDelegate {
    /*
    Pageがすべて読み込み終わった時呼ばれるデリゲートメソッド.
    */
    func webViewDidFinishLoad(webView: UIWebView) {
        print("webViewDidFinishLoad")
    }
    
    /*
    Pageがloadされ始めた時、呼ばれるデリゲートメソッド.
    */
    func webViewDidStartLoad(webView: UIWebView) {
        print("webViewDidStartLoad")
    }
}

// MARK:Actions
extension UIKit009 {
}
