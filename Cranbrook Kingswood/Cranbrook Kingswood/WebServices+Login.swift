//
//  WebServices+Login.swift
//  Cranbrook Kingswood
//
//  Created by private on 8/6/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum LoginPersistenceKeys: String {
    case LastLoggedInUsername = "LastLoggedInUsername"
    case LastLoggedInPassword = "LastLoggedInPassword"
}

func persistLoginData(username: String, password: String) {
    let defaults = NSUserDefaults.standardUserDefaults()
    defaults.setObject(username, forKey: LoginPersistenceKeys.LastLoggedInUsername.rawValue)
    defaults.setObject(password, forKey: LoginPersistenceKeys.LastLoggedInPassword.rawValue)
    defaults.synchronize()
}

func destroyPersistedLoginData () {
    let defaults = NSUserDefaults.standardUserDefaults()
    defaults.removeObjectForKey(LoginPersistenceKeys.LastLoggedInUsername.rawValue)
    defaults.removeObjectForKey(LoginPersistenceKeys.LastLoggedInPassword.rawValue)
    defaults.synchronize()
}

func recoverLastLoggedInState() -> Bool {
    let defaults = NSUserDefaults.standardUserDefaults()
    if defaults.stringForKey(LoginPersistenceKeys.LastLoggedInUsername.rawValue) != nil {
        let currentUsername: String = defaults.stringForKey(LoginPersistenceKeys.LastLoggedInUsername.rawValue)!
        let currentPassword: String = defaults.stringForKey(LoginPersistenceKeys.LastLoggedInPassword.rawValue)!
        WebServices.service.loginWithParameters(username: currentUsername, password: currentPassword)
        return true
    }
    return false
}

extension WebServices {
    
    internal func loginWithParameters(username username:String, password:String) {
        let loginParameters: [String: String] = createLoginParameters(username: username, password: password)
        let requestURL: String = endpointPath(self.loginEndpoint)
        login(headers: loginHeaders, parameters: loginParameters, requestLink: requestURL)
    }
    
    private func login(headers headers:[String:String], parameters:[String:String], requestLink:String) {
        
        Alamofire.request(.POST, requestLink, parameters: parameters, encoding: .JSON, headers: headers).responseJSON { response in
            
            if let loginResponse: JSON = JSON(response.result.value!) {
                let isLoginSuccessful = loginResponse["LoginSuccessful"].boolValue
                
                if isLoginSuccessful {
                    let studentID = loginResponse["CurrentUserForExpired"].stringValue
                    let sessionToken = self.getKeyForUserSession(data: response)
                    currentSessionInfo = CurrentLoggedInUserInfo(userId: studentID, sessionToken: sessionToken!)
                    print("login attempt successful. student id is: \(studentID). session token: \(sessionToken!)")
                    
                } else {
                    print("login attempt failed")
                    
                }
                
            }
                
        }
        
    }
    
    private func getKeyForUserSession(data cookieData: Response<AnyObject, NSError>) -> String? {
        
        if let headerFields = cookieData.response?.allHeaderFields as? [String: String], URL = cookieData.request?.URL {
            let cookies = NSHTTPCookie.cookiesWithResponseHeaderFields(headerFields, forURL: URL)
            
            for cookie in cookies {
                let name = cookie.name
                if name == "t" {
                    let value = cookie.value
                    return value
                }
            }
            
        }
        
        return nil
        
    }
    
    private func createLoginParameters(username username:String, password:String) -> [String:String] {
        return ["From": "", "Username": "\(username)", "Password": "\(password)", "remember": "false", "InterfaceSource": "WebApp"]
    }
    
}