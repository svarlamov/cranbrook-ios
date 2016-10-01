//
//  AssignmentDetailViewController.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 10/1/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation

class assignmentDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //  Table View
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "assignment_detail_cell"
    
    //  Dismiss
    @IBOutlet var swipeToDismiss: UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
    
    @IBAction func dismissViewController() {
        self.dismissViewControllerAnimated(true) {}
    }
    
    func setupViews() {
        self.setupTableView()
    }
    
    func setupTableView() {
        self.tableView.estimatedRowHeight = 77.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.reloadData()
    }
    
    @IBAction func swipedToDismiss(sender: AnyObject) {
        self.dismissViewController()
    }
    
}
