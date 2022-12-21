import Foundation

struct SuggesionModel: Decodable {
    let name, imageURL: String?
    let pk, price, changePercent: Int?
}
