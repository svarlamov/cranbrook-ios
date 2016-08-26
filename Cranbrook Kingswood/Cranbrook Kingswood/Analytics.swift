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
    
    static let analytics = Analytics()
    
    func analyticsLogin(username: String, isSuccessful: Bool) {
        var boolNumber: NSNumber = NSNumber()
        if isSuccessful {
            boolNumber = 1
        } else {
            boolNumber = 0
        }
        Answers.logLoginWithMethod("Login", success: boolNumber, customAttributes: ["Username":"\(username)"])
    }
    
}
