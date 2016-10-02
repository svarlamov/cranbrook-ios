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
        let shouldGetForFirstSemester: Bool = RemoteConfig.config.getGradesForFirstSemester()
        getCurrentUserClassesSubMethod(shouldGetForFirstSemester) { (isRequestSuccessful) in
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
                Alamofire.request(currentUserClassesRequest).responseJSON { response in
                    if let currentClassesRequestResponse: JSON = JSON(response.result.value!) {
                        if currentClassesRequestResponse.rawValue["Error"] != nil {
                            callBack(isRequestSuccessful: false)
                        } else {
                            let currentClassesResponseArray: [NSDictionary] = currentClassesRequestResponse.rawValue as! [NSDictionary]
                            for objectResponse in currentClassesResponseArray {
                                let singularResponse: NSDictionary = objectResponse
                                let singularUserClass: CurrentUserClasses? = self.mapCurrentUserClasses(singularResponse)
                                currentStudentClassListArray.append(singularUserClass!)
                            }
                            studentClassArray?.removeAll()
                            studentClassArray = self.filterClasses(currentStudentClassListArray)
                            callBack(isRequestSuccessful: true)
                        }
                        callBack(isRequestSuccessful: false)
                    } else {
                        callBack(isRequestSuccessful: false)
                    }
                }
            }
            
        }
    }
    
    private func filterClasses(inputClasses: Array<CurrentUserClasses>) -> [CurrentUserClasses] {
        var returnValue: [CurrentUserClasses] = [CurrentUserClasses]()
        for classObject in inputClasses {
            if let title = classObject.sectionIdentifier {
                if title.rangeOfString("\(self.currentClassesRemovedClassTitle)") != nil {} else {
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
        request.HTTPMethod = RequestType.GET.rawValue
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
        returnString = "\(self.currentClassesEndpoint)\(userid)&schoolYearLabel=\(self.currentClassesSchoolYearLabel)&memberLevel=\(self.currentClassesMemeberLevel)&persona=\(self.currentClassesPersona)&durationList=\(durationID)&markingPeriodId="
        return returnString
    }
    
}










