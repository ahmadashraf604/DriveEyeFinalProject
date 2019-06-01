//
//  SeasonResponse.swift
//  DriveEye
//
//  Created by ashraf on 5/29/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation
struct SeasonResponse: Codable {
    let status: Bool
    let seasons: [Season]
    
    enum CodingKeys: String, CodingKey {
        case status
        case seasons = "response"
    }
}
