//
//  SeasonNetworkData.swift
//  DriveEye
//
//  Created by ashraf on 5/29/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation
import Alamofire

class SeasonNetworkData{
    
    private let baseUrl = "https://driveeye.herokuapp.com/userSeason/"
    private let seasons = "userSeasons/"
    private let seasonUsers = "seasonUsers/"
    
    
    func isConnectedToNetwork() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    func getSeasonList(responseHandel: @escaping ([Season]) -> Void,errorHandel: @escaping (ErrorResponse) -> Void){
        Alamofire.request(baseUrl + seasons + String(Utils.getCurrentUserId())).responseJSON { (responseObject) -> Void in
            if responseObject.result.isSuccess {
                do{
                    print(responseObject)
                    let seasonResponse = try JSONDecoder().decode(SeasonResponse.self, from: responseObject.data!)
                    responseHandel(seasonResponse.seasons)
                }catch{
                    do{
                        let response = try JSONDecoder().decode(ErrorResponse.self, from: responseObject.data!)
                        errorHandel(response)
                    }catch{
                        print("Server Error")
                    }
                }
            }
        }
    }
    
    func getSeasonUsers(seasonId: Int, responseHandel: @escaping ([SeasonUser]) -> Void ,errorHandel: @escaping (ErrorResponse) -> Void){
        Alamofire.request(baseUrl + seasonUsers + String(seasonId)).responseJSON { (responseObject) -> Void in
            if responseObject.result.isSuccess {
                do{
                    let seasonUsersResponse = try JSONDecoder().decode(SeasonUsersResponse.self, from: responseObject.data!)
                    responseHandel(seasonUsersResponse.seasonUsers)
                    
                }catch{
                    do{
                    let response = try JSONDecoder().decode(ErrorResponse.self, from: responseObject.data!)
                    errorHandel(response)
                }catch{
                    print("Server Error")
                }
                }
            }
        }
    }
    
    
}
