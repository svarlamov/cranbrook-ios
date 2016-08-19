//
//  DirectorySearchViewController.swift
//  Cranbrook Kingswood
//
//  Created by private on 8/6/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Unbox

class DirectorySearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Directory tab bar data source
    var currentSearchDirectory: SearchDirectories = .Students
    
    //Table view
    let searchCellIdentifier: String = "search_cell"
    @IBOutlet weak var tableView: UITableView!
    
    // Directory filter tab bar
    @IBOutlet weak var searchTabView: UIView!
    @IBOutlet weak var tabIndicationView: UIView!
    @IBOutlet weak var alumniTabButton: UIButton!
    @IBOutlet weak var alumniTabLabel: UILabel!
    @IBOutlet weak var studentsTabButton: UIButton!
    @IBOutlet weak var studentsTabLabel: UILabel!
    @IBOutlet weak var facultyTabButton: UIButton!
    @IBOutlet weak var facultyTabLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
		setupViews()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        setTab(.Students, animated: false)
    }
    
    func setupViews() {
        self.tabIndicationView.hidden = true
    }
    
    func setTab(tab: SearchDirectories, animated: Bool) {
        setupSelectedTab(tab, isAnimated: animated)
        
    }
    
    @IBAction func directoryTabPressed(sender: UIButton) {
        if (sender.tag == 0) {
            setTab(.Faculty, animated: true)
            
        } else if (sender.tag == 1) {
            setTab(.Students, animated: true)
            
        } else if (sender.tag == 2) {
            setTab(.Alumni, animated: true)
            
        }
    }
    
    private func searchDirectory(searchQuery: String, callBack: (searchResponse: [SearchResultResponse]?) -> Void) {
        WebServices.service.searchDirectory(query: "An", directory: self.currentSearchDirectory) { (searchResponse) in
            callBack(searchResponse: searchResponse)
        }
    }
    
}







