//
//  User.swift
//  DriveEye
//
//  Created by Sallam on 6/14/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let user = try? newJSONDecoder().decode(User.self, from: jsonData)

import Foundation

// MARK: - User
struct UserResponse: Codable {
    let status: Bool
    let response: User
}

// MARK: - Response
struct User: Codable {
    var userID: Int
    var firstName, lastName, email, birthdate: String
    var level: Int
    var image: JSONNull?
    var cityID: CityID
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case firstName, lastName, email, birthdate, level, image
        case cityID = "cityId"
    }
}

// MARK: - CityID
struct CityID: Codable {
    let cityID: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case cityID = "cityId"
        case name
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
