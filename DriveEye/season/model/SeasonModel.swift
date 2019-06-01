//
//  SeasonModel.swift
//  DriveEye
//
//  Created by Abdo Amin on 5/26/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation
import Alamofire


class SeasonModel{
    private var networkLayer = SeasonNetworkData()

    
    func getSeasonList(responseHandel:  @escaping ([Season]) -> Void,errorHandel: @escaping (ErrorResponse) -> Void){
        if networkLayer.isConnectedToNetwork(){
            networkLayer.getSeasonList(responseHandel: responseHandel,errorHandel: errorHandel)
        }
        
    }
}
