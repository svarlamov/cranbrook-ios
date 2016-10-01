//
//  AssignmentDetailViewController+TableView.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 10/1/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation

extension assignmentDetailViewController {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier, forIndexPath: indexPath) as! assignmentDetailTableViewCell
        if let titleText = assignmentDetailData?.title {
            cell.titleLabel.text = titleText
        } else {
            cell.titleLabel.text = ""
        }
        if let descriptionLabelText = assignmentDetailData?.description {
            cell.descriptionLabel.text = descriptionLabelText
        } else {
            cell.descriptionLabel.text = ""
        }
        return cell
    }
    
}
