//
//  Analytics.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 8/26/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Fabric
import Crashlytics

class Analytics {
    
    private var isAnalyticsEnabled: Bool = true
    
    static let analytics = Analytics()
    
    //  Login Analytics Method
    internal func analyticsLogin(username: String, isSuccessful: Bool) {
        var boolNumber: NSNumber = NSNumber()
        if isSuccessful {
            boolNumber = 1
        } else {
            boolNumber = 0
        }
        if isAnalyticsEnabled {
            Answers.logLoginWithMethod("Login", success: boolNumber, customAttributes: ["Username":"\(username)"])
        }
    }
    
    //  Search Analytics Method
    internal func logSearch(searchQuery: String) {
        if isAnalyticsEnabled {
            Answers.logSearchWithQuery("\(searchQuery)", customAttributes: ["User":"\(userLoginInfo?.username)"])
        }
    }
    
    //  User Session Analytics Method
    internal func logUserSession() {
        if isAnalyticsEnabled {
            Answers.logCustomEventWithName("Application Launches", customAttributes: nil)
        }
    }
    
    //  Tab Switches Analytics Method
    internal func logTabSelection(selectedTab: String) {
        if isAnalyticsEnabled {
            Answers.logCustomEventWithName("Tab Selection", customAttributes: ["Selected Tab":"\(selectedTab)"])
        }
    }
    
}
