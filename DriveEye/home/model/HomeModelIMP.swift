//
//  HomeModelIMP.swift
//  DriveEye
//
//  Created by ashraf on 5/30/19.
//  Copyright © 2019 java. All rights reserved.

import UIKit
import Alamofire
class HomeModelIMP{
    
    
    
    let locationService : LocationService!
    init() {
        locationService = LocationService()
    }
    func getStartLocation(compleion : @escaping (_ city :String? )->()) {
        locationService.getCityAnd(country: {city , country , error  in
            compleion(city)
            
        })
    }
    func getEndLocation(compleion : @escaping (_ city :String? )->()) {
        locationService.getCityAnd(country: {city , country , error  in
            compleion(city)
            
        })
    }
    func addNewTrip ( _ trip : Trip ,_ tripHandler : (Int)->()){
        let randumScore = getRandomScore()
        let url = URL(string: "https://driveeye.herokuapp.com/trip/add")
        let parameter : [String : Any] = ["startPoint":trip.startPoint,"endPoint" : trip.endPoint,
                                          "duration"  : trip.duration,"userId" : Utils.getCurrentUserId() ,"score" : randumScore]
        tripHandler(randumScore)
        Alamofire.request(url!, method:.post, parameters: parameter)
            .responseJSON { response in
                print(response)
                
        }
    }
    func getRandomScore()-> Int {
        return Int(arc4random_uniform(101))
    }
    
    
    
    func getHomeInfo(userId: Int, responseHandel: @escaping (Home) -> Void ,errorHandel: @escaping (ErrorResponse) -> Void){
        let url = URL(string: "https://driveeye.herokuapp.com/userSeason/seasonUsersScore/\(userId)")
        Alamofire.request(url!  ).responseJSON { (responseObject) -> Void in
            if responseObject.result.isSuccess {
                do{
                    print(responseObject)
                    let homeResponse = try JSONDecoder().decode(HomeResponce.self, from: responseObject.data!)
                    if homeResponse.status{
                    responseHandel(homeResponse.home)
                    }
                }catch let error {
                    print(error)
                }
            }
            else{
                print("request not completed")
            }
        }
    }
    
    
    
    
    
    
}
