//
//  AssignmentsViewController.swift
//  Cranbrook Kingswood
//
//  Created by private on 8/6/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Unbox

class AssignmentsViewController: UIViewController, AKPickerViewDataSource, AKPickerViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    //  Picker view
    @IBOutlet var pickerView: AKPickerView!
    let dates = assignmentsDateList.mutableDateList
    let mainDates = assignmentsDateList.mutableNSDateList
    
    //  Table view
    @IBOutlet weak var tableView: UITableView!
    let assignmentsCellIdentifier: String = "assignments_cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        goToDateIndex()
    }
    
    func setupViews() {
        setupPickerView()
    }
    
}





