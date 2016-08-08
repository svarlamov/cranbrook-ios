//
//  StartupViewController.swift
//  Cranbrook Kingswood
//
//  Created by private on 8/6/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper

class StartupViewController: UIViewController {

    let continuationSegueId: String = "StartupCompleteSegue"
    let loginSegueId: String = "ShowLoginViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sleep(1)
        login()
    }
    
    private func login() {
        if (recoverLastLoggedInState()) {
            
        } else {
            
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        self.performSegueWithIdentifier(continuationSegueId, sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
