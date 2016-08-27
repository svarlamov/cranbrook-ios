//
//  Analytics.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 8/26/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Firebase

class Analytics {
    
    private var isAnalyticsEnabled: Bool = true
    
    static let analytics = Analytics()
    
    //  Login Analytics Method
    internal func logUserSignIn(username: String, isSuccessful: Bool) {
        dispatch_async(dispatch_get_main_queue(),{
            if self.isAnalyticsEnabled {
                FIRAnalytics.logEventWithName("LoginRequest", parameters: ["Username": username, "success": String(isSuccessful)])
            }
        })
    }
    
    //  Search Analytics Method
    internal func logSearch(searchQuery: String) {
        dispatch_async(dispatch_get_main_queue(), {
            if self.isAnalyticsEnabled {
                FIRAnalytics.logEventWithName("DirectorySearch", parameters: ["SearchQuery":searchQuery, "User":"\(userLoginInfo!.username)"])
            }
        })
    }
    
    //  User Session Analytics Method
    internal func logUserSession() {
        dispatch_async(dispatch_get_main_queue(), {
            if self.isAnalyticsEnabled {
                FIRAnalytics.logEventWithName("UserSession", parameters: nil)
            }
        })
    }
    
    //  Tab Switches Analytics Method
    internal func logTabSelection(selectedTab: String) {
        dispatch_async(dispatch_get_main_queue(), {
            if self.isAnalyticsEnabled {
                FIRAnalytics.logEventWithName("TabSelection", parameters: ["SelectedTab":"\(selectedTab)"])
            }
        })
    }
    
}








