//
//  AppDelegate.swift
//  Chives
//
//  Created by Jackson Jessup on 8/18/14.
//  Copyright (c) 2014 Jackson Jessup. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, REFrostedViewControllerDelegate {
                            
    var window: UIWindow?
    var MenuController : REFrostedViewController?
    
    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // AFNetworking Activity Manager is now enabled.
//        AFNetworkActivityIndicatorManager.sharedManager().enabled = true
        
        // WIT instantiation
        Wit.sharedInstance().accessToken = "ZKVSTYO5Y4B5XXXRAOT6IT74JZTDRLN7";
        
        // light status bar.
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
        // sets up title screens to open.
        println(UIDevice.currentDevice().model)
        
        var menuVC : MenuVC = MenuVC(style: UITableViewStyle.Plain)

        var contentVC = Singleton.getSingleton().getStoryboard().instantiateInitialViewController() as UINavigationController
        contentVC.navigationBarHidden = true
        
        MenuController = REFrostedViewController(contentViewController: contentVC, menuViewController: menuVC)
        MenuController?.direction = REFrostedViewControllerDirection.Left
        MenuController?.liveBlurBackgroundStyle = REFrostedViewControllerLiveBackgroundStyle.Dark;
        MenuController?.liveBlur = true;
        MenuController?.delegate = self;
        
        self.window?.rootViewController = MenuController
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        UIApplication.sharedApplication().statusBarHidden = true
        self.window?.makeKeyAndVisible()

        return true;
    }

    func applicationWillResignActive(application: UIApplication!) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication!) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication!) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication!) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication!) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // ============================================================================
    // ============================================================================
    
    func presentMenu()
    {
        MenuController?.presentMenuViewController();
    }
    
    // ============================================================================
    //                          REFrostedviewController delegates
    // ============================================================================
    
}

