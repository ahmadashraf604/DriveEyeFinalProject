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
    
    func getAllCities() {
        
        self.userModel.getAllCities(closure: {(cities) in
//            print((cities?.response))
            self.registerVCDelegate?.populateCitiesTable(cities: cities!)
        })
    }
    
    func registerUser(userInfo: UserToReg, car: Car){
        userModel.registerNewUser(user: userInfo, closure: {(user) in
            if user != nil {
                if (user?.status)! {
                    
                    self.addCarToUser(userId: (user?.response.userID)!, carInfo: car)
                    Utils.saveCurrentUserId(userID: (user?.response.userID)!)
                    self.registerVCDelegate?.goToHomeScreen()
                    
                } else {
                    self.registerVCDelegate?.showAlert(msg: "Invalid email or password")
                }
                
            } else {
                print("error happened!")
                self.registerVCDelegate?.showAlert(msg: "Something went wrong")
            }
        })
    }
    
    func addCarToUser(userId: Int, carInfo: Car) {
        userModel.addCar(userId: userId, carInfo: carInfo)
    }
    
}
