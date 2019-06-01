// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let seasonResponse = try? newJSONDecoder().decode(SeasonResponse.self, from: jsonData)

import Foundation

// MARK: - Season
struct Season: Codable {
    let seasonID: Int
    let startDate, endDate: String
    let highScore, myScore, myRank: Int
    
    enum CodingKeys: String, CodingKey {
        case seasonID = "seasonId"
        case startDate, endDate, highScore, myScore, myRank
    }
}

