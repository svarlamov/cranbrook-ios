//
//  StartupViewController+SetupData.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 8/31/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Unbox

extension StartupViewController {
    
    func login() {
        if (recoverLastLoggedInState()) {
            let username: String = userLoginInfo!.username
            let password: String = userLoginInfo!.password
            WebServices.service.loginWithParameters(username: username, password: password, callBack: { (isLoginSuccessful) in
                if isLoginSuccessful {
                    self.getStudentGroupTerm()
                } else {
                    destroyPersistedLoginData()
                    self.takeSegue(.login)
                }
            })
            
        } else {
            print(loginCurrentUserStatusPrintOptions.noCurrentUser.rawValue)
            takeSegue(.login)
            
        }
    }
    
    private func getStudentGroupTerm() {
        WebServices.service.getStudentGroupTermList({ (isRequestSuccessful) in
            self.getStudentClasses()
        })
    }
    
    private func getStudentClasses() {
        WebServices.service.getCurrentUserClasses(true) { (isRequestSuccessful) in
            self.getEventsForCurrentDate()
        }
    }
    
    private func getEventsForCurrentDate() {
        WebServices.service.getCalendarTasksForDate(date: NSDate()) { (isRequestSuccessful) in
            self.takeSegue(.continuation)
        }
    }
    
}
