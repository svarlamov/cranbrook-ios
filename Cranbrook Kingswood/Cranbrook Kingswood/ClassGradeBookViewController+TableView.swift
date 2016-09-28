//
//  ClassGradeBookViewController+TableView.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 9/28/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation

extension classGradeBookViewController {
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let gradeBookSection: [CurrentUserClassDetail] = gradeBookForSelectedClass![section]
        let firstGradeBookSectionItem: CurrentUserClassDetail = gradeBookSection[0]
        var returnString: String = String()
        if let itemType = firstGradeBookSectionItem.assignmentType {
            returnString = itemType
        }
        return returnString
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let title = UILabel()
        title.font = UIFont(name: "Avenir Next", size: 17.0)!
        title.textColor = UIColor.lightGrayColor()
        
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font=title.font
        header.textLabel?.textColor=title.textColor
        header.tintColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1.0)
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return gradeBookForSelectedClass!.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gradeBookForSelectedClass![section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier, forIndexPath: indexPath) as! classGradeBookTableViewCell
        let array = gradeBookForSelectedClass![indexPath.section]
        let arrayItem = array[indexPath.row]
        var pointValue: String = String()
        var pointTotalPossible: String = String()
        if let headerText = arrayItem.assignmentShortDescription {
            cell.headerLabel.text = headerText
        }
        if let pointsAttained = arrayItem.points {
            pointValue = pointsAttained
        }
        if let pointTotal = arrayItem.maxPoints {
            pointTotalPossible = "\(pointTotal)"
        }
        cell.gradeLabel.text = "\(pointValue)/\(pointTotalPossible)"
        return cell
    }
    
}
