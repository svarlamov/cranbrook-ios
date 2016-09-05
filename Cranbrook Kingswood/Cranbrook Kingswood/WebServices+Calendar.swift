//
//  WebServices+Calendar.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 9/3/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Unbox
import Alamofire
import SwiftyJSON

extension WebServices {
    
    internal func getCalendarTasksForDate(date date: NSDate, callBack: (isRequestSuccessful: Bool) -> Void) {
        getCalendarTasksForDateSubMethod(date) { (isRequestSuccessful) in
            if isRequestSuccessful {
                callBack(isRequestSuccessful: true)
            } else {
                callBack(isRequestSuccessful: false)
            }
        }
    }
    
    private func getCalendarTasksForDateSubMethod(forDate: NSDate, callBack: (isRequestSuccessful: Bool) -> Void) {
        let getCalendarTasksForDateRequest: NSMutableURLRequest = createCalendarTasksForDateRequest(forDate)
        var getTasksForCalendarDateListArray: [CalendarItemDataStructure] = [CalendarItemDataStructure]()
        Alamofire.request(getCalendarTasksForDateRequest).responseJSON { response in
            if let calendarRequestResponse: JSON = JSON(response.result.value!) {
                let dateCalendarResponseArray: [NSDictionary] = calendarRequestResponse.rawValue as! [NSDictionary]
                for responseObject in dateCalendarResponseArray {
                    let singularResponse: NSDictionary = responseObject
                    let singularAssignment: CalendarItemDataStructure? = self.mapCalendarTasksForDate(singularResponse)
                    getTasksForCalendarDateListArray.append(singularAssignment!)
                }
                calendarTasksForDate = nil
                calendarTasksForDate = getTasksForCalendarDateListArray
                callBack(isRequestSuccessful: true)
            } else {
                callBack(isRequestSuccessful: false)
            }
            
        }
    }
    
    private func mapCalendarTasksForDate(responseObject: NSDictionary) -> CalendarItemDataStructure? {
        do {
            let responseElement: CalendarItemDataStructure = try Unbox(responseObject as! UnboxableDictionary)
            return responseElement
        } catch {}
        return nil;
    }
    
    private func createCalendarTasksForDateRequest(forDate: NSDate) -> NSMutableURLRequest {
        let requestStringURL: String = createCalendarTasksForDateRequestURL(forDate)
        let requestUrl: NSURL = NSURL(string: requestStringURL)!
        let request = NSMutableURLRequest(URL: requestUrl)
        request.HTTPMethod = "GET"
        if let sessionToken = currentSessionInfo?.sessionToken {
            request.setValue("t=\(sessionToken)", forHTTPHeaderField: "Cookie")
        }
        return request
    }
    
    private func createCalendarTasksForDateRequestURL(forDate: NSDate) -> String {
        var returnString: String = String()
        let urlDateString: String = setupCalendarDateString(date: forDate)
        var calendarId: String = String()
        if let id = userCalendarId {calendarId = id}
        returnString = "https://cranbrook.myschoolapp.com/api/mycalendar/schedule?startDate=\(urlDateString)&endDate=\(urlDateString)&scheduleString=\(calendarId)_2"
        return returnString
    }
    
    private func setupCalendarDateString(date date: NSDate) -> String {
        var returnString: String = String()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        returnString = dateFormatter.stringFromDate(date)
        returnString = returnString.stringByReplacingOccurrencesOfString("/", withString: "%2F", options: NSStringCompareOptions.LiteralSearch, range: nil)
          returnString = "09%2F13%2F2016"
        return returnString
    }
    
}

