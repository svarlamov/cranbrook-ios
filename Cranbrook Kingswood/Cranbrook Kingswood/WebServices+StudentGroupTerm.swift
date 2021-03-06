//
//  WebServices+StudentGroupTerm.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 9/2/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Unbox
import SwiftyJSON
import Alamofire

extension WebServices {
 
    internal func getStudentGroupTermList(callBack: (isRequestSuccessful: Bool) -> Void) {
        getStudentGroupTermListSubMethod { (isRequestSuccessful) in
            if isRequestSuccessful {
                callBack(isRequestSuccessful: true)
            } else {
                callBack(isRequestSuccessful: false)
            }
        }
    }
    
    private func getStudentGroupTermListSubMethod(callBack: (isRequestSuccessful: Bool) -> Void) {
        let studentGroupTermRequest: NSMutableURLRequest = createStudentGroupTermRequest()
        var studentGroupArray: [StudentGroupTermStructure] = [StudentGroupTermStructure]()
        
        Alamofire.request(studentGroupTermRequest).responseJSON { response in
            if let studentGroupTermRequestResponse: JSON = JSON(response.result.value!) {
                let groupTermResponseDictionary: [NSDictionary] = studentGroupTermRequestResponse.rawValue as! [NSDictionary]
                for responseElement in groupTermResponseDictionary {
                    let singularResponse: NSDictionary = responseElement 
                    let searchResult: StudentGroupTermStructure? = self.mapStudentGroupTermResult(singularResponse)
                    if let mainResult = searchResult {
                        studentGroupArray.append(mainResult)
                    }
                }
                studentGroupTermListArray = studentGroupArray
                callBack(isRequestSuccessful: true)
            } else {
                callBack(isRequestSuccessful: false)
            }
            
        }
        
    }
    
    private func mapStudentGroupTermResult(responseObject: NSDictionary) -> StudentGroupTermStructure? {
        do {
            let responseElement: StudentGroupTermStructure = try Unbox(responseObject as! UnboxableDictionary)
            return responseElement
        } catch {}
        return nil;
    }
    
    private func createStudentGroupTermRequest() -> NSMutableURLRequest {
        let requestStringURL: String = createStudentGroupTermRequestURL()
        let requestUrl = NSURL(string: requestStringURL)!
        let request = NSMutableURLRequest(URL: requestUrl)
        request.HTTPMethod = RequestType.GET.rawValue
        if let sessionToken = currentSessionInfo?.sessionToken {
            request.setValue("t=\(sessionToken)", forHTTPHeaderField: "Cookie")
        }
        return request
    }
    
    private func createStudentGroupTermRequestURL() -> String {
        var returnString: String = String()
        var userid: String = String()
        if let mainUserId: String = currentSessionInfo?.userId {
            userid = mainUserId
        }
        returnString = "\(self.studentGroupTermEndPoint)\(userid)&schoolYearLabel=\(self.studentGroupTermSchoolYearLabel)&personaId=\(self.studentGruopTermPersonaId)"
        return returnString
    }
    
}










