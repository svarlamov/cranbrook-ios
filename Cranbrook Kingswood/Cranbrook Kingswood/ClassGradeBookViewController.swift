//
//  ClassGradeBookViewController.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 9/28/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation

class classGradeBookViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //  Table View
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "classes_grade_book_cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
    
    func setupViews() {
        self.setupTableView()
    }
    
    func setupTableView() {
        self.tableView.estimatedRowHeight = 92.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.reloadData()
    }
    
    @IBAction func dismissViewController() {
        self.dismissViewControllerAnimated(true) {}
    }
    
    @IBAction func swipedToDismiss(sender: AnyObject) {
        self.dismissViewController()
    }
}
