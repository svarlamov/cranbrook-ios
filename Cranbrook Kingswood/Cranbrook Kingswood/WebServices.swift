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
    
    static let service = WebServices()
    
    static let prefix: String = "https://cranbrook.myschoolapp.com/"
    
    //  Login
    var loginEndpoint: String = "api/SignIn"
    var loginSuccessKey: String = "LoginSuccessful"
    var loginCurrentUserForExpired: String = "CurrentUserForExpired"
    var loginUsernameKey: String = "Username"
    var loginPasswordKey: String = "Password"
    var loginHeaders: [String:String] = [
        "Content-Type":"application/json",
        "Accept":"application/json, text/javascript, */*; q=0.01",
        "Cookie":"ASP.NET_SessionId=3ehspjh5c1uqhlyrj1tjne25; bridge=action=destroy&src=webapp&xdb=false; rxVisitor=1444443613992KPVQJHAQ91K2GFE91ILTIO2H2SSGRVFG; dtCookie=6$665AEE1806B4356104CA41593EA443DA|SimpleServer-App|1; dtCookie=6$665AEE1806B4356104CA41593EA443DA|SimpleServer-App|1; dtLatC=1; rxVT=1444486348600; dtPC=6$284526274_105h4vHCBNJVCOHEPGHECFEATKCGHMBJIAAHIR"
    ]
    
    
    //  Student Group Term List
    var studentGroupTermEndPoint: String = "https://cranbrook.myschoolapp.com/api/DataDirect/StudentGroupTermList/?studentUserId="
    var studentGroupTermSchoolYearLabel: String = "2016+-+2017"
    var studentGruopTermPersonaId: String = "2"
    
    
    //  Current Classes
    var currentClassesEndpoint: String = "https://cranbrook.myschoolapp.com/api/datadirect/ParentStudentUserAcademicGroupsGet?userId="
    var currentClassesSchoolYearLabel: String = "2016+-+2017"
    var currentClassesMemeberLevel: String = "3"
    var currentClassesPersona: String = "2"
    var currentClassesRemovedClassTitle: String = "Cyber Learning Lab"
    
    
    //  Assignments
    var assignmentsEndPoint: String = "https://cranbrook.myschoolapp.com/api/DataDirect/AssignmentCenterAssignments/?format=json&filter=1&dateStart="
    var assignmentsPersonaID: String = "2"
    var assignmentsDateFormat: String = "MM/dd/yyyy"
    
    
    //  Assignment Status Change
    var assignmentStatusWasVoidKey: String = "WasVoid"
    var assignmentStatusKey: String = "assignmentIndexId"
    var assignmentStatusMainKey: String = "assignmentStatus"
    var assignmentStatusEndpoint: String = "https://cranbrook.myschoolapp.com/api/assignment2/assignmentstatusupdate/?format=json&assignmentIndexId="
    
    
    //  Search
    var searchEndpoint: String = "api/directory/directoryresultsget?directoryId="
    
    
    //  Calendar
    var calendarEndPoint: String = "https://cranbrook.myschoolapp.com/api/mycalendar/schedule?startDate="
    var calendarDateFormat: String = "MM/dd/yyyy"
    
    
    //  Calendar ID
    var calendarIdEndpoint: String = "https://cranbrook.myschoolapp.com/api/mycalendar/list/?startDate="
    var calendarIdSettingsTypeId: String = "1"
    var calendarIdUserId: String = "CalendarUserId"
    var calendarIdDateFormat: String = "MM/dd/yyyy"
    
    
    func endpointPath(endpoint:String) -> String {
        return "\(WebServices.prefix)\(endpoint)"
    }
    
    func isRequestSuccessful(inputData data: JSON) -> Bool {
        let response: JSON = data
        if let error = response["ErrorType"].string {
            print("request_error: \(error)")
            return false
        } else {
            return true
        }
    }
    
}











