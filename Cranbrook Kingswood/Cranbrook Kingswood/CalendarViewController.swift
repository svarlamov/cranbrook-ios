//
//  CalendarViewController.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 9/3/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Unbox
import SwiftMessages
import PullToRefreshSwift

class CalendarViewController: UITableViewController {
    
    //  Table View
    let calendarCellIdentifier: String = "calendar_cell"
    var emptyTableViewText: String = "No Events Today"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
    
    private func loadCalendarData() {
        ProgressHUD.show()
        if NetworkStatus.networkStatus.isConnectedToNetwork() {
            WebServices.service.getCalendarTasksForDate(date: NSDate()) { (isRequestSuccessful) in
                ProgressHUD.dismiss()
                self.tableView.reloadData()
            }
        } else {
            ProgressHUD.dismiss()
        }
    }
    
    func setupTableView() {
        self.tableView.estimatedRowHeight = 73.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func convertDateToText(dateString: String) -> String {
        var returnString: String = String()
        
        //  Convert to date
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
        let convertedDate: NSDate = dateFormatter.dateFromString(dateString)!
        
        //  Convert back to string
        let revertDateFormatter = NSDateFormatter()
        revertDateFormatter.dateFormat = "hh:mm a"
        returnString = revertDateFormatter.stringFromDate(convertedDate)
        
        return returnString
    }
    
    @IBAction func setupTableViewRefresh() {
        if NetworkStatus.networkStatus.isConnectedToNetwork() {
            WebServices.service.getCalendarTasksForDate(date: NSDate()) { (isRequestSuccessful) in
                self.tableView.reloadData()
            }
        } else {
            self.tableView.reloadData()
            var config = SwiftMessages.Config()
            let error = MessageView.viewFromNib(layout: .CardView)
            error.configureContent(title: "Error", body: "No Network Connection.", iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: "Hide", buttonTapHandler: { _ in SwiftMessages.hide() })
            config.presentationStyle = .Bottom
            error.configureTheme(.Error, iconStyle: .Default)
            config.interactiveHide = true
            config.dimMode = .Gray(interactive: true)
            SwiftMessages.show(config: config, view: error)
        }
    }
    
}