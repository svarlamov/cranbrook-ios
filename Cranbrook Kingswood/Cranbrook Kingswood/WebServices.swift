//
//  WebServices.swift
//  Cranbrook Kingswood
//
//  Created by private on 8/6/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Unbox
    
class WebServices {
    
    //  Instance
    static let service = WebServices()
    
    //  API
    static let prefix: String = "https://cranbrook.myschoolapp.com/"
    
    //  Login
    let loginEndpoint: String = "api/SignIn"
    let loginHeaders: [String:String] = [
        "Content-Type":"application/json",
        "Accept":"application/json, text/javascript, */*; q=0.01",
        "Cookie":"ASP.NET_SessionId=3ehspjh5c1uqhlyrj1tjne25; bridge=action=destroy&src=webapp&xdb=false; rxVisitor=1444443613992KPVQJHAQ91K2GFE91ILTIO2H2SSGRVFG; dtCookie=6$665AEE1806B4356104CA41593EA443DA|SimpleServer-App|1; dtCookie=6$665AEE1806B4356104CA41593EA443DA|SimpleServer-App|1; dtLatC=1; rxVT=1444486348600; dtPC=6$284526274_105h4vHCBNJVCOHEPGHECFEATKCGHMBJIAAHIR"
    ]
    
    //  Search
    let searchEndpoint: String = "api/directory/directoryresultsget?directoryId="
    
    //  Student Group Term
    let studentGroupTermEndpoint: String = "api/DataDirect/StudentGroupTermList/?studentUserId="
    let studentGroupTermSchoolYear: String = "2016+-+2017"
    
    func getKeyForUserSession(data cookieData: Response<AnyObject, NSError>) -> String? {
        
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
    
}

func endpointPath(endpoint:String) -> String {
    return "\(WebServices.prefix)\(endpoint)"
}











