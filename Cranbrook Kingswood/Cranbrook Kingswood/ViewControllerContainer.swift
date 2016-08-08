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

enum SelectedTabOptions {
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
        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Avenir Next", size: 20)!]
        setSelectedTab(selectedTab)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    func setSelectedTab(tabID: SelectedTabOptions) {
        
        switch tabID {
        case .ClassesTab:
            self.title = "Classes"
            hideTab(false, hideAssignments: true, hideSearch: true, hideSettings: true)
            
        case .AssignmentsTab:
            self.title = "Assignments"
            hideTab(true, hideAssignments: false, hideSearch: true, hideSettings: true)
            
        case .DirectorySearchTab:
            self.title = "Directory Search"
            hideTab(true, hideAssignments: true, hideSearch: false, hideSettings: true)
            
        case .SettingsTab:
            self.title = "Settings"
            hideTab(true, hideAssignments: true, hideSearch: true, hideSettings: false)
            
        }
        
    }
    
    private func hideTab(hideClasses: Bool, hideAssignments: Bool, hideSearch: Bool, hideSettings: Bool) {
        ClassesViewController.hidden = hideClasses
        AssignmentsViewController.hidden = hideAssignments
        DirectorySearchViewController.hidden = hideSearch
        SettingsViewController.hidden = hideSettings
    }
    
}










