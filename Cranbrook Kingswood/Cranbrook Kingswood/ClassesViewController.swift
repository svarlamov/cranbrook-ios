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

class ClassesViewController: CranbrookViewController, UITableViewDataSource, UITableViewDelegate {

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
                    if !isRequestSuccessful {
                        self!.showRequestError()
                    }
                }
            } else {
                self?.tableView.stopPullToRefresh()
                self?.showNetworkAlert()
            }
        })
    }
    
    func setupTableView() {
        self.tableView.estimatedRowHeight = 116.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.reloadData()
    }
    
}






