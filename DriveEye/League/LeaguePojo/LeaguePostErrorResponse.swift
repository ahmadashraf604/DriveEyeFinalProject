//
//  LeaguePostErrorResponse.swift
//  DriveEye
//
//  Created by ashraf on 6/1/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation

struct LeaguePostErrorResponse: Codable {
    let status: Bool
    let error: String
    
    enum CodingKeys: String, CodingKey {
        case status
        case error = "response"
    }
}
