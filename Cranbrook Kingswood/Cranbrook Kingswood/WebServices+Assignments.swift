//
//  WebServices+Assignments.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 8/26/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Unbox
import Alamofire
import SwiftyJSON

extension WebServices {
    
    internal func getAssignmentsForDate(date date: NSDate, callBack: (isRequestSuccessful: Bool) -> Void) {
        getAssignmentsForDateSubMethod(date) { (isRequestSuccessful) in
            if isRequestSuccessful {
                callBack(isRequestSuccessful: true)
            } else {
                callBack(isRequestSuccessful: false)
            }
        }
    }
    
    private func getAssignmentsForDateSubMethod(forDate: NSDate, callBack: (isRequestSuccessful: Bool) -> Void) {
        let getAssignmentsForDateRequest: NSMutableURLRequest = createAssignmentsForDateRequest(forDate)
        var assignmentsForDateListArray: [AssignmentDataStructure] = [AssignmentDataStructure]()
        Alamofire.request(getAssignmentsForDateRequest).responseJSON { response in
            if let assignmentRequestResponse: JSON = JSON(response.result.value!) {
                print(assignmentRequestResponse)
                callBack(isRequestSuccessful: true)
            } else {
                callBack(isRequestSuccessful: false)
            }
            
        }
    }
    
    private func mapAssignmentsForDate(responseObject: NSDictionary) -> AssignmentDataStructure? {
        do {
            let responseElement: AssignmentDataStructure = try Unbox(responseObject as! UnboxableDictionary)
            return responseElement
        } catch {}
        return nil;
    }
    
    private func createAssignmentsForDateRequest(forDate: NSDate) -> NSMutableURLRequest {
        let requestStringURL: String = createAssignmentsForDateRequestURL(forDate)
        let requestUrl: NSURL = NSURL(string: requestStringURL)!
        let request = NSMutableURLRequest(URL: requestUrl)
        request.HTTPMethod = "GET"
        if let sessionToken = currentSessionInfo?.sessionToken {
            request.setValue("t=\(sessionToken)", forHTTPHeaderField: "Cookie")
        }
        return request
    }
    
    private func createAssignmentsForDateRequestURL(forDate: NSDate) -> String {
        var returnString: String = String()
        returnString = "https://cranbrook.myschoolapp.com/api/DataDirect/AssignmentCenterAssignments/?format=json&filter=1&dateStart=9%2F8%2F2016&dateEnd=9%2F8%2F2016&persona=2&statusList=&sectionList="
        return returnString
    }
    
}
