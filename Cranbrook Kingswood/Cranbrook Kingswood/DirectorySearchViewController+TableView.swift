//
//  DirectorySearchViewController+TableView.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 8/19/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON
import Unbox

extension DirectorySearchViewController {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchResults == nil || searchResults?.count == 0 {
            let noDataLabel: UILabel = UILabel(frame: CGRectMake(0, 0, self.tableView.bounds.size.width, self.tableView.bounds.size.height))
            noDataLabel.text = self.emptyTableViewText
            noDataLabel.font = UIFont(name: "AvenirNext-Medium", size: 20)
            noDataLabel.textColor = UIColor(red: 0.639, green: 0.639, blue: 0.682, alpha: 1.000)
            noDataLabel.textAlignment = .Center
            self.tableView.backgroundView = noDataLabel
            return 0;
        } else {
            self.tableView.backgroundView = nil
            return (searchResults?.count)!
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.searchCellIdentifier, forIndexPath: indexPath) as! SearchResultTableViewCell
        cell.selectionStyle = .None;
        cell.titleLabel.text = getTitleLabelNameText(searchResults![indexPath.row])
        cell.detailLabel.text = getDetailLabelText(searchResults![indexPath.row])
        if searchResults![indexPath.row].profileImage != nil {
            cell.profileImageView.image = searchResults![indexPath.row].profileImage
        } else {
            cell.profileImageView.image = UIImage(named: "default_user_icon")
        }
        return cell
    }
    
    private func getDetailLabelText(inputData: SearchResultResponse) -> String {
        var outputString: String = ""
        
        if let email = inputData.email {
            outputString = email
        } else {
            outputString = outputString + "No email"
            
            if let officePhone = inputData.officePhone {
                outputString = outputString + ", \(officePhone)"
                return outputString
            } else if let cellPhone = inputData.cellPhone {
                outputString = outputString + ", \(cellPhone)"
                return outputString
            } else if let homePhone = inputData.homePhone {
                outputString = outputString + ", \(homePhone)"
                return outputString
            }
            
        }
        
        return outputString
        
    }
    
    private func getTitleLabelNameText(inputData: SearchResultResponse) -> String {
        var outputString: String = ""
        
        if let firstName = inputData.firstName {
            outputString = firstName
        }
        
        if let middleName = inputData.middleName {
            outputString = outputString + " \(middleName)"
        }
        
        if let lastName = inputData.lastName {
            outputString = outputString + " \(lastName)"
        }
        
        if currentSearchDirectory == .Faculty {
            if let department = inputData.departmentDisplay {
                outputString = outputString + ", \(department)"
            }
        } else {
            if let graduationYear = inputData.gradYear {
                if graduationYear != "" && graduationYear.characters.count == 4 {
                    let characters = [Character](graduationYear.characters)
                    let finalGraduationString: String = " '\(characters[2])\(characters[3])"
                    outputString = outputString + finalGraduationString
                }
            }
        }
        
        return outputString
        
    }
    
}




















