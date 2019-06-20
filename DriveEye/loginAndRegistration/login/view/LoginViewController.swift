//
//  LoginViewController.swift
//  DriveEye
//
//  Created by Sallam on 6/14/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginVCProtocol {
    
    func goToHomeScreen() {
        let homeScreen = UIStoryboard(name: "HomeStoryboard", bundle: nil)
        let vc = homeScreen.instantiateInitialViewController()
        self.present(vc!, animated: true, completion: nil)
    }
    
    func showAlert(msg: String) {
        
        let alert = UIAlertController(title: "Oops!", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            alert.dismiss(animated: true, completion: nil)
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    let presenter = LoginPresenter(userModel: UserModel())
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnFacebook: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnFacebook.layer.borderColor = UIColor.blue.cgColor
        btnFacebook.layer.borderWidth = 1.0
        
        presenter.setVCDelegate(vcDelegate: self)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboard), name: Notification.Name.UIKeyboardWillHide, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboard), name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    @IBAction func loginWithEmail(_ sender: Any) {
        self.presenter.loginWithEmail(email: tfEmail.text!, password: tfPassword.text!)
        print("btn login is pressed with email: \(tfEmail.text!), password: \(tfPassword.text!)")
    }
    
    @IBAction func register(_ sender: Any) {
        //TODO: Go to the registration screen
    }
    
    @IBAction func loginWithFacebook(_ sender: Any) {
        //TODO: login with facebook code here
    }
    
    @objc func handleKeyboard(notification: Notification){
        
        let userInfo = notification.userInfo!
        
        let keyboardScreenEndFrame = (userInfo[UIKeyboardIsLocalUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == Notification.Name.UIKeyboardWillHide {
            scrollView.contentInset = UIEdgeInsets.zero
        }else {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height + 300
                , right: 0)
        }
        
        scrollView.scrollIndicatorInsets = scrollView.contentInset
    }
    
}
