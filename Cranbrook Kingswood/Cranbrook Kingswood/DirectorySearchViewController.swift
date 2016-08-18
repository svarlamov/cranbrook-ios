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
    
    override func viewDidLoad() {
        super.viewDidLoad()
		WebServices.service.searchDirectory(query: "An", directory: .Students) { (searchResponse) in
			
		}
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
    
}







