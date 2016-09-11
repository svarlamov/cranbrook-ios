//
//  ClassesViewController.swift
//  Cranbrook Kingswood
//
//  Created by private on 8/6/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Unbox
import QuartzCore
import PullToRefreshSwift
import SwiftMessages

class ClassesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //  Table view
    @IBOutlet weak var tableView: UITableView!
    let classesCellIdentifier: String = "classes_cell"
    var emptyTableViewText: String = "No Classes"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        setupTableViewRefresh()
    }
    
    func setupViews() {
        setupTableView()
    }
    
    func setupTableViewRefresh() {
        self.tableView.addPullToRefresh({ [weak self] in
            if NetworkStatus.networkStatus.isConnectedToNetwork() {
                WebServices.service.getCurrentUserClasses(true) { (isRequestSuccessful) in
                    self?.tableView.reloadData()
                    self?.tableView.stopPullToRefresh()
                }
            } else {
                self?.tableView.stopPullToRefresh()
                var config = SwiftMessages.Config()
                let error = MessageView.viewFromNib(layout: .CardView)
                error.configureContent(title: "Error", body: "No Network Connection.", iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: "Hide", buttonTapHandler: { _ in SwiftMessages.hide() })
                config.presentationStyle = .Bottom
                error.configureTheme(.Error, iconStyle: .Default)
                config.interactiveHide = true
                config.dimMode = .Gray(interactive: true)
                SwiftMessages.show(config: config, view: error)
            }
        })
    }
    
    func setupTableView() {
        self.tableView.estimatedRowHeight = 116.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.reloadData()
    }
    
}






