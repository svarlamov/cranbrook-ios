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
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        setupViews()
        
    }
    
    func setupViews() {
        setupNavigationController()
        setTab(.AssignmentsTab)
    }
    
    func setupNavigationController() {
        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Avenir Next", size: 20)!]
        
    }
    
    func setTab(tab: SelectedTabOptions) {
        setupSelectedTab(tab)
        
    }
    
    @IBAction func tabButtonPress(sender: UIButton) {
        if (sender.tag == 0) {
            setTab(.ClassesTab)
        } else if (sender.tag == 1) {
            setTab(.AssignmentsTab)
        } else if (sender.tag == 2) {
            setTab(.DirectorySearchTab)
        }
    }
    
    func setupSelectedTab(tab: SelectedTabOptions) {
        
        UIView.animateWithDuration(0.5, animations: {
            if (tab == .ClassesTab) {
                self.tabIndicationView.frame = CGRectMake(self.tabIndicationView.frame.origin.x, self.tabIndicationView.frame.origin.y, 78, self.tabIndicationView.frame.size.height)
                self.tabIndicationView.center.x = self.classesTabLabel.center.x
                
            } else if (tab == .AssignmentsTab) {
                self.tabIndicationView.frame = CGRectMake(self.tabIndicationView.frame.origin.x, self.tabIndicationView.frame.origin.y, 115, self.tabIndicationView.frame.size.height)
                self.tabIndicationView.center.x = self.assignmentsTabLabel.center.x
                
            } else if (tab == .DirectorySearchTab) {
                self.tabIndicationView.frame = CGRectMake(self.tabIndicationView.frame.origin.x, self.tabIndicationView.frame.origin.y, 69, self.tabIndicationView.frame.size.height)
                self.tabIndicationView.center.x = self.searchTabLabel.center.x
                
            }
            
        }, completion: nil)
        
        UIView.animateWithDuration(1.0, animations: {
            self.setupSelectedTabLabel(tab)
        }, completion: nil)
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










