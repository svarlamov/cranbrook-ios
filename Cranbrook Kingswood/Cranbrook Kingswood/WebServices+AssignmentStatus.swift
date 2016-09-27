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
                let responseSuccess = requestResponse["\(self.assignmentStatusWasVoidKey)"].boolValue
                if responseSuccess {
                    callBack(isRequestSuccessful: true)
                } else {
                    callBack(isRequestSuccessful: false)
                }
                
            } else {
                callBack(isRequestSuccessful: false)
            }
        }
    }
    
    private func createAssignmentsStatusRequestURL(assignmentId: String, status: AssingmentStatus) -> String {
        var returnString: String = String()
        returnString = "\(self.assignmentStatusEndpoint)\(assignmentId)&assignmentStatus=\(String(status.rawValue))"
        return returnString
    }
    
    private func createAssignmentStatusChangeRequest(assignmentId id: String, forStatus status: AssingmentStatus) -> NSMutableURLRequest {
        let requestStringURL: String = createAssignmentsStatusRequestURL(id, status: status)
        let requestUrl: NSURL = NSURL(string: requestStringURL)!
        let requestDictionary: NSDictionary = ["\(self.assignmentStatusKey)":Int(id)!, "\(self.assignmentStatusMainKey)":status.rawValue]
        let request = NSMutableURLRequest(URL: requestUrl)
        request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(requestDictionary, options: [])
        request.HTTPMethod = RequestType.POST.rawValue
        if let sessionToken = currentSessionInfo?.sessionToken {
            request.setValue("t=\(sessionToken)", forHTTPHeaderField: "Cookie")
        }
        return request
    }
    
}


