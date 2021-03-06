//
//  ClassesViewController+TableView.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 8/30/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Unbox

extension ClassesViewController {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if studentClassArray![indexPath.row].cumGrade != nil {
            if NetworkStatus.networkStatus.isConnectedToNetwork() {
                WebServices.service.getGradeBookForClass(studentClassArray![indexPath.row], callBack: { (isRequestSuccessful) in
                    if isRequestSuccessful {
                        self.performSegueWithIdentifier(self.detailSegueKey, sender: nil)
                    } else {
                        self.showRequestError()
                    }
                })
            } else {
                self.showNetworkAlert()
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if studentClassArray == nil || studentClassArray?.count == 0 {
            let noDataLabel: UILabel = UILabel(frame: CGRectMake(0, 0, self.tableView.bounds.size.width, self.tableView.bounds.size.height))
            noDataLabel.text = self.emptyTableViewText
            noDataLabel.font = UIFont(name: "AvenirNext-Medium", size: 20)
            noDataLabel.textColor = UIColor(red: 0.639, green: 0.639, blue: 0.682, alpha: 1.000)
            noDataLabel.textAlignment = .Center
            self.tableView.backgroundView = noDataLabel
            return 0;
        } else {
            return (studentClassArray?.count)!
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.classesCellIdentifier, forIndexPath: indexPath) as! ClassesTableViewCell
        cell.selectionStyle = .None
        if let titleText = studentClassArray![indexPath.row].sectionIdentifier {
            cell.titleLabel.text = titleText
        }
        if let groupOwnerTitleName = studentClassArray![indexPath.row].groupOwnerName {
            cell.teacherLabel.text = groupOwnerTitleName
        }
        if let titleGrade = studentClassArray![indexPath.row].cumGrade {
            cell.gradeLabel.text = "\(titleGrade)"
            cell.detailIndicatorArrow.hidden = false
        } else {
            cell.gradeLabel.text = "--"
            cell.detailIndicatorArrow.hidden = true
        }
        return cell
    }
    
}
