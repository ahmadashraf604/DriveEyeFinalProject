//
//  LeagueModel.swift
//  DriveEye
//
//  Created by ashraf on 6/1/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation
import Alamofire

class LeagueModel {
    
    private let baseUrl = "https://driveeye.herokuapp.com/"
    private let subscribed = "userLeague/subscribed/2"
    private let userLeague = "userLeague/getUsers/"
    private let addLeague = "league/add"
    private let joinLeague = "userLeague/join/"
    
    func getLeagues(responseHandel: @escaping ([League]) -> Void){
        Alamofire.request(baseUrl + subscribed).responseJSON { (responseObject) -> Void in
            if responseObject.result.isSuccess {
                do{
                    let leagueResponse = try JSONDecoder().decode(LeagueResponse.self, from: responseObject.data!)
                    if leagueResponse.status {
                        responseHandel(leagueResponse.leagues)
                    }
                }catch{
                    print("no data found")
                }
            }
        }
    }
    
    func getLeagueUsers(leagueID: Int, responseHandel:  @escaping ([UserLeague]) -> Void ){
        Alamofire.request(baseUrl + userLeague + String(leagueID)).responseJSON { (responseObject) -> Void in
            if responseObject.result.isSuccess {
                let leagueDetailsResponse = try! JSONDecoder().decode(LeagueDetailsResponse.self, from: responseObject.data!)
                if leagueDetailsResponse.status {
                    responseHandel(leagueDetailsResponse.userLeagues)
                }
            }
        }
    }
    
    func addLeague(leagueName: String, userID: Int, responseHandel: @escaping (LeaguePostResponse) -> Void, errorHandel: @escaping (LeaguePostErrorResponse) -> Void){
        let parameters: [String : Any] = ["name" : leagueName, "ownerId" : userID]
        Alamofire.request(baseUrl + addLeague, method: .post, parameters: parameters)
            .responseJSON { responseObject in
                if responseObject.result.isSuccess {
                    do{
                        let response = try JSONDecoder().decode(LeaguePostResponse.self, from: responseObject.data!)
                        responseHandel(response)
                    }catch{
                        let response = try! JSONDecoder().decode(LeaguePostErrorResponse.self, from: responseObject.data!)
                        errorHandel(response)
                    }
                }
        }
    }
    
    func joinLeague(leagueCode: String, userID: Int, responseHandel: @escaping (LeaguePostResponse) -> Void, errorHandel: @escaping (LeaguePostErrorResponse) -> Void){
        let parameters: [String : Any] = ["leagueCode" : leagueCode]
        Alamofire.request(baseUrl + joinLeague + String(userID), method: .post, parameters: parameters)
            .responseJSON { responseObject in
                if responseObject.result.isSuccess {
                    do{
                        let response = try JSONDecoder().decode(LeaguePostResponse.self, from: responseObject.data!)
                        responseHandel(response)
                    }catch{
                        let response = try! JSONDecoder().decode(LeaguePostErrorResponse.self, from: responseObject.data!)
                        errorHandel(response)
                    }
                }
        }
    }
}

