//
//  AssignmentsViewController+TableView.swift
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
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if specificDateAssignments == nil || specificDateAssignments?.count == 0 {
            let noDataLabel: UILabel = UILabel(frame: CGRectMake(0, 0, self.tableView.bounds.size.width, self.tableView.bounds.size.height))
            noDataLabel.text = self.emptyTableViewText
            noDataLabel.font = UIFont(name: "AvenirNext-Medium", size: 20)
            noDataLabel.textColor = UIColor(red: 0.639, green: 0.639, blue: 0.682, alpha: 1.000)
            noDataLabel.textAlignment = .Center
            self.tableView.backgroundView = noDataLabel
            return 0;
        } else {
            self.tableView.backgroundView = nil
            return (specificDateAssignments?.count)!
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var assignmentData: AssignmentDataStructure = AssignmentDataStructure()
        let cell = tableView.dequeueReusableCellWithIdentifier(self.assignmentsCellIdentifier, forIndexPath: indexPath) as! AssignmentTableViewCell
        cell.selectionStyle = .None;
        cell.layer.masksToBounds = true
        cell.removeVisualButtonChanges()
        cell.assignmentIndexPath = indexPath.row
        
        if let assignment = specificDateAssignments?[indexPath.row] {
            assignmentData = assignment
        }
        
        if let status = assignmentData.assignmentStatus {
            cell.assignmentStatus = status
            switch status {
            case 0:
                cell.changeStatusButtons(toStatus: 0)
            case -1:
                cell.changeStatusButtons(toStatus: -1)
            default:
                cell.changeStatusButtons(toStatus: 1)
            }
        }
        
        if let id = assignmentData.assignmentIndexId {
            cell.cellAssignmentId = String(id)
        }
        
        if let type = assignmentData.assignmentType {
            cell.assignmentTypeLabel.text = type
        } else {
            cell.assignmentTypeLabel.text = "--"
        }
            
        if let groupName = assignmentData.groupName {
            cell.assignmentClassLabel.text = groupName
        } else {
            cell.assignmentClassLabel.text = "--"
        }
        
        if let titleText = assignmentData.shortDescription {
            cell.assignmentTitleLabel.text = titleText
        } else {
            cell.assignmentTitleLabel.text = "No Description"
        }
        
        return cell
    }
    
}








