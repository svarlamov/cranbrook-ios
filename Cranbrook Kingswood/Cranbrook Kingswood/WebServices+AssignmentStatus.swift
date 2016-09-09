//
//  WebServices+AssignmentStatus.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 9/6/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Unbox
import Alamofire
import SwiftyJSON
import SwiftMessages

enum AssingmentStatus: Int {
    case ToDo           = -1
    case inProgress     = 0
    case completed      = 1
}

extension WebServices {
    
    internal func UpdateAssignmentStatus(assignmentId assignmentId: String, toStatus status: AssingmentStatus, callBack: (isRequestSuccessful: Bool) -> Void) {
        self.UpdateAssignmentStatusSubMethod(assignmentId, status: status) { (isRequestSuccessful) in
            if isRequestSuccessful {
                callBack(isRequestSuccessful: true)
            } else {
                callBack(isRequestSuccessful: false)
            }
        }
    }
    
    private func UpdateAssignmentStatusSubMethod(assignmentId: String, status: AssingmentStatus, callBack: (isRequestSuccessful: Bool) -> Void) {
        let getAssignmentsForDateRequest: NSMutableURLRequest = self.createAssignmentStatusChangeRequest(assignmentId: assignmentId, forStatus: status)
        Alamofire.request(getAssignmentsForDateRequest).responseJSON { response in
            if let requestResponse: JSON = JSON(response.result.value!) {
                let mainResponse: [NSDictionary] = requestResponse.rawValue as! [NSDictionary]
                print(mainResponse)
                
            } else {
                callBack(isRequestSuccessful: false)
            }
            
        }
    }
    
    private func createAssignmentsForDateRequestURL(assignmentId: String, status: AssingmentStatus) -> String {
        var returnString: String = String()
        let urlDateString: String = setupDateString(date: forDate)
        returnString = "https://cranbrook.myschoolapp.com/api/DataDirect/AssignmentCenterAssignments/?format=json&filter=1&dateStart=\(urlDateString)&dateEnd=\(urlDateString)&persona=2&statusList=&sectionList="
        return returnString
    }
    
    private func createAssignmentStatusChangeRequest(assignmentId id: String, forStatus status: AssingmentStatus) -> NSMutableURLRequest {
        let requestStringURL: String = createAssignmentsForDateRequestURL(forDate)
        let requestUrl: NSURL = NSURL(string: requestStringURL)!
        let request = NSMutableURLRequest(URL: requestUrl)
        request.HTTPMethod = "GET"
        if let sessionToken = currentSessionInfo?.sessionToken {
            request.setValue("t=\(sessionToken)", forHTTPHeaderField: "Cookie")
        }
        return request
    }
    
    /*
     let requestDictionary = [
     "jsonrpc" : "2.0",
     "id"      : 1,
     "method"  : method,
     "params"  : parameters
     ]
     
     request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(requestDictionary, options: [])
 */
    
}


