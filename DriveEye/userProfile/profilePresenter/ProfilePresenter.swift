//
//  ProfilePresenter.swift
//  DriveEye
//
//  Created by MacBookPro on 5/31/19.
//  Copyright © 2019 java. All rights reserved.
//

import UIKit

class ProfilePresenter: NSObject {
    let userModel : UserProfileModel!
    var delegate : UserProfileDelegate?
    func getUserData(id : Int){
        userModel.getUserData(id: id, comletion: {error , user in
            if let user = user {
            self.delegate?.displayUserData(user: user)
            }
        })
    }
    
    func attachView(delegate : UserProfileDelegate) {
        self.delegate = delegate
    }
    
     init(userModel : UserProfileModel) {
        self.userModel = userModel
    }

}
protocol UserProfileDelegate {
    func displayUserData(user : UserInfo)
    func displayErrorMessage()
}
