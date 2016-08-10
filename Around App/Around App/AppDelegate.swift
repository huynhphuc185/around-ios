//
//  AppDelegate.swift
//  Around App
//
//  Created by phuc.huynh on 8/3/16.
//  Copyright © 2016 phuc.huynh. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit
import GoogleMaps
@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        GMSServices.provideAPIKey("AIzaSyDlnT_CugXARE5znre0W8k5snI9v-LDnt4")
        // Override point for customization after application launch.
        let notiType:UIUserNotificationType = [.Alert, .Badge, .Sound]
        let settings = UIUserNotificationSettings(forTypes: notiType, categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        UIApplication.sharedApplication().registerForRemoteNotifications()
        UIApplication.sharedApplication().applicationIconBadgeNumber = 0
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        if defaults.objectForKey("token") == nil{
            defaults.setObject("", forKey: "token")
        }
        
        UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: true)
        
        
        
        
        if let _ = defaults.stringForKey("isAppAlreadyLaunchedOnce"){
            let vc : UIViewController?
            if defaults.valueForKey("token") as! String == ""
            {
                vc = storyboard.instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
            }
                
            else{
                vc = storyboard.instantiateViewControllerWithIdentifier("SWRevealViewController") as! SWRevealViewController
            }
            window =  UIWindow(frame: UIScreen.mainScreen().bounds)
            window?.makeKeyAndVisible()
            self.window?.rootViewController = vc
        }else{
            defaults.setBool(true, forKey: "isAppAlreadyLaunchedOnce")
            let vc = storyboard.instantiateViewControllerWithIdentifier("TutorialViewController") as! TutorialViewController
            window =  UIWindow(frame: UIScreen.mainScreen().bounds)
            window?.makeKeyAndVisible()
            self.window?.rootViewController = vc
        }
        
        
        return true
        
    }
    
    
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
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
        FBSDKAppEvents.activateApp()
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        let characterSet: NSCharacterSet = NSCharacterSet( charactersInString: "<>" )
        let deviceTokenString: String = ( deviceToken.description as NSString )
            .stringByTrimmingCharactersInSet( characterSet )
            .stringByReplacingOccurrencesOfString( " ", withString: "" ) as String
        deviceTokenStr = deviceTokenString
        print("device token: ", deviceTokenString )
        
    }
    
    
    
}

