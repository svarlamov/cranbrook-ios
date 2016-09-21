//
//  CranbrookViewController.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 9/17/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import UIKit

class CranbrookViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func showNetworkAlert() {
        ISMessages.showCardAlertWithTitle("Error", message: "No Network Connection.", iconImage: nil, duration: 3, hideOnSwipe: true, hideOnTap: true, alertType: ISAlertType.Error, alertPosition: ISAlertPosition.Bottom)
    }
    
    internal func showRequestError() {
        ISMessages.showCardAlertWithTitle("Error", message: "Unable to Get Data.", iconImage: nil, duration: 3, hideOnSwipe: true, hideOnTap: true, alertType: ISAlertType.Error, alertPosition: ISAlertPosition.Bottom)
    }
    
    internal func showCalendarAlert() {
        ISMessages.showCardAlertWithTitle("Info", message: "Nothing Schedule Today.", iconImage: nil, duration: 3, hideOnSwipe: true, hideOnTap: true, alertType: ISAlertType.Warning, alertPosition: ISAlertPosition.Bottom)
    }

}
