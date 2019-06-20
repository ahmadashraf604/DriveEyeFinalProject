//
//  LoginPresenter.swift
//  DriveEye
//
//  Created by Sallam on 6/14/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation

class LoginPresenter {
    
    let userModel: UserModel
    var LoginVCDelegate: LoginVCProtocol?
    
    init(userModel: UserModel) {
        self.userModel = userModel
    }
    
    func setVCDelegate(vcDelegate: LoginVCProtocol) {
        self.LoginVCDelegate = vcDelegate
    }
    
    func loginWithEmail(email: String, password: String) {
        self.userModel.login(email: email, password: password, closure: {(user) in
            
            if user != nil {
                if (user?.status)! {
                    //if login succeeded
                    Utils.saveCurrentUserId(userID: (user?.response.userID)!)
                    //TODO: go to the home page transfereing the user object with you
                    self.LoginVCDelegate?.goToHomeScreen()
                } else {
                    self.LoginVCDelegate?.showAlert(msg: "Invalid email or password")
                }
                
            } else {
                print("error happened!")
                self.LoginVCDelegate?.showAlert(msg: "Something went wrong")
            }
        })
    }
    
}
