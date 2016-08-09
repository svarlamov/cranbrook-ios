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

enum startupSegueOptions: String {
    case continuation = "StartupCompleteSegue"
    case login = "ShowLoginViewController"
}

class StartupViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func login() {
        if (recoverLastLoggedInState()) {
            print("logged_in_user")
            let username: String = userLoginInfo!.username
            let password: String = userLoginInfo!.password
            WebServices.service.loginWithParameters(username: username, password: password)
            
        } else {
            print("no_logged_in_user")
            takeSegue(.login)
            
        }
        
    }
    
    func takeSegue(segue: startupSegueOptions) {
        self.performSegueWithIdentifier(segue.rawValue, sender: nil)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        sleep(1)
        login()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
