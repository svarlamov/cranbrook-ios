//
//  LoginViewController.swift
//  Cranbrook Kingswood
//
//  Created by private on 8/7/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import ObjectMapper

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        if let font = UIFont(name: "Avenir-Next.ttf", size: 34) {
            UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: font]
        }
        
    }
    
}

