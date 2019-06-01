//
//  HomeModelIMP.swift
//  DriveEye
//
//  Created by ashraf on 5/30/19.
//  Copyright © 2019 java. All rights reserved.

import UIKit
import Alamofire

class HomeModelIMP: NSObject{
    let locationService : LocationService!
    override init() {
        locationService=LocationService()
    }
    func getCurrentLocation(compleion : @escaping (_ city :String? ,_ country : String?)->()) {
        locationService.getCityAnd(country: {city , country , error  in
            compleion(city, country)
            print(city)
            print(country)

        })
    }
    
    func addNewTrip ( _ trip : Trip){
        let url = URL(string: "https://driveeye.herokuapp.com/trip/add")
        let parameter : [String : Any] = ["startPoint":trip.startPoint,"endtPoint" : trip.endPoint,"duration"  : trip.duration,"userId" : 1 ,"score" : getRandomScore() ]
//         let parameter : [String : Any] = ["startPoint":"ismaikia","endtPoint" : "cairo","duration"  : 10.50,"userId" : 1 ,"score" : 82 ]
        Alamofire.request(url!, method:.post, parameters: parameter)
            .responseJSON { response in
                print(response)
        
    }
}
    func getRandomScore()-> Int {
        let randomInt = arc4random()
        
        return Int(randomInt) / 6
    }
    
}
