//
//  GitHubSourceWebView.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/16.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit
import Cartography
import LatoFont
import MGSwipeTableCell

class GitHubSourceWebView: UIViewController {
    
    private var myWebView: UIWebView!
    
    var sourceid:String = "";
    
    init(sourceid: String) {
        self.sourceid = sourceid;
        
        super.init(nibName: nil, bundle: nil);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("未実装");
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        setup();
        layoutView();
    }
}

// MARK:初期化
extension GitHubSourceWebView {
    func setup(){
        view.backgroundColor = UIColor.asbestos();
        
        view.backgroundColor = UIColor.whiteColor();
        
        // WebViewを生成.
        myWebView = UIWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        
        // WebViewのサイズを設定する.
        //myWebView.frame = self.view.bounds
        
        // Viewに追加する.
        self.view.addSubview(myWebView)
        
        // URLを設定する.
        let url: NSURL = NSURL(string: "https://github.com/osser/swift_sample/blob/dev/SampleList/SampleList/\(self.sourceid).swift")!
        
        // リクエストを作成する.
        let request: NSURLRequest = NSURLRequest(URL: url)
        
        // リクエストを実行する.
        myWebView.loadRequest(request)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension GitHubSourceWebView {
    
}

// MARK:Actions
extension GitHubSourceWebView {
    
}
