//
//  WebServices+ClassDetail.swift
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
    
    internal func getGradeBookForClass(data: CurrentUserClasses, callBack: (isRequestSuccessful: Bool) -> Void) {
        self.getGradeBookForClassSubMethod(data) { (isRequestSuccessful) in
            if isRequestSuccessful {
                callBack(isRequestSuccessful: true)
            } else {
                callBack(isRequestSuccessful: false)
            }
        }
    }
    
    private func getGradeBookForClassSubMethod(data: CurrentUserClasses, callBack: (isRequestSuccessful: Bool) -> Void) {
        let classGradeBookNetworkRequest: NSMutableURLRequest = createGradeBookRequest(fromData: data)
        var classGradeBookArray: [CurrentUserClassDetail] = [CurrentUserClassDetail]()
        Alamofire.request(classGradeBookNetworkRequest).responseJSON { response in
            if let classGradeBookResponse: JSON = JSON(response.result.value!) {
                let classGradeBookDictionaryArray: [NSDictionary] = classGradeBookResponse.rawValue as! [NSDictionary]
                for responseElement in classGradeBookDictionaryArray {
                    let singularResponse: NSDictionary = responseElement
                    let singularGradeBookItem: CurrentUserClassDetail? = self.mapClassGradeBookReponse(singularResponse)
                    if let mainResult = singularGradeBookItem {
                        classGradeBookArray.append(mainResult)
                    }
                }
                gradeBookForSelectedClass = GroupParsedData.groupParsedData.groupClassGradeBookData(forData: classGradeBookArray)
                callBack(isRequestSuccessful: true)
            } else {
                callBack(isRequestSuccessful: false)
            }
        }
    }
    
    private func mapClassGradeBookReponse(responseObject: NSDictionary) -> CurrentUserClassDetail? {
        do {
            let responseElement: CurrentUserClassDetail = try Unbox(responseObject as! UnboxableDictionary)
            return responseElement
        } catch {}
        return nil;
    }
    
    private func createGradeBookRequest(fromData data: CurrentUserClasses) -> NSMutableURLRequest {
        let requestUrl: NSURL = createGradeBookRequestURL(fromData: data)
        let request = NSMutableURLRequest(URL: requestUrl)
        request.HTTPMethod = RequestType.GET.rawValue
        if let sessionToken = currentSessionInfo?.sessionToken {
            request.setValue("t=\(sessionToken)", forHTTPHeaderField: "Cookie")
        }
        return request
    }
    
    private func createGradeBookRequestURL(fromData data: CurrentUserClasses) -> NSURL {
        var returnURL: NSURL = NSURL()
        var sectionId: String = String()
        var markingPeriodId: String = String()
        var studentUserId: String = String()
        if let instanceSectionId = data.sectionId {
            sectionId = "\(instanceSectionId)"
        }
        if let instanceMarkingPeriod = data.markingPeriodId {
            markingPeriodId = "\(instanceMarkingPeriod)"
        }
        if let info = currentSessionInfo?.userId {
            studentUserId = info
        }
        let urlString = "https://cranbrook.myschoolapp.com/api/datadirect/GradeBookPerformanceAssignmentStudentList/?sectionId=\(sectionId)&markingPeriodId=\(markingPeriodId)&studentUserId=\(studentUserId)"
        returnURL = NSURL(string: urlString)!
        return returnURL
    }
    
}

