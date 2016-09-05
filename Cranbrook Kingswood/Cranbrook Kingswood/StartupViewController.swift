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

class StartupViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //  Reachability
    var reach: Reachability?
    @IBOutlet weak var networkMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        self.showActivityIndicator()
        self.setupReachability()
        self.checkForConnectionAtStart()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func checkForConnectionAtStart() {
        if NetworkStatus.networkStatus.isConnectedToNetwork() {
            self.ifConnectionIsAvailable(isAvailable: true)
        } else {
            self.ifConnectionIsAvailable(isAvailable: false)
        }
    }
    
    func setupViews() {
        self.setupActivityIndicator()
    }
    
    func setupActivityIndicator() {
        self.activityIndicator.hidden = true
    }
    
    func showActivityIndicator() {
        UIView.animateWithDuration(0.2) { 
            self.activityIndicator.hidden = false
        }
    }
    
    //  MARK: - Reachability
    func setupReachability() {
        self.reach = Reachability.reachabilityForInternetConnection()
        self.reach!.reachableOnWWAN = false
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CranbrookViewController.reachabilityChanged(_:)), name: kReachabilityChangedNotification, object: nil)
        self.reach!.startNotifier()
    }
    
    func reachabilityChanged(notification: NSNotification) {
        if self.reach!.isReachableViaWiFi() || self.reach!.isReachableViaWWAN() {
            self.ifConnectionIsAvailable(isAvailable: true)
        } else {
            self.ifConnectionIsAvailable(isAvailable: false)
        }
    }
    
    func ifConnectionIsAvailable(isAvailable isAvailable: Bool) {
        if isAvailable {
            self.networkMessageLabel.hidden = true
            login()
        } else {
            self.networkMessageLabel.hidden = false
        }
    }
    
    func takeSegue(segue: startupSegueOptions) {
        self.performSegueWithIdentifier(segue.rawValue, sender: nil)
    }
    
}









