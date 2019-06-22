//
//  UserProfileModel.swift
//  DriveEye
//
//  Created by MacBookPro on 5/31/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation
import Alamofire

class UserProfileModel {
    private let baseUrl = "https://driveeye.herokuapp.com/user/info/"
    func getUserData( id :Int,comletion : @escaping ( Error? , UserInfo?)-> ())  {
        let url = URL(string: baseUrl + String(id))
        Alamofire.request(url!).responseJSON{ response in
                 guard let data = response.data else { return }
                do {
                let decoder = JSONDecoder()
                let userRequest = try decoder.decode(UserResponse.self, from: data)
                if userRequest.status{
                   // let user = userRequest.response
                   // print(" user email \(user.email)")
                    
                     comletion(nil,userRequest.response)
                    
                }
            } catch let error {
                print(error)
                comletion(error,nil)
            }
        }
        }
        
    
    
}

