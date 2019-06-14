//
//  RegistrationPresenter.swift
//  DriveEye
//
//  Created by Sallam on 6/14/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation

class RegistrationPresenter {
    
    let userModel: UserModel
    var registerVCDelegate: RegisterVCProtocol?
    
    init(userModel: UserModel) {
        self.userModel = userModel
    }
    
    func setVCDelegate(vcDelegate: RegisterVCProtocol) {
        self.registerVCDelegate = vcDelegate
    }
    
//    func getAllCities() -> [String] {
//        
//        userModel.getAllCities(closure: {([String]!) in
//            
//        })
//        return []
//    }
    
}
