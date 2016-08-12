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
	
	var pageViewContainerView: PageViewContainer = PageViewContainer()
	let containerViewSegueId: String = "pageViewContainerSegue"
	var previousDisplayedPage: SelectedTabOptions = .ClassesTab
	
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabIndicationView.hidden = true
        setupNavigationController()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        setTab(.ClassesTab)
    }
    
    func setupNavigationController() {
        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Avenir Next", size: 20)!]
        
    }
    
    func setTab(tab: SelectedTabOptions) {
        setupSelectedTab(tab, isAnimated: false)
        
    }
    
    @IBAction func tabButtonPress(sender: UIButton) {
        if (sender.tag == 0) {
            setupSelectedTab(.ClassesTab, isAnimated: true)
        } else if (sender.tag == 1) {
            setupSelectedTab(.AssignmentsTab, isAnimated: true)
        } else if (sender.tag == 2) {
            setupSelectedTab(.DirectorySearchTab, isAnimated: true)
        }
    }
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if (segue.identifier == containerViewSegueId) {
			pageViewContainerView = segue.destinationViewController as! PageViewContainer
		}
	}
    
    func setupSelectedTab(tab: SelectedTabOptions, isAnimated: Bool) {
        var animationDuration: NSTimeInterval = 0
        if (isAnimated) {
            animationDuration = 0.3
        }
		
		setPageViewCurrentDisplay(tab)
		
        UIView.animateWithDuration(animationDuration, animations: {
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
            
        }) { (isComplete) in
            self.tabIndicationView.hidden = false
			self.previousDisplayedPage = tab
        }
        
        UIView.animateWithDuration(1.0, animations: {
            self.setupSelectedTabLabel(tab)
        }, completion: nil)
    }
	
	func setPageViewCurrentDisplay(tab: SelectedTabOptions) {
		if (tab == .ClassesTab) {
			pageViewContainerView.setViewControllers([pageViewContainerView.pages[0]], direction: .Reverse, animated: true, completion: nil)
		
		} else if (tab == .AssignmentsTab) {
			var scrollDirection: UIPageViewControllerNavigationDirection = .Forward
			if (previousDisplayedPage == .ClassesTab) {
				scrollDirection = .Forward
			} else if (previousDisplayedPage == .DirectorySearchTab) {
				scrollDirection = .Reverse
			}
			pageViewContainerView.setViewControllers([pageViewContainerView.pages[1]], direction: scrollDirection, animated: true, completion: nil)
			
		} else if (tab == .DirectorySearchTab) {
			pageViewContainerView.setViewControllers([pageViewContainerView.pages[2]], direction: .Forward, animated: true, completion: nil)
			
		}
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










