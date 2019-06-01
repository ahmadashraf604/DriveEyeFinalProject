//
//  ErrorResponse.swift
//  DriveEye
//
//  Created by ashraf on 5/31/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation

struct ErrorResponse: Codable {
    let status: Bool
    let error: String
    
    enum CodingKeys: String, CodingKey {
        case status
        case error = "response"
    }
}
