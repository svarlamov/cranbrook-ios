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

class DirectorySearchViewController: UIViewController {
    
    // Directory filter tab bar
    @IBOutlet weak var searchTabView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
		setupViews()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
    
    private func setupViews() {
        setupTabViewShadow()
    }
    
    private func setupTabViewShadow() {
        self.searchTabView.layer.shadowColor = UIColor.blackColor().CGColor;
        self.searchTabView.layer.shadowOffset = CGSizeMake(0, 2);
        self.searchTabView.layer.shadowOpacity = 0.3;
        self.searchTabView.layer.shadowRadius = 1.0;
    }
    
    private func searchDirectory(searchQuery: String, directoryFilter: SearchDirectories, callBack: (searchResponse: [SearchResultResponse]?) -> Void) {
        WebServices.service.searchDirectory(query: "An", directory: .Students) { (searchResponse) in
            callBack(searchResponse: searchResponse)
        }
    }
    
}







