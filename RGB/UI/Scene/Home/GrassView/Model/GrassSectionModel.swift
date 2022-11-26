import Foundation

// MARK: - GrassSectionModel
struct GrassSectionModel: Codable {
    let userName: String
    let contributions: [Contribution]
}

// MARK: - Contribution
struct Contribution: Codable {
    let date: String
    let count, level: Int
}
