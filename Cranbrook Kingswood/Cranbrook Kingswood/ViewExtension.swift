//
//  ViewExtension.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 9/16/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
