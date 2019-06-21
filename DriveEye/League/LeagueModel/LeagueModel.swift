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
    private let subscribed = "userLeague/subscribed/"
    private let userLeague = "userLeague/getUsers/"
    private let addLeague = "league/add"
    private let joinLeague = "userLeague/join/"
    
    func getLeagues(userId: Int, responseHandle: @escaping ([League]) -> Void, errorHandle: @escaping (Bool, String) -> Void){
        Alamofire.request(baseUrl + subscribed + String(userId)).responseJSON { (responseObject) -> Void in
            
            switch responseObject.result {
            case .success(_) :
                do{
                    let leagueResponse = try JSONDecoder().decode(LeagueResponse.self, from: responseObject.data!)
                    responseHandle(leagueResponse.leagues)
                }catch{
                    let leagueResponse = try! JSONDecoder().decode(LeaguePostErrorResponse.self, from: responseObject.data!)
                    errorHandle(true, leagueResponse.error)
                }
            case .failure(_) :
                errorHandle(false, "network error")
            }
            
        }
    }
    
    func getLeagueUsers(leagueID: Int, responseHandle:  @escaping ([UserLeague]) -> Void, errorHandle: @escaping (Bool, String) -> Void){
        
        Alamofire.request(baseUrl + userLeague + String(leagueID)).responseJSON { (responseObject) -> Void in
            switch responseObject.result {
            case .success(_) :
                do{
                    let leagueDetailsResponse = try JSONDecoder().decode(LeagueDetailsResponse.self, from: responseObject.data!)
                    responseHandle(leagueDetailsResponse.userLeagues)
                }catch{
                    let leagueResponse = try! JSONDecoder().decode(LeaguePostErrorResponse.self, from: responseObject.data!)
                    errorHandle(true, leagueResponse.error)
                }
            case .failure(_) :
                errorHandle(false, "network error")
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

