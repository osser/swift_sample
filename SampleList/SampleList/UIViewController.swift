//
//  UIViewController.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/11.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

// MARK:画面関数
extension UIViewController {
    func openTheWindow(win:UIViewController){
        win.modalPresentationStyle = .OverCurrentContext;
        win.modalTransitionStyle = .CoverVertical;
        presentViewController(win, animated: true, completion: {});
    }
    func closeTheWindow(win:UIViewController){
        win.dismissViewControllerAnimated(true, completion: {});
    }
    func pushWindow(win:UIViewController){
        navigationController?.pushViewController(win, animated: true);
    }
    func popWindow(win:UIViewController){
        //navigationController?.popToViewController(win, animated: true);
        navigationController?.popViewControllerAnimated(true);
    }
}

// MARK:コントール作成
extension UIViewController {
    func buildTestLabel(){
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height));
        label.font = UIFont(name: label.font!.familyName, size: 30);
        label.textAlignment = .Center;
        label.text = "確認用";
        view.addSubview(label);
    }
    func buildGitHubSourceWebViewButton(sourceid:String) -> GithubSourceUIBarButtonItem {
        let button:GithubSourceUIBarButtonItem = GithubSourceUIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "buildGitHubSourceWebViewButton_click:");
        button.sourceid = sourceid;
        return button;
    }
    func buildGitHubSourceWebViewButton_click(sender: GithubSourceUIBarButtonItem) {
        //print("buildGitHubSourceWebViewButton_click: sourceid=\(sender.sourceid)");
        let win = GitHubSourceWebView(sourceid: sender.sourceid);
        //openTheWindow(win);
        pushWindow(win);
    }
}

// MARK:便利プロパティー

extension UIViewController {
    // デフォルトFloat(44)としてUnwrap
    var navigationBarHeight:CGFloat {
        get {
            return navigationController?.navigationBar.frame.size.height ?? 44;
        }
    }
}