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

var currentSessionInfo: CurrentLoggedInUserInfo?                = nil
//
var studentClassArray: [CurrentUserClasses]?                    = nil
//
var searchResults: [SearchResultResponse]?                      = [SearchResultResponse]?()
//
var selectedTab: SelectedTabOptions                             = SelectedTabOptions.ClassesTab
//
var userLoginInfo: UserLoginInfoStructure?                      = nil;
//
var classDetailsArray: [[CurrentUserClassDetail]]?              = nil;
//
let assignmentsDateList: DateListStructure                      = DateListStructure()
//
var isNetworkAvailable: Bool                                    = Bool()
//
var studentGroupTermListArray: [StudentGroupTermStructure]?     = nil
//
var specificDateAssignments: [AssignmentDataStructure]?         = nil
//
var calendarTasksForDate: [CalendarItemDataStructure]?          = nil
//
var userCalendarId: String?                                     = nil
//
var selectedSearchResult: SearchResultResponse?                 = nil
//
var selectedSearchDirectory: SearchDirectories                  = SearchDirectories.Students
//
var remoteConfigData: RemoteConfigDataStructure?                = nil
//
var gradeBookForSelectedClass: [[CurrentUserClassDetail]]?      = nil
//
var assignmentDetailData: AssignmentDetailDataStructure?        = nil

func setupLogout() {
    currentSessionInfo = nil
    studentClassArray = nil
    searchResults = nil
    selectedTab = SelectedTabOptions.ClassesTab
    userLoginInfo = nil
    classDetailsArray = nil
    studentGroupTermListArray = nil
    specificDateAssignments = nil
    calendarTasksForDate = nil
    userCalendarId = nil
    selectedSearchResult = nil
    selectedSearchDirectory = SearchDirectories.Students
    gradeBookForSelectedClass = nil
    assignmentDetailData = nil
}
