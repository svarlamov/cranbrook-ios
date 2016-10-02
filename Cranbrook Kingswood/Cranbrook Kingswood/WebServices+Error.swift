//
//  WebServices+Error.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 10/2/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension WebServices {
    
    internal func isUserAbleToMakeRequest(callBack: (isAbleToMakeRequest: Bool) -> Void) {
        self.isUserAbleToMakeRequestSubMethod { (isAbleToMakeRequest) in
            if isAbleToMakeRequest {
                callBack(isAbleToMakeRequest: true)
            } else {
                callBack(isAbleToMakeRequest: false)
            }
        }
    }
    
    private func isUserAbleToMakeRequestSubMethod(callBack: (isAbleToMakeRequest: Bool) -> Void) {
        let request: NSMutableURLRequest = createErrorCheckingRequest()
        Alamofire.request(request).responseJSON { response in
            if let requestResponse: JSON = JSON(response.result.value!) {
                if requestResponse.rawValue["Error"] != nil {
                    let username: String = userLoginInfo!.username
                    let password: String = userLoginInfo!.password
                    WebServices.service.loginWithParameters(username: username, password: password, callBack: { (isLoginSuccessful) in
                        callBack(isAbleToMakeRequest: true)
                    })
                } else {
                    callBack(isAbleToMakeRequest: true)
                }
            } else {
                callBack(isAbleToMakeRequest: false)
            }
        }
    }
    
    private func createErrorCheckingRequest() -> NSMutableURLRequest {
        let requestUrl: NSURL = NSURL(string: "https://cranbrook.myschoolapp.com/api/directory/directoryget?directoryId=449")!
        let request = NSMutableURLRequest(URL: requestUrl)
        request.HTTPMethod = RequestType.GET.rawValue
        if let sessionToken = currentSessionInfo?.sessionToken {
            request.setValue("t=\(sessionToken)", forHTTPHeaderField: "Cookie")
        }
        return request
    }
    
}
