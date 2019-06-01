//
//  SeasonUser.swift
//  DriveEye
//
//  Created by ashraf on 5/29/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation

// MARK: - SeasonUser
struct SeasonUser: Codable {
    let userID: Int
    let username: String
    let score, rank: Int
    enum CodingKeys: String, CodingKey {
        case userID
        case score, rank
        case username = "username"
    }
}

