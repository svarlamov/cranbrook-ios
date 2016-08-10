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

    // View controllers
    @IBOutlet weak var ClassesViewController: UIView!
    @IBOutlet weak var AssignmentsViewController: UIView!
    @IBOutlet weak var DirectorySearchViewController: UIView!
    @IBOutlet weak var SettingsViewController: UIView!
    
    // Custom tab bar buttons
    @IBOutlet weak var tabClassButton: UIButton!
    @IBOutlet weak var tabAssignmentsButton: UIButton!
    @IBOutlet weak var tabSearchButton: UIButton!
    @IBOutlet weak var tabSettingsButton: UIButton!
    
    // Custom tab bar icons
    @IBOutlet weak var tabClassIcon: UIImageView!
    @IBOutlet weak var tabAssignmentsIcon: UIImageView!
    @IBOutlet weak var tabSearchIcon: UIImageView!
    @IBOutlet weak var tabSettingsIcon: UIImageView!
    
    // Tab bar view
    @IBOutlet weak var tabBar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    func setupViews() {
        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Avenir Next", size: 20)!]
        setSelectedTab(selectedTab)
        setupButtons()
    }
    
    func setupTabBar() {
        self.tabBar.layer.borderWidth = 1
        self.tabBar.layer.borderColor = UIColor(red:222/255.0, green:225/255.0, blue:227/255.0, alpha: 1.0).CGColor
    }
    
    func setupButtons() {
        tabClassButton.setBackgroundImage(Color.imageWithColor(UIColor.clearColor()), forState: .Highlighted)
        tabAssignmentsButton.setBackgroundImage(Color.imageWithColor(UIColor.clearColor()), forState: .Highlighted)
        tabSearchButton.setBackgroundImage(Color.imageWithColor(UIColor.clearColor()), forState: .Highlighted)
        tabSettingsButton.setBackgroundImage(Color.imageWithColor(UIColor.clearColor()), forState: .Highlighted)
    }
    
    @IBAction func tabSelected(sender: UIButton) {
        switch sender.tag {
        case 0:
            setSelectedTab(.ClassesTab)
        case 1:
            setSelectedTab(.AssignmentsTab)
        case 2:
            setSelectedTab(.DirectorySearchTab)
        case 3:
            setSelectedTab(.SettingsTab)
        default:
            setSelectedTab(.ClassesTab)
        }
    }
    
    func setSelectedTab(tabID: SelectedTabOptions) {
        setTabIcon(tabID)
        
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
    
    func setTabIcon(tabID: SelectedTabOptions) {
        
        switch tabID {
        case .ClassesTab:
            tabClassIcon.image = UIImage(named: "class_list_tab_icon_selected")
            tabAssignmentsIcon.image = UIImage(named: "assignment_tab_icon")
            tabSearchIcon.image = UIImage(named: "student_search_tab_icon")
            tabSettingsIcon.image = UIImage(named: "settings_tab_icon")
            
        case .AssignmentsTab:
            tabClassIcon.image = UIImage(named: "class_list_tab_icon")
            tabAssignmentsIcon.image = UIImage(named: "assignment_tab_icon_selected")
            tabSearchIcon.image = UIImage(named: "student_search_tab_icon")
            tabSettingsIcon.image = UIImage(named: "settings_tab_icon")
            
        case .DirectorySearchTab:
            tabClassIcon.image = UIImage(named: "class_list_tab_icon")
            tabAssignmentsIcon.image = UIImage(named: "assignment_tab_icon")
            tabSearchIcon.image = UIImage(named: "student_search_tab_icon_selected")
            tabSettingsIcon.image = UIImage(named: "settings_tab_icon")
            
        case .SettingsTab:
            tabClassIcon.image = UIImage(named: "class_list_tab_icon")
            tabAssignmentsIcon.image = UIImage(named: "assignment_tab_icon")
            tabSearchIcon.image = UIImage(named: "student_search_tab_icon")
            tabSettingsIcon.image = UIImage(named: "settings_tab_icon_selected")
            
        }
        
    }
    
    private func hideTab(hideClasses: Bool, hideAssignments: Bool, hideSearch: Bool, hideSettings: Bool) {
        ClassesViewController.hidden = hideClasses
        AssignmentsViewController.hidden = hideAssignments
        DirectorySearchViewController.hidden = hideSearch
        SettingsViewController.hidden = hideSettings
    }
    
}










