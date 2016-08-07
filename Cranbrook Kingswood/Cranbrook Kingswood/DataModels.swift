//
//  DataModels.swift
//  Cranbrook Kingswood
//
//  Created by private on 8/6/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import SwiftyJSON

struct CurrentLoggedInUserInfo {
    let userId: String
    let sessionToken: String
    
    init(userId: String, sessionToken: String) {
        self.userId = userId
        self.sessionToken = sessionToken
    }
}
