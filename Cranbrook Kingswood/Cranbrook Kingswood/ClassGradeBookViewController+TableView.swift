//
//  ClassGradeBookViewController+TableView.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 9/28/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation

extension classGradeBookViewController {
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return gradeBookForSelectedClass![section]
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return gradeBookForSelectedClass!.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gradeBookForSelectedClass![section].count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        <#code#>
    }
    
}
