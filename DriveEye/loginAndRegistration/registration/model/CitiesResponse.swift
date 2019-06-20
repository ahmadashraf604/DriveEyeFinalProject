// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let city = try? newJSONDecoder().decode(City.self, from: jsonData)

import Foundation

// MARK: - City
struct CitiesResponse: Codable {
    let status: Bool
    let response: [City]
}

// MARK: - Response
struct City: Codable {
    let cityId: Int
    let name: String
}

