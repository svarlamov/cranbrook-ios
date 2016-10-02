
//
//  AppDelegate.swift
//  Cranbrook Kingswood
//
//  Created by private on 8/6/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics
import Rollout
import OneSignal

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? 
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //  Setup data
        self.setup()
        
        //  Setup Remote Notifications
        let notificationTypes: UIUserNotificationType = [UIUserNotificationType.Alert, UIUserNotificationType.Badge, UIUserNotificationType.Sound]
        let notificationSettings = UIUserNotificationSettings(forTypes: notificationTypes, categories: nil)
        application.registerForRemoteNotifications()
        application.registerUserNotificationSettings(notificationSettings)
        OneSignal.initWithLaunchOptions(launchOptions, appId: "6ec774da-d1f1-49cc-ae2a-5ba34cb14782")
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {}

    func applicationDidEnterBackground(application: UIApplication) {}

    func applicationWillEnterForeground(application: UIApplication) {}

    func applicationDidBecomeActive(application: UIApplication) {}

    func applicationWillTerminate(application: UIApplication) {}
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) { print(userInfo) }
    
    func setup() {
        
        //  Setup remote configuration
        RemoteConfig.config.getRemoteData()
        
        //  Crashlytics and Answers Fabric.io configuration
        Fabric.with([Crashlytics.self])
        Analytics.analytics.logUserSession()
        
        //  Rollout configuration
        Rollout.setupWithKey("57ddb79c8718e2f531cb2787")
        
    }
    
}










