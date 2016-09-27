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
import SwiftMessages

class DirectorySearchViewController: CranbrookViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UITextFieldDelegate {
    
    // Search bar
    @IBOutlet weak var directorySearchBar: UISearchBar!
    
    // Directory tab bar data source
    var currentSearchDirectory: SearchDirectories = .Students
    
    //Table view
    let searchCellIdentifier: String = "search_cell"
    @IBOutlet weak var tableView: UITableView!
    var emptyTableViewText: String = "Search the CK Directory"
    
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
    
    func searchDirectory(searchQuery: String) {
        if NetworkStatus.networkStatus.isConnectedToNetwork() {
            WebServices.service.searchDirectory(query: searchQuery, directory: self.currentSearchDirectory) { (searchResponse) in
                self.emptyTableViewText = "No search results"
                searchResults = searchResponse!
                ProgressHUD.dismiss()
                self.tableView.reloadData()
                self.tableView.setContentOffset(CGPointZero, animated:true)
            }
        }
    }
    @IBAction func screenSelection(sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.view.endEditing(true)
        if NetworkStatus.networkStatus.isConnectedToNetwork() {
            searchDirectory(searchBar.text!)
            ProgressHUD.show()
        } else {
            self.showNetworkAlert()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        setTab(selectedSearchDirectory, animated: false)
    }
    
    func setupViews() {
        self.tabIndicationView.hidden = true
    }
    
    func setTab(tab: SearchDirectories, animated: Bool) {
        setupSelectedTab(tab, isAnimated: animated)
    }
    
    @IBAction func directoryTabPressed(sender: UIButton) {
        if (sender.tag == 0) {
            selectedSearchDirectory = SearchDirectories.Faculty
            setTab(.Faculty, animated: true)
            
        } else if (sender.tag == 1) {
            selectedSearchDirectory = SearchDirectories.Students
            setTab(.Students, animated: true)
            
        } else if (sender.tag == 2) {
            selectedSearchDirectory = SearchDirectories.Alumni
            setTab(.Alumni, animated: true)
            
        }
    }
    
    func popupDetailView() {
        let view: SearchResultDetailView = try! SwiftMessages.viewFromNib()
        view.configureDropShadow()
        var config = SwiftMessages.Config()
        config.presentationContext = .Window(windowLevel: UIWindowLevelStatusBar)
        config.duration = .Forever
        config.presentationStyle = .Bottom
        config.dimMode = .Gray(interactive: true)
        SwiftMessages.show(config: config, view: view)
    }
    
}





