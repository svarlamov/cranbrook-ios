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
import Unbox
import Fabric
import Crashlytics

enum LoginPersistenceKeys: String {
    case LastLoggedInUsername   = "LastLoggedInUsername"
    case LastLoggedInPassword   = "LastLoggedInPassword"
}

enum CredentialValidationMessages: String {
    case NotValid   = "credentials_invalid"
    case Valid      = "credentials_valid"
}

func persistLoginData(username: String, password: String) {
    let defaults = NSUserDefaults.standardUserDefaults()
    defaults.setObject(username, forKey: LoginPersistenceKeys.LastLoggedInUsername.rawValue)
    defaults.setObject(password, forKey: LoginPersistenceKeys.LastLoggedInPassword.rawValue)
    userLoginInfo = UserLoginInfoStructure(username: username, password: password)
    defaults.synchronize()
}

func destroyPersistedLoginData () {
    let defaults = NSUserDefaults.standardUserDefaults()
    defaults.removeObjectForKey(LoginPersistenceKeys.LastLoggedInUsername.rawValue)
    defaults.removeObjectForKey(LoginPersistenceKeys.LastLoggedInPassword.rawValue)
    userLoginInfo = nil
    defaults.synchronize()
}

func recoverLastLoggedInState() -> Bool {
    let defaults = NSUserDefaults.standardUserDefaults()
    if defaults.stringForKey(LoginPersistenceKeys.LastLoggedInUsername.rawValue) != nil && defaults.stringForKey(LoginPersistenceKeys.LastLoggedInPassword.rawValue) != nil {
        let currentUsername: String = defaults.stringForKey(LoginPersistenceKeys.LastLoggedInUsername.rawValue)!
        let currentPassword: String = defaults.stringForKey(LoginPersistenceKeys.LastLoggedInPassword.rawValue)!
        userLoginInfo = UserLoginInfoStructure(username: currentUsername, password: currentPassword)
        return true
    }
    return false
}

extension WebServices {
    
    internal func loginWithParameters(username username:String, password:String, callBack: (isLoginSuccessful: Bool) -> Void) {
        Answers.logCustomEventWithName("Login", customAttributes: ["Username":"\(username)"])
        let loginParameters: [String: String] = createLoginParameters(username: username, password: password)
        let requestURL: String = endpointPath(self.loginEndpoint)
        
        Alamofire.request(.POST, requestURL, parameters: loginParameters, encoding: .JSON, headers: loginHeaders).responseJSON { response in
            
            if let loginResponse: JSON = JSON(response.result.value!) {
                let isLoginSuccessful = loginResponse["LoginSuccessful"].boolValue
                
                if isLoginSuccessful {
                    let studentID = loginResponse["CurrentUserForExpired"].stringValue
                    let sessionToken = self.getKeyForUserSession(data: response)
                    currentSessionInfo = CurrentLoggedInUserInfo(userId: studentID, sessionToken: sessionToken!)
                    let instanceUsername: String = loginParameters["Username"]!
                    let instancePassword: String = loginParameters["Password"]!
                    persistLoginData(instanceUsername, password: instancePassword)
                    callBack(isLoginSuccessful: true)
                    print("login_successful. student_id:\(studentID). session_token:\(sessionToken!)")
                    
                } else {
                    callBack(isLoginSuccessful: false)
                    print("login_failed")
                    
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









