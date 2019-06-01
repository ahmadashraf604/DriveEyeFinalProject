

import Foundation

// MARK: - SeasonUsersResponse
struct SeasonUsersResponse: Codable {
    let status: Bool
    let seasonUsers: [SeasonUser]
    enum CodingKeys: String, CodingKey {
        case status
        case seasonUsers = "response"
    }
}

