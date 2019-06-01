//
//  LeagueDetailsResponse.swift
//  DriveEye
//
//  Created by ashraf on 6/1/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation

struct LeagueDetailsResponse: Codable {
    let status: Bool
    let userLeagues: [UserLeague]
    
    enum CodingKeys: String, CodingKey {
        case userLeagues = "response"
        case status
    }
}
