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

enum SelectedTabOptions: String {
    case ClassesTab = "classes_tab"
    case AssignmentsTab = "assignments_tab"
    case DirectorySearchTab = "search_tab"
}

class ViewControllerContainer: UIViewController {

    @IBOutlet weak var classesTabLabel: UILabel!
    @IBOutlet weak var assignmentsTabLabel: UILabel!
    @IBOutlet weak var searchTabLabel: UILabel!
    @IBOutlet weak var tabIndicationView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    func setupViews() {
        setupNavigationController()
        setTab(.ClassesTab)
    }
    
    func setupNavigationController() {
        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Avenir Next", size: 20)!]
        
    }
    
    func setTab(tab: SelectedTabOptions) {
        setupSelectedTab(tab)
        
    }
    
    func setupSelectedTab(tab: SelectedTabOptions) {
        UIView.animateWithDuration(0.5, animations: {
            if (tab == .ClassesTab) {
                
            } else if (tab == .AssignmentsTab) {
                
            } else if (tab == .DirectorySearchTab) {
                
            }
            
        }, completion: nil)
        
        UIView.animateWithDuration(1.0, animations: {
            self.setupSelectedTabLabel(tab)
        }, completion: nil)
    }
    
    func setPositionForBlueTabIndicator(tab: SelectedTabOptions) {
        
    }
    
    func setupSelectedTabLabel(tab: SelectedTabOptions) {
        let nonSelectedColor: UIColor = UIColor(red: 0.639, green: 0.639, blue: 0.682, alpha: 1.000)
        let selectedColor: UIColor = UIColor(red: 0.000, green: 0.588, blue: 1.000, alpha: 1.000)
        
        if (tab == .ClassesTab) {
            self.classesTabLabel.textColor = selectedColor
            self.assignmentsTabLabel.textColor = nonSelectedColor
            self.searchTabLabel.textColor = nonSelectedColor
            
        } else if (tab == .AssignmentsTab) {
            self.classesTabLabel.textColor = nonSelectedColor
            self.assignmentsTabLabel.textColor = selectedColor
            self.searchTabLabel.textColor = nonSelectedColor
            
        } else if (tab == .DirectorySearchTab) {
            self.classesTabLabel.textColor = nonSelectedColor
            self.assignmentsTabLabel.textColor = nonSelectedColor
            self.searchTabLabel.textColor = selectedColor
            
        }
        
    }
    
}










