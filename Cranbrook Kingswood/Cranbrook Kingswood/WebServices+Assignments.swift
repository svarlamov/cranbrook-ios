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
                if self.isRequestSuccessful(inputData: assignmentRequestResponse) {
                    let dateAssignmentResponseArray: [NSDictionary] = assignmentRequestResponse.rawValue as! [NSDictionary]
                    for responseObject in dateAssignmentResponseArray {
                        let singularResponse: NSDictionary = responseObject
                        let singularAssignment: AssignmentDataStructure? = self.mapAssignmentsForDate(singularResponse)
                        assignmentsForDateListArray.append(singularAssignment!)
                    }
                    specificDateAssignments = nil
                    specificDateAssignments = assignmentsForDateListArray
                    callBack(isRequestSuccessful: true)
                } else {
                    self.reAuthenticateUser({ (isReAuthenticationSuccessful) in
                        self.getAssignmentsForDateErrorHandling(forDate, callBack: { (isRequestSuccessful) in
                            callBack(isRequestSuccessful: true)
                        })
                    })
                }
            } else {
                callBack(isRequestSuccessful: false)
            }
        }
    }
    
    private func getAssignmentsForDateErrorHandling(forDate: NSDate, callBack: (isRequestSuccessful: Bool) -> Void) {
        let getAssignmentsForDateRequest: NSMutableURLRequest = createAssignmentsForDateRequest(forDate)
        var assignmentsForDateListArray: [AssignmentDataStructure] = [AssignmentDataStructure]()
        Alamofire.request(getAssignmentsForDateRequest).responseJSON { response in
            if let assignmentRequestResponse: JSON = JSON(response.result.value!) {
                let dateAssignmentResponseArray: [NSDictionary] = assignmentRequestResponse.rawValue as! [NSDictionary]
                for responseObject in dateAssignmentResponseArray {
                    let singularResponse: NSDictionary = responseObject
                    let singularAssignment: AssignmentDataStructure? = self.mapAssignmentsForDate(singularResponse)
                    assignmentsForDateListArray.append(singularAssignment!)
                }
                specificDateAssignments = nil
                specificDateAssignments = assignmentsForDateListArray
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
        request.HTTPMethod = RequestType.GET.rawValue
        if let sessionToken = currentSessionInfo?.sessionToken {
            request.setValue("t=\(sessionToken)", forHTTPHeaderField: "Cookie")
        }
        return request
    }
    
    private func createAssignmentsForDateRequestURL(forDate: NSDate) -> String {
        var returnString: String = String()
        let urlDateString: String = setupAssignmentDateString(date: forDate)
        returnString = "\(self.assignmentsEndPoint)\(urlDateString)&dateEnd=\(urlDateString)&persona=\(self.assignmentsPersonaID)&statusList=&sectionList="
        return returnString
    }
    
    private func setupAssignmentDateString(date date: NSDate) -> String {
        var returnString: String = String()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "\(self.assignmentsDateFormat)"
        returnString = dateFormatter.stringFromDate(date)
        returnString = returnString.stringByReplacingOccurrencesOfString("/", withString: "%2F", options: NSStringCompareOptions.LiteralSearch, range: nil)
        return returnString
    }
    
}







