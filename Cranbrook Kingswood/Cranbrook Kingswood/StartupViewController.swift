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
    @IBOutlet weak var mainImage: UIImageView!
    
    //  Reachability
    var reach: Reachability?
    @IBOutlet weak var networkMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        self.setupViews()
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
        if RemoteConfig.config.isAppAvailable() {
            print("aweomse")
        } else {
            print("fuck")
        }
        self.setupActivityIndicator()
        self.setupReachability()
        self.checkForConnectionAtStart()
    }
    
    func setupActivityIndicator() {
        let lineMatColor = UIColor(red: 53 / 255.0, green: 75 / 255.0, blue: 160 / 255.0, alpha: 1.0)
        let width: CGFloat = self.mainImage.frame.size.width - 10
        let height: CGFloat = 20
        let yPosition: CGFloat = self.mainImage.frame.origin.y + self.mainImage.frame.size.height + 17
        let xPosition: CGFloat = self.mainImage.frame.origin.x + 15
        let lineMatFrame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        let lineMat = LiquidLoader(frame: lineMatFrame, effect: .Line(lineMatColor,4,1.0, UIColor.redColor()))
        self.view.addSubview(lineMat)
    }
    
    //  MARK: - Reachability
    func setupReachability() {
        self.reach = Reachability.reachabilityForInternetConnection()
        self.reach!.reachableOnWWAN = false
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(StartupViewController.reachabilityChanged(_:)), name: kReachabilityChangedNotification, object: nil)
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









