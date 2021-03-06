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
import Unbox
import CFAlertViewController

enum SelectedTabOptions: String {
    case ClassesTab             = "Classes Tab"
    case AssignmentsTab         = "Assignments Tab"
    case DirectorySearchTab     = "Directory Search Tab"
}

class ViewControllerContainer: CranbrookViewController {
    
    //  Logout
    @IBOutlet weak var logoutButton: UIBarButtonItem!
    let logoutSegue: String = "logout_segue"
    
    //  Calendar
    let calendarSegue: String = "display_calendar_view"
    
	//	Tab bar
    @IBOutlet weak var classesTabLabel: UILabel!
    @IBOutlet weak var assignmentsTabLabel: UILabel!
    @IBOutlet weak var searchTabLabel: UILabel!
    @IBOutlet weak var tabIndicationView: UIView!
	
	//	View containers
	@IBOutlet weak var classesViewContainer: UIView!
	@IBOutlet weak var assignmentsContainerView: UIView!
	@IBOutlet weak var searchContainerView: UIView!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabIndicationView.hidden = true
        setupNavigationController()
        setupLogoutButton()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        self.setTab(selectedTab)
    }
    
    func setupNavigationController() {
        if let font = UIFont(name: "Avenir Next", size: 20) {
            self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: font]
        }
        
    }
    
    func setupLogoutButton() {
        if let font = UIFont(name: "AvenirNext-Medium", size: 17) {
            self.logoutButton.setTitleTextAttributes([NSFontAttributeName: font], forState: UIControlState.Normal)
        }
    }
    
    @IBAction func showCalendarButtonClicked(sender: AnyObject) {
        self.view.endEditing(true)
        Analytics.analytics.logCalendarSelection()
        ProgressHUD.show()
        WebServices.service.getCalendarTasksForDate(date: NSDate()) { (isRequestSuccessful) in
            ProgressHUD.dismiss()
            if calendarTasksForDate?.count > 0 {
                self.performSegueWithIdentifier(self.calendarSegue, sender: nil)
            } else {
                self.showCalendarAlert()
            }
        }
    }
    
    func setTab(tab: SelectedTabOptions) {
        setupSelectedTab(tab, isAnimated: false)
    }
    
    @IBAction func logout(sender: UIButton) {
        self.displayLogoutAlert()
    }
    
    func displayLogoutAlert() {
        let titleText: String = "Alert"
        let descriptionTest: String = "Are you sure you want to log out?"
        let alertButtonColor: UIColor = UIColor(red: 255/255, green: 75/255, blue: 75/255, alpha: 1.0)
        let cancelButtonColor: UIColor = UIColor.grayColor()
        let logoutAlert: CFAlertViewController = CFAlertViewController.alertControllerWithTitle(titleText, message: descriptionTest, textAlignment: NSTextAlignment.Center, preferredStyle: CFAlertControllerStyle.Alert, didDismissAlertHandler: nil)
        logoutAlert.shouldDismissOnBackgroundTap = false
        let logoutButton: CFAlertAction = CFAlertAction(title: "LOG OUT", style: CFAlertActionStyle.Destructive, alignment: CFAlertActionAlignment.Justified, color: alertButtonColor) { (logoutButton) in
            self.logout()
        }!
        let cancelButton: CFAlertAction = CFAlertAction(title: "CANCEL", style: CFAlertActionStyle.Cancel, alignment: CFAlertActionAlignment.Justified, color: cancelButtonColor, handler: nil)!
        logoutAlert.addAction(logoutButton)
        logoutAlert.addAction(cancelButton)
        presentViewController(logoutAlert, animated: true, completion: nil)
    }
    
    func logout() {
        Analytics.analytics.logSignOut(userLoginInfo!.username)
        destroyPersistedLoginData()
        setupLogout()
        self.performSegueWithIdentifier(self.logoutSegue, sender: nil)
    }
    
    @IBAction func tabButtonPress(sender: UIButton) {
        if (sender.tag == 0) {
            setupSelectedTab(.ClassesTab, isAnimated: true)
            self.view.endEditing(true)
        } else if (sender.tag == 1) {
            setupSelectedTab(.AssignmentsTab, isAnimated: true)
            self.view.endEditing(true)
        } else if (sender.tag == 2) {
            setupSelectedTab(.DirectorySearchTab, isAnimated: true)
            self.view.endEditing(true)
        }
    }
    
    func setupSelectedTab(tab: SelectedTabOptions, isAnimated: Bool) {
        selectedTab = tab
        Analytics.analytics.logTabSelection(tab.rawValue)
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
                self.tabIndicationView.frame = CGRectMake(self.tabIndicationView.frame.origin.x, self.tabIndicationView.frame.origin.y, 90, self.tabIndicationView.frame.size.height)
                self.tabIndicationView.center.x = self.searchTabLabel.center.x
                
            }
            
        }) { (isComplete) in
            UIView.animateWithDuration(1.0, animations: { 
                self.tabIndicationView.hidden = false
            })
        }
        
        UIView.animateWithDuration(1.0, animations: {
            self.setupSelectedTabLabel(tab)
        }, completion: nil)
    }
    
	func setPageViewCurrentDisplay(tab: SelectedTabOptions) {
		if (tab == .ClassesTab) {
			classesViewContainer.hidden = false
			assignmentsContainerView.hidden = true
			searchContainerView.hidden = true
		
		} else if (tab == .AssignmentsTab) {
			classesViewContainer.hidden = true
			assignmentsContainerView.hidden = false
			searchContainerView.hidden = true
			
		} else if (tab == .DirectorySearchTab) {
			classesViewContainer.hidden = true
			assignmentsContainerView.hidden = true
			searchContainerView.hidden = false
			
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










