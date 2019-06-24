//
//  UserModel.swift
//  DriveEye
//
//  Created by Sallam on 6/14/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation
import Alamofire

class UserModel {
    let  loginUrl = URL(string: "https://driveeye.herokuapp.com/user/login")!
    let  registerUrl = URL(string: "https://driveeye.herokuapp.com/user/register")!
    let  getAllCitiesUrl = URL(string: "https://driveeye.herokuapp.com/city/get")!
    
    func login(email: String, password: String, closure: @escaping (_ obj: UserResponse?) -> Void) {
        let parameters: [String: Any] = [
            "email" : email,
            "password" : password
        ]
        Alamofire.request(loginUrl, method: .post, parameters: parameters)
            .responseJSON { response in
                print(response)
                guard response.data != nil else { return }
                do {
                    let decoder = JSONDecoder()
                    let user = try decoder.decode(UserResponse.self, from: response.data!)
                    print(user)
                    closure(user)
                } catch _ {
                    closure(nil)

                }
        }
        
    }
    
    func getAllCities(closure: @escaping (CitiesResponse?) -> Void) {
        Alamofire.request(getAllCitiesUrl).responseJSON(completionHandler: {response in
            guard let data = response.data else{return}
            do {
                let decoder = JSONDecoder()
                let cities = try decoder.decode(CitiesResponse.self, from: data)
                //                print(cities)
                closure(cities)
            } catch _ {
                
            }
        })
    }
    
    func registerNewUser(user: UserToReg, closure: @escaping (_ obj: UserResponse?) -> Void) {
        
        let parameters: [String: Any] = [
            "email" : user.email,
            "password" : user.password,
            "firstName" : user.firstName,
            "lastName" : user.lastName,
            "birthdate" : user.birthDate,
            "cityId" : user.cityId,
            ]
        
        Alamofire.request(registerUrl, method: .post, parameters: parameters)
            .responseJSON { response in
                guard let data = response.data else { return }
                print(response)
                do {
                    let decoder = JSONDecoder()
                    let user = try decoder.decode(UserResponse.self, from: data)
                    print(user)
                    closure(user)
                } catch let error{
                    closure(nil)
                    print(error)
                }
        }
    }
    

    func addCar(userId: Int, carInfo: Car, onSuccess: @escaping (_ obj: Bool) -> Void) {
        let url = "https://driveeye.herokuapp.com/car/add/" + String(userId)
        
        let  addCarUrl = URL(string: url)!
        let parameters: [String: Any] = [
            "brand" : carInfo.brand,
            "model" : carInfo.model
        ]
        
        Alamofire.request(addCarUrl, method: .get, parameters: parameters).responseJSON(completionHandler: {response in
            guard response.data != nil else {return}
            do {
                print(response)
                onSuccess(true)
            } catch{
                print("error happened while adding a car")
            }
        })
    }
}
