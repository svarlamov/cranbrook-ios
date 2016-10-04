//
//  WebServices+AssignmentDetail.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 9/30/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Unbox
import SwiftyJSON
import Alamofire

extension WebServices {
    
    internal func getDetailDataForAssignment(forAssignmentId id: String, callBack: (isRequestSuccessful: Bool) -> Void) {
        self.getDetailDataForAssignmentSubMethod(id) { (isRequestSuccessful) in
            if isRequestSuccessful {
                callBack(isRequestSuccessful: true)
            } else {
                callBack(isRequestSuccessful: false)
            }
        }
    }
    
    private func getDetailDataForAssignmentSubMethod(id: String, callBack: (isRequestSuccessful: Bool) -> Void) {
        let getAssignmentDetailRequest: NSMutableURLRequest = createDetailAssignmentRequest(forAssignmentId: id)
        Alamofire.request(getAssignmentDetailRequest).responseJSON { response in
            if let assignmentDetailRequestResponse: JSON = JSON(response.result.value!) {
                if self.isRequestSuccessful(inputData: assignmentDetailRequestResponse) {
                    let dateAssignmentResponseArray: [NSDictionary] = assignmentDetailRequestResponse.rawValue as! [NSDictionary]
                    let mainData: NSDictionary = dateAssignmentResponseArray[0]
                    let singularData: AssignmentDetailDataStructure? = self.mapAssignmentDetailData(mainData)
                    assignmentDetailData = nil
                    assignmentDetailData = singularData
                    callBack(isRequestSuccessful: true)
                } else {
                    self.reAuthenticateUser({ (isReAuthenticationSuccessful) in
                        self.getDetailDataForAssignmentErrorHandling(id, callBack: { (isRequestSuccessful) in
                            callBack(isRequestSuccessful: true)
                        })
                    })
                }
            } else {
                callBack(isRequestSuccessful: false)
            }
        }
    }
    
    private func getDetailDataForAssignmentErrorHandling(id: String, callBack: (isRequestSuccessful: Bool) -> Void) {
        let getAssignmentDetailRequest: NSMutableURLRequest = createDetailAssignmentRequest(forAssignmentId: id)
        Alamofire.request(getAssignmentDetailRequest).responseJSON { response in
            if let assignmentDetailRequestResponse: JSON = JSON(response.result.value!) {
                let dateAssignmentResponseArray: [NSDictionary] = assignmentDetailRequestResponse.rawValue as! [NSDictionary]
                let mainData: NSDictionary = dateAssignmentResponseArray[0]
                let singularData: AssignmentDetailDataStructure? = self.mapAssignmentDetailData(mainData)
                assignmentDetailData = nil
                assignmentDetailData = singularData
                callBack(isRequestSuccessful: true)
            } else {
                callBack(isRequestSuccessful: false)
            }
        }
    }
    
    private func mapAssignmentDetailData(responseObject: NSDictionary) -> AssignmentDetailDataStructure? {
        do {
            let responseElement: AssignmentDetailDataStructure = try Unbox(responseObject as! UnboxableDictionary)
            return responseElement
        } catch {}
        return nil;
    }
    
    private func createDetailAssignmentRequest(forAssignmentId id: String) -> NSMutableURLRequest {
        let requestUrl: NSURL = createURL(forAssignmentId: "\(id)")
        let request = NSMutableURLRequest(URL: requestUrl)
        request.HTTPMethod = RequestType.GET.rawValue
        if let sessionToken = currentSessionInfo?.sessionToken {
            request.setValue("t=\(sessionToken)", forHTTPHeaderField: "Cookie")
        }
        return request
    }
    
    private func createURL(forAssignmentId id: String) -> NSURL {
        let urlString: String = "https://cranbrook.myschoolapp.com/api/datadirect/AssignmentStudentDetail?format=json&studentId=\(currentSessionInfo!.userId)&AssignmentIndexId=\(id)"
        return NSURL(string: urlString)!
    }
}
