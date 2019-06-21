import Foundation

// MARK: - Home
struct HomeResponce: Codable {
    let status: Bool
    let home: Home
   private enum CodingKeys: String, CodingKey {
        case status
        case home = "response"
    }
}

// MARK: - Response
struct Home: Codable {
    let score, daysLeft, userLevel, seasonNUmber: Int
    
}
