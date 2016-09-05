//
//  CalendarViewController+TableView.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 9/4/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Alamofire
import Unbox
import SwiftyJSON

extension CalendarViewController {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if calendarTasksForDate == nil || calendarTasksForDate?.count == 0 {
            let noDataLabel: UILabel = UILabel(frame: CGRectMake(0, 0, self.tableView.bounds.size.width, self.tableView.bounds.size.height))
            noDataLabel.text = self.emptyTableViewText
            noDataLabel.font = UIFont(name: "AvenirNext-Medium", size: 20)
            noDataLabel.textColor = UIColor(red: 0.639, green: 0.639, blue: 0.682, alpha: 1.000)
            noDataLabel.textAlignment = .Center
            self.tableView.backgroundView = noDataLabel
            return 0;
        } else {
            self.tableView.backgroundView = nil
            return (calendarTasksForDate?.count)!
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.calendarCellIdentifier, forIndexPath: indexPath) as! CalendarTableViewCell
        var dateLabelText: String = ""
        
        var calendarTitleText: String = String()
        var calendarStartDateText: String = String()
        var calendarEndDateText: String = String()
        
        if let taskTitleText = calendarTasksForDate![indexPath.row].title {calendarTitleText = taskTitleText}
        if let startDateText = calendarTasksForDate![indexPath.row].startDate {calendarStartDateText = self.convertDateToText(startDateText)}
        if let endDateText = calendarTasksForDate![indexPath.row].endDate {calendarEndDateText = self.convertDateToText(endDateText)}
        
        cell.titleLabel.text = calendarTitleText
        
        if calendarEndDateText == "12:00 AM" && calendarStartDateText == "12:00 AM" {
            cell.dateLabel.text = "All day"
            
        } else {
            dateLabelText = calendarStartDateText
            if dateLabelText == "" {
                dateLabelText = calendarEndDateText
            } else {
                dateLabelText = "\(dateLabelText) - \(calendarEndDateText)"
            }
            
            if dateLabelText == "" {
                cell.dateLabel.text = "Unknown Time"
            } else {
                cell.dateLabel.text = dateLabelText
            }
            
        }
        
        return cell
    }
    
}
