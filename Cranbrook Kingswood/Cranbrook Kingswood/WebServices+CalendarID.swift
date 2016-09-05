//
//  WebServices+CalendarID.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 9/4/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Unbox
import Alamofire
import SwiftyJSON

extension WebServices {
    
    internal func getCalendarIdForDate(date date: NSDate, callBack: (isRequestSuccessful: Bool) -> Void) {
        getCalendarIdForDateSubMethod(date) { (isRequestSuccessful) in
            print(userCalendarId)
            if isRequestSuccessful {
                callBack(isRequestSuccessful: true)
            } else {
                callBack(isRequestSuccessful: false)
            }
        }
    }
    
    private func getCalendarIdForDateSubMethod(forDate: NSDate, callBack: (isRequestSuccessful: Bool) -> Void) {
        let getCalendarIdForDateRequest: NSMutableURLRequest = createCalendarIdForDateRequest(forDate)
        Alamofire.request(getCalendarIdForDateRequest).responseJSON { response in
            if let calendarIdRequestResponse: JSON = JSON(response.result.value!) {
                let dateCalendarIdResponseArray: [NSDictionary] = calendarIdRequestResponse.rawValue as! [NSDictionary]
                if dateCalendarIdResponseArray.count > 0 {
                    let singularCalendarItem: NSDictionary = dateCalendarIdResponseArray[0]
                    if singularCalendarItem.count > 0 {
                        let id: Int = (singularCalendarItem["CalendarUserId"] as! Int)
                        userCalendarId = "\(id)"
                        callBack(isRequestSuccessful: true)
                    }
                    callBack(isRequestSuccessful: false)
                }
                callBack(isRequestSuccessful: false)
            } else {
                callBack(isRequestSuccessful: false)
            }
            
        }
    }
    
    private func createCalendarIdForDateRequest(forDate: NSDate) -> NSMutableURLRequest {
        let requestStringURL: String = createCalendarIdForDateRequestURL(forDate)
        let requestUrl: NSURL = NSURL(string: requestStringURL)!
        let request = NSMutableURLRequest(URL: requestUrl)
        request.HTTPMethod = "GET"
        if let sessionToken = currentSessionInfo?.sessionToken {
            request.setValue("t=\(sessionToken)", forHTTPHeaderField: "Cookie")
        }
        return request
    }
    
    private func createCalendarIdForDateRequestURL(forDate: NSDate) -> String {
        var returnString: String = String()
        let urlDateString: String = setupCalendarIdString(date: forDate)
        returnString = "https://cranbrook.myschoolapp.com/api/mycalendar/list/?startDate=\(urlDateString)&endDate=\(urlDateString)&settingsTypeId=1"
        return returnString
    }
    
    private func setupCalendarIdString(date date: NSDate) -> String {
        var returnString: String = String()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        returnString = dateFormatter.stringFromDate(date)
        returnString = returnString.stringByReplacingOccurrencesOfString("/", withString: "%2F", options: NSStringCompareOptions.LiteralSearch, range: nil)
        return returnString
    }
    
}


