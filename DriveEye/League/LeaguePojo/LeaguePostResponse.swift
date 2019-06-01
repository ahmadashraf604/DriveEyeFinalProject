//
//  LeaguePostResponse.swift
//  DriveEye
//
//  Created by ashraf on 6/1/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation

struct LeaguePostResponse: Codable {
    let status: Bool
    let league: League
    
    enum CodingKeys: String, CodingKey {
        case status
        case league = "response"
    }
}
