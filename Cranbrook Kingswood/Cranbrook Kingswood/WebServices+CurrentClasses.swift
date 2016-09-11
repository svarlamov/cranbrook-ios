//
//  WebServices+CurrentClasses.swift
//  Cranbrook Kingswood
//
//  Created by private on 8/6/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Unbox

extension WebServices {
    
    internal func getCurrentUserClasses(forFirstSemester: Bool, callBack: (isRequestSuccessful: Bool) -> Void) {
        getCurrentUserClassesSubMethod(forFirstSemester) { (isRequestSuccessful) in
            if isRequestSuccessful {
                callBack(isRequestSuccessful: true)
            } else {
                callBack(isRequestSuccessful: false)
            }
        }
    }
    
    private func getCurrentUserClassesSubMethod(forFirstSemester: Bool, callBack: (isRequestSuccessful: Bool) -> Void) {
        let currentUserClassesRequest: NSMutableURLRequest = createCurrentUserClassesRequest(forFirstSemester)
        var currentStudentClassListArray: [CurrentUserClasses] = [CurrentUserClasses]()
        Alamofire.request(currentUserClassesRequest).responseJSON { response in
            
            if self.isRequestSuccessful(inputData: JSON(response.result.value!)) {
                if let currentClassesRequestResponse: JSON = JSON(response.result.value!) {
                    let currentClassesResponseArray: [NSDictionary] = currentClassesRequestResponse.rawValue as! [NSDictionary]
                    for objectResponse in currentClassesResponseArray {
                        let singularResponse: NSDictionary = objectResponse
                        let singularUserClass: CurrentUserClasses? = self.mapCurrentUserClasses(singularResponse)
                        currentStudentClassListArray.append(singularUserClass!)
                    }
                    studentClassArray?.removeAll()
                    studentClassArray = self.filterClasses(currentStudentClassListArray)
                    callBack(isRequestSuccessful: true)
                } else {
                    callBack(isRequestSuccessful: false)
                }
            } else {
                let username: String = userLoginInfo!.username
                let password: String = userLoginInfo!.password
                WebServices.service.loginWithParameters(username: username, password: password, callBack: { (isLoginSuccessful) in
                    if isLoginSuccessful {
                        Alamofire.request(currentUserClassesRequest).responseJSON { response in
                            if let currentClassesRequestResponse: JSON = JSON(response.result.value!) {
                                let currentClassesResponseArray: [NSDictionary] = currentClassesRequestResponse.rawValue as! [NSDictionary]
                                for objectResponse in currentClassesResponseArray {
                                    let singularResponse: NSDictionary = objectResponse
                                    let singularUserClass: CurrentUserClasses? = self.mapCurrentUserClasses(singularResponse)
                                    currentStudentClassListArray.append(singularUserClass!)
                                }
                                studentClassArray?.removeAll()
                                studentClassArray = self.filterClasses(currentStudentClassListArray)
                                callBack(isRequestSuccessful: true)
                            } else {
                                callBack(isRequestSuccessful: false)
                            }
                        }
                    }
                })
            }
            
        }
    }
    
    private func filterClasses(inputClasses: Array<CurrentUserClasses>) -> [CurrentUserClasses] {
        var returnValue: [CurrentUserClasses] = [CurrentUserClasses]()
        for classObject in inputClasses {
            if let title = classObject.sectionIdentifier {
                if title.rangeOfString("Cyber Learning Lab") != nil {} else {
                    returnValue.append(classObject)
                }
            }
        }
        return returnValue
    }
    
    private func mapCurrentUserClasses(responseObject: NSDictionary) -> CurrentUserClasses? {
        do {
            let responseElement: CurrentUserClasses = try Unbox(responseObject as! UnboxableDictionary)
            return responseElement
        } catch {}
        return nil;
    }
    
    private func createCurrentUserClassesRequest(forFirstSemester: Bool) -> NSMutableURLRequest {
        let requestStringURL: String = createCurrentUserClassesRequestURL(forFirstSemester)
        let requestUrl: NSURL = NSURL(string: requestStringURL)!
        let request = NSMutableURLRequest(URL: requestUrl)
        request.HTTPMethod = "GET"
        if let sessionToken = currentSessionInfo?.sessionToken {
            request.setValue("t=\(sessionToken)", forHTTPHeaderField: "Cookie")
        }
        return request
    }
    
    private func createCurrentUserClassesRequestURL(forFirstSemester: Bool) -> String {
        var returnString: String = String()
        var userid: String = String()
        var durationID: Int = Int()
        if let mainUserId: String = currentSessionInfo?.userId {
            userid = mainUserId
        }
        if forFirstSemester {
            if let durationId = studentGroupTermListArray![0].durationId {
                durationID = durationId
            }
        } else {
            if let durationId = studentGroupTermListArray![1].durationId {
                durationID = durationId
            }
        }
        returnString = "https://cranbrook.myschoolapp.com/api/datadirect/ParentStudentUserAcademicGroupsGet?userId=\(userid)&schoolYearLabel=2016+-+2017&memberLevel=3&persona=2&durationList=\(durationID)&markingPeriodId="
        return returnString
    }
    
}










