//
//  SeasonDetailsModel.swift
//  DriveEye
//
//  Created by Abdo Amin on 5/26/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation
class SeasonDetailsModel{
    private var networkLayer = SeasonNetworkData()
    
    func getSeasonUsers(seasonId: Int ,responseHandel:  @escaping ([SeasonUser]) -> Void,errorHandel: @escaping (ErrorResponse) -> Void){
        if networkLayer.isConnectedToNetwork(){
            networkLayer.getSeasonUsers(seasonId: seasonId, responseHandel: responseHandel, errorHandel: errorHandel)
        }
        
    }
}
