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
import Unbox

enum startupSegueOptions: String {
    case continuation   = "StartupCompleteSegue"
    case login          = "ShowLoginViewController"
}

enum loginCurrentUserStatusPrintOptions: String {
    case currentUser            = "logged_in_user"
    case currentUserButFailed   = "logged_in_user_with_failed_credentials"
    case noCurrentUser          = "no_logged_in_user"
}

class StartupViewController: CranbrookViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func login() {
        if (recoverLastLoggedInState()) {
            let username: String = userLoginInfo!.username
            let password: String = userLoginInfo!.password
            WebServices.service.loginWithParameters(username: username, password: password, callBack: { (isLoginSuccessful) in
                if isLoginSuccessful {
                    self.takeSegue(.continuation)
                } else {
                    destroyPersistedLoginData()
                    self.takeSegue(.login)
                }
            })
            
        } else {
            print(loginCurrentUserStatusPrintOptions.noCurrentUser.rawValue)
            takeSegue(.login)
            
        }
        
    }
    
    func takeSegue(segue: startupSegueOptions) {
        self.performSegueWithIdentifier(segue.rawValue, sender: nil)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        login()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}









