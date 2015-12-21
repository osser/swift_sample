//
//  AppDelegate.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/11.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var myEffectView: UIView!

    private func styleApp() {
        let fontAttributes = [NSFontAttributeName: UIFont.latoLightFontOfSize(18),
            NSForegroundColorAttributeName: UIColor.blackColor()];
        UINavigationBar.appearance().titleTextAttributes = fontAttributes;
        UIBarButtonItem.appearance().setTitleTextAttributes(fontAttributes, forState: .Normal);
        UINavigationBar.appearance().tintColor = UIColor.midnightblue();
        UINavigationBar.appearance().barTintColor = UIColor.clouds();
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        styleApp()
        
        let mainController = MainViewController();
        let navigatorController = UINavigationController(rootViewController: mainController);
        navigatorController.navigationBar.backgroundColor = UIColor.nephritis();

        let mainWindow = UIWindow(frame: UIScreen.mainScreen().bounds);
        mainWindow.backgroundColor = UIColor.whiteColor();
        //mainWindow.rootViewController = mainController;
        mainWindow.rootViewController = navigatorController;
        mainWindow.makeKeyAndVisible();
        window = mainWindow;
        
        return true;
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        
        print("applicationWillResignActive");
        
        let effect: UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        myEffectView = UIVisualEffectView(effect: effect)
        myEffectView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height)
        self.window?.addSubview(myEffectView)
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        print("applicationDidBecomeActive");
        
        if myEffectView != nil {
            self.myEffectView.removeFromSuperview()
        }
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

