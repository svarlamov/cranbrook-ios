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

class ClassesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //  Table view
    @IBOutlet weak var tableView: UITableView!
    let classesCellIdentifier: String = "classes_cell"
    var emptyTableViewText: String = "No Classes"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
    
    func setupViews() {
        setupTableView()
    }
    
    func setupTableView() {
        self.tableView.estimatedRowHeight = 116
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.reloadData()
    }
    
}






