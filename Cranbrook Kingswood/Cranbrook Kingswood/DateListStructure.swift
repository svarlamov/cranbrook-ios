//
//  DateListStructure.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 8/27/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation

struct DateListStructure {
    var mutableDateList: Array<String> = Array<String>()
    var mutableNSDateList: Array<NSDate> = Array<NSDate>()
    
    init() {
        let startDate: NSDate = self.getReferenceDate(isForStartDate: true)
        let endDate: NSDate = self.getReferenceDate(isForStartDate: false)
        self.mutableDateList = self.daysBetweenDates(startDate, endDate: endDate)
        self.mutableNSDateList = self.mainDaysBetweenDates(mutableDateList)
    }
    
    func getReferenceDate(isForStartDate isForStartDate: Bool) -> NSDate {
        var strDate: String = String()
        if isForStartDate {
            strDate = "2016-08-01"
        } else {
            strDate = "2017-08-01"
        }
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.dateFromString(strDate)!
    }
    
    func mainDaysBetweenDates(stringDates: Array<String>) -> Array<NSDate> {
        var returnedDateArray: Array<NSDate> = []
        let mainStringDates: Array<String> = stringDates
        let fmt = NSDateFormatter()
        fmt.dateFormat = "EEEE, MM/dd/yyyy"
        for stringDate in mainStringDates {
            let instanceDate: NSDate = fmt.dateFromString(stringDate)!
            returnedDateArray.append(instanceDate)
        }
        return returnedDateArray
    }
    
    func daysBetweenDates(startDate: NSDate, endDate: NSDate) -> Array<String> {
        var returnedDateArray: Array<String> = []
        let calendar = NSCalendar.currentCalendar()
        var mainStartDate: NSDate = startDate
        let mainEndDate: NSDate = endDate
        let fmt = NSDateFormatter()
        fmt.dateFormat = "EEEE, MM/dd/yyyy"
        while mainStartDate.compare(mainEndDate) != .OrderedDescending {
            returnedDateArray.append(fmt.stringFromDate(mainStartDate))
            mainStartDate = calendar.dateByAddingUnit(.Day, value: 1, toDate: mainStartDate, options: [])!
        }
        return returnedDateArray
    }
    
}
