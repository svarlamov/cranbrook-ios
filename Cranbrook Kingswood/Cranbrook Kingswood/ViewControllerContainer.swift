//
//  ViewControllerContainer.swift
//  Cranbrook Kingswood
//
//  Created by private on 8/7/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import ObjectMapper

enum SelectedTab {
    case ClassesTab
    case AssignmentsTab
    case DirectorySearchTab
    case SettingsTab
}

class ViewControllerContainer: UIViewController {

    @IBOutlet weak var ClassesViewController: UIView!
    @IBOutlet weak var AssignmentsViewController: UIView!
    @IBOutlet weak var DirectorySearchViewController: UIView!
    @IBOutlet weak var SettingsViewController: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        ClassesViewController.hidden = true
        AssignmentsViewController.hidden = true
        DirectorySearchViewController.hidden = false
        SettingsViewController.hidden = true
        
    }
    
}
