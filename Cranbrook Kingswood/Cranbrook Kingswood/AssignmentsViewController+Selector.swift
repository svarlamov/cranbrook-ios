//
//  AssignmentsViewController+Selector.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 8/30/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Unbox

extension AssignmentsViewController {
    
    func indexOfCurrentDate() -> Int? {
        let calendar: NSCalendar = NSCalendar.currentCalendar()
        for date in mainDates {
            if calendar.isDateInToday(date) {
                let indexOfDate: Int = mainDates.indexOf(date)!
                return indexOfDate
            }
        }
        return nil
    }
    
    func goToDateIndex() {
        if let dateIndex = self.indexOfCurrentDate() {
            self.pickerView.scrollToItem(dateIndex)
            getAssignmentsForDate(date: self.mainDates[dateIndex])
        }
    }
    
    func setupPickerView() {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        self.pickerView.font = UIFont(name: "Avenir Next", size: 17)!
        self.pickerView.highlightedFont = UIFont(name: "Avenir Next", size: 17)!
        self.pickerView.textColor = UIColor(red: 21/255, green: 41/255, blue: 53/255, alpha: 1.0)
        self.pickerView.interitemSpacing = self.view.frame.size.width/6
        self.pickerView.pickerViewStyle = .Wheel
        self.pickerView.maskDisabled = false
        self.pickerView.reloadData()
    }
    
    func numberOfItemsInPickerView(pickerView: AKPickerView) -> Int {
        return self.dates.count
    }
    
    func pickerView(pickerView: AKPickerView, titleForItem item: Int) -> String {
        return self.dates[item]
    }
    
    func pickerView(pickerView: AKPickerView, imageForItem item: Int) -> UIImage {
        return UIImage(named: self.dates[item])!
    }
    
    func pickerView(pickerView: AKPickerView, didSelectItem item: Int) {
        Analytics.analytics.assignmentDateSelection(self.dates[item])
        self.getAssignmentsForDate(date: self.mainDates[item])
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {}
    
    func getAssignmentsForDate(date date: NSDate) {
        WebServices.service.getAssignmentsForDate(date: date) { (isRequestSuccessful) in
            self.tableView.reloadData()
        }
    }
    
}












