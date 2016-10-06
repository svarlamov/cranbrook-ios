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
    
    private let isAnalyticsEnabled: Bool = false
    
    static let analytics = Analytics()
    
    //  Login Analytics Method
    internal func analyticsLogin(username: String, isSuccessful: Bool) {
        var boolNumber: NSNumber = NSNumber()
        if isSuccessful {
            boolNumber = 1
        } else {
            boolNumber = 0
        }
        dispatch_async(dispatch_get_main_queue(),{
            if self.isAnalyticsEnabled {
                Answers.logLoginWithMethod("Login", success: boolNumber, customAttributes: ["Username":"\(username)"])
            }
        })
    }
    
    //  Date Selection Method for Assignment
    internal func assignmentDateSelection(date: String) {
        dispatch_async(dispatch_get_main_queue(),{
            if self.isAnalyticsEnabled {
                Answers.logCustomEventWithName("AssignmentDateSelection", customAttributes: ["User":"\(userLoginInfo!.username)", "Date Selected":"\(date)"])
            }
        })
    }
    
    //  Sign Out Method
    internal func logSignOut(username: String) {
        dispatch_async(dispatch_get_main_queue(),{
            if self.isAnalyticsEnabled {
                Answers.logCustomEventWithName("SignOut", customAttributes: ["User":"\(username)"])
            }
        })
    }
    
    //  Search Analytics Method
    internal func logSearch(searchQuery: String) {
        dispatch_async(dispatch_get_main_queue(), {
            if self.isAnalyticsEnabled {
                Answers.logSearchWithQuery("\(searchQuery)", customAttributes: ["User":"\(userLoginInfo!.username)"])
            }
        })
    }
    
    //  User Session Analytics Method
    internal func logUserSession() {
        dispatch_async(dispatch_get_main_queue(), {
            if self.isAnalyticsEnabled {
                Answers.logCustomEventWithName("Application Launches", customAttributes: nil)
            }
        })
    }
    
    //  Tab Switches Analytics Method
    internal func logTabSelection(selectedTab: String) {
        dispatch_async(dispatch_get_main_queue(), {
            if self.isAnalyticsEnabled {
                Answers.logCustomEventWithName("Tab Selection", customAttributes: ["Selected Tab":"\(selectedTab)"])
            }
        })
    }
    
    //  Calendar Selected Analytics Method
    internal func logCalendarSelection() {
        dispatch_async(dispatch_get_main_queue(), {
            if self.isAnalyticsEnabled {
                Answers.logCustomEventWithName("Calendar Selected", customAttributes: ["User":"\(userLoginInfo!.username)"])
            }
        })
    }
    
    //  Assingment Status Changed Analytics Method
    internal func logAssignmentStatusChanged(status: String) {
        dispatch_async(dispatch_get_main_queue(), {
            if self.isAnalyticsEnabled {
                Answers.logCustomEventWithName("Assignment Status Changed", customAttributes: ["User":"\(userLoginInfo!.username)", "Status":"\(status)"])
            }
        })
    }
    
    //  Assingment Detail Selected
    internal func logAssignmentDetailSelected() {
        dispatch_async(dispatch_get_main_queue(), {
            if self.isAnalyticsEnabled {
                Answers.logCustomEventWithName("Assignment Detail Selected", customAttributes: ["User":"\(userLoginInfo!.username)"])
            }
        })
    }
    
}








