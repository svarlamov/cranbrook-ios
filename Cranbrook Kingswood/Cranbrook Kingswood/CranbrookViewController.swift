//
//  CranbrookViewController.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 8/30/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import SystemConfiguration

class CranbrookViewController: UIViewController {
    
    //  Reachability
    var reach: Reachability?
    var networkMessage: UIAlertController = UIAlertController()
    internal var isConnectionAvailable: Bool = Bool()
    
    override func viewDidLoad() { super.viewDidLoad() }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        self.setupReachability()
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
            self.removeNetworkMessage()
            self.isConnectionAvailable = true
        } else {
            self.displayNoNetworkMessage()
            self.isConnectionAvailable = false
        }
    }
    
    func displayNoNetworkMessage() {
        self.networkMessage = UIAlertController(title: nil, message: "Make sure to establish a stable network connection before continuing", preferredStyle: .Alert)
        self.presentViewController(self.networkMessage, animated: true, completion: nil)
    }
    
    func removeNetworkMessage() {
        self.networkMessage.dismissViewControllerAnimated(true, completion: nil)
    }
    
}