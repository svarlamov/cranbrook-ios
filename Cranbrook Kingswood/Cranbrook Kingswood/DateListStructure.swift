//
//  DateListStructure.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 8/27/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation

struct DateListStructure {
    var mutableDateList: Array<NSDate> = Array<NSDate>()
    
    init() {
        let startDate: NSDate = self.getReferenceDate(isForStartDate: true)
        let endDate: NSDate = self.getReferenceDate(isForStartDate: false)
        self.daysBetweenDates(startDate, endDate: endDate)
    }
    
    func getReferenceDate(isForStartDate isForStartDate: Bool) -> NSDate {
        var strDate: String = String()
        if isForStartDate {
            strDate = "2016-01-01"
        } else {
            strDate = "2018-01-01"
        }
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.dateFromString(strDate)!
    }
    
    func daysBetweenDates(startDate: NSDate, endDate: NSDate) -> Int
    {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day], fromDate: startDate, toDate: endDate, options: [])
        print(components.date)
        return components.day
    }
    
}
