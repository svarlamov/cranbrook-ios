//
//  Constants.swift
//  Cranbrook Kingswood
//
//  Created by private on 8/6/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Unbox
import Alamofire
import SwiftyJSON

var currentSessionInfo: CurrentLoggedInUserInfo?        = nil
var studentClassArray: [CurrentUserClasses]?            = nil
var searchResults: [SearchResultResponse]?              = [SearchResultResponse]?()
var selectedTab: SelectedTabOptions                     = SelectedTabOptions.ClassesTab
var userLoginInfo: UserLoginInfoStructure?              = nil;
var classDetailsArray: [[CurrentUserClassDetail]]?      = nil;
let assignmentsDateList: DateListStructure              = DateListStructure()







