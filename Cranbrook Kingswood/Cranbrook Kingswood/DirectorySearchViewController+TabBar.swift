//
//  DirectorySearchViewController+TabBar.swift
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
    
    func setupSelectedTab(tab: SearchDirectories, isAnimated: Bool) {
        var animationDuration: NSTimeInterval = 0
        if (isAnimated) {
            animationDuration = 0.3
        }
        
        setCurrentReturnVariable(tab)
        
        UIView.animateWithDuration(animationDuration, animations: {
            if (tab == .Faculty) {
                self.tabIndicationView.frame = CGRectMake(self.tabIndicationView.frame.origin.x, self.tabIndicationView.frame.origin.y, 64, self.tabIndicationView.frame.size.height)
                self.tabIndicationView.center.x = self.facultyTabLabel.center.x
                
            } else if (tab == .Students) {
                self.tabIndicationView.frame = CGRectMake(self.tabIndicationView.frame.origin.x, self.tabIndicationView.frame.origin.y, 70, self.tabIndicationView.frame.size.height)
                self.tabIndicationView.center.x = self.studentsTabLabel.center.x
                
            } else if (tab == .Alumni) {
                self.tabIndicationView.frame = CGRectMake(self.tabIndicationView.frame.origin.x, self.tabIndicationView.frame.origin.y, 64, self.tabIndicationView.frame.size.height)
                self.tabIndicationView.center.x = self.alumniTabLabel.center.x
                
            }
            
        }) { (isComplete) in
            self.tabIndicationView.hidden = false
        }
        
        UIView.animateWithDuration(1.0, animations: {
            self.setupSelectedTabLabel(tab)
        }, completion: nil)
    }
    
    func setCurrentReturnVariable(directory: SearchDirectories) {
        self.currentSearchDirectory = directory
    }
    
    func setupSelectedTabLabel(tab: SearchDirectories) {
        let nonSelectedColor: UIColor = UIColor(red: 0.639, green: 0.639, blue: 0.682, alpha: 1.000)
        let selectedColor: UIColor = UIColor(red: 0.286, green: 0.705, blue: 1.000, alpha: 1.000)
        
        if (tab == .Faculty) {
            self.facultyTabLabel.textColor = selectedColor
            self.studentsTabLabel.textColor = nonSelectedColor
            self.alumniTabLabel.textColor = nonSelectedColor
            
        } else if (tab == .Students) {
            self.facultyTabLabel.textColor = nonSelectedColor
            self.studentsTabLabel.textColor = selectedColor
            self.alumniTabLabel.textColor = nonSelectedColor
            
        } else if (tab == .Alumni) {
            self.facultyTabLabel.textColor = nonSelectedColor
            self.studentsTabLabel.textColor = nonSelectedColor
            self.alumniTabLabel.textColor = selectedColor
            
        }
        
    }
    
}
