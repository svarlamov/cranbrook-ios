
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

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? 
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.setup()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {}

    func applicationDidEnterBackground(application: UIApplication) {}

    func applicationWillEnterForeground(application: UIApplication) {}

    func applicationDidBecomeActive(application: UIApplication) {}

    func applicationWillTerminate(application: UIApplication) {}
    
    func setup() {
        
        //  Setup Beta Testing Through HockeyApp
        self.setupHockeyApp()
        
        //  Setup remote configuration
        RemoteConfig.config.getRemoteData()
        
        //  Crashlytics and Answers Fabric.io configuration
        Fabric.with([Crashlytics.self])
        Analytics.analytics.logUserSession()
        
        //  Rollout configuration
        Rollout.setupWithKey("57ddb79c8718e2f531cb2787")
        
    }
    
    func setupHockeyApp() {
        BITHockeyManager.sharedHockeyManager().configureWithIdentifier("86fca75433854717b583bea2cd3ee8f1")
        BITHockeyManager.sharedHockeyManager().startManager()
        BITHockeyManager.sharedHockeyManager().authenticator.authenticateInstallation()

    }
    
}










