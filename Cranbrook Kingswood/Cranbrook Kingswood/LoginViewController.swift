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
import Unbox

class LoginViewController: UIViewController, UITextFieldDelegate {
	
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginMessageLabel: UILabel!
	
    let placeholderTextColor: UIColor = UIColor(red: 192/255, green: 191/255, blue: 196/255, alpha: 1.0)
	
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    // MARK: - Login methods
    @IBAction func login(sender: UIButton) {
        signIn(usernameTextField.text!, password: passwordTextField.text!)
    }
    
    private func signIn(username: String, password: String) {
        
        if isValidCredential(username, inputPassword: password) {
            ProgressHUD.dismiss()
            if NetworkStatus.networkStatus.isConnectedToNetwork() {
                WebServices.service.loginWithParameters(username: username, password: password, callBack: { (isLoginSuccessful) in
                    if isLoginSuccessful {
                        ProgressHUD.dismiss()
                        self.takeSegue(.continuation)
                    } else {
                        ProgressHUD.dismiss()
                        self.displayLoginError(withMessage: "Error: Login Credentials Invalid")
                    }
                })
            } else {
                ProgressHUD.dismiss()
                self.displayLoginError(withMessage: "Error: No Network Connection")
            }
            
        } else {
            self.displayLoginError(withMessage: "Error: Username and Password Blank")
            
        }
        
    }
    
    func displayLoginError(withMessage withText: String!) {
        loginMessageLabel.text = withText
        loginMessageLabel.textColor = UIColor.redColor()
    }
    
    private func isValidCredential(inputUsername: String, inputPassword: String) -> Bool {
        if inputUsername != "" && inputPassword != "" {
            return true
        }
        return false
    }
    
    func takeSegue(segue: startupSegueOptions) {
        self.performSegueWithIdentifier(segue.rawValue, sender: nil)
        
    }
    
    // MARK: - Subview setup
    func setupViews() {
        setupTextFields()
        setupLogInButton()
        setupNavigationBar()
    }
    
    func setupTextFields() {
        textFieldSetup(usernameTextField, placeholderText: "Username")
        textFieldSetup(passwordTextField, placeholderText: "Password")
        
        usernameTextField.tag = 1
        passwordTextField.tag = 2
        
    }
    
    func setupLogInButton() {
        logInButton.layer.cornerRadius = 5
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func setupNavigationBar() {
        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Avenir Next", size: 20)!]
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func textFieldSetup(inputTextField: UITextField, placeholderText: String) {
        inputTextField.delegate = self
        inputTextField.layer.cornerRadius = 5
        inputTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
        inputTextField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSForegroundColorAttributeName: self.placeholderTextColor])
        
    }
    
    // MARK: - UITextField delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        switch textField.tag {
        case 1:
            self.passwordTextField.becomeFirstResponder()
            return true
            
        case 2:
            signIn(usernameTextField.text!, password: passwordTextField.text!)
            textField.resignFirstResponder()
            return true
            
        default:
            break
            
        }
        
        return false
    }
    
}















