import Foundation

struct GrassSectionModel: Codable {
    let userName: String
    let contributions: [Contribution]
}

struct Contribution: Codable {
    let date: String
    let count, level: Int
}
