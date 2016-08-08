//
//  Constants.swift
//  Cranbrook Kingswood
//
//  Created by private on 8/6/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import SwiftyJSON

var currentSessionInfo: CurrentLoggedInUserInfo? = nil

var studentClassList: [CurrentUserClasses]? = nil

var selectedTab: SelectedTabOptions = SelectedTabOptions.ClassesTab