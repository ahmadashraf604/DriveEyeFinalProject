//
//  League.swift
//  DriveEye
//
//  Created by ashraf on 6/1/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation

struct League: Codable {
    let leagueID: Int
    let name, code: String
    let ownerID, score, rank: Int
    
    enum CodingKeys: String, CodingKey {
        case leagueID = "leagueId"
        case name, code
        case ownerID = "ownerId"
        case score, rank
    }
}
