// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userResponse = try? newJSONDecoder().decode(UserResponse.self, from: jsonData)

import Foundation

// MARK: - UserResponse
struct UserResponse: Codable {
    let status: Bool
    let response: UserInfo
}

// MARK: - Response
struct UserInfo: Codable {
    let userID: Int
    let firstName, lastName, email, birthdate: String
    let level: Int
    let password: String?
    let image: String
    let car: CarInfo
    let city: CityInfo
    let userSeasonBadgeCollection: [UserSeasonBadgeCollection]?
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case firstName, lastName, email, birthdate, level, password, image, car, city, userSeasonBadgeCollection
    }
}

// MARK: - Car
struct CarInfo: Codable {
    let carID: Int
    let brand, model: String?
    let image, releaseyear: String?
    
    enum CodingKeys: String, CodingKey {
        case carID = "carId"
        case brand, model, image, releaseyear
    }
}

// MARK: - City
struct CityInfo: Codable {
    let cityID: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case cityID = "cityId"
        case name
    }
}

// MARK: - UserSeasonBadgeCollection
struct UserSeasonBadgeCollection: Codable {
    let badge: Badge
    let season: String?
}

// MARK: - Badge
struct Badge: Codable {
    let badgeID: Int
    let image, name, type: String
    
    enum CodingKeys: String, CodingKey {
        case badgeID = "badgeId"
        case image, name, type
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
