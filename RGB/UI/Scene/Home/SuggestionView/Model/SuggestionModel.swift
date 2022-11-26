import Foundation

struct SuggesionModel: Decodable {
    let name, imageURL: String?
    let pk, price, changePercent: Int?
    
    
//    enum CodingKeys: String, CodingKey {
//        case id, name, description
//        case taglineString = "tagline"
//        case imageURL = "image_url"
//        case brewersTips = "brewers_tips"
//        case foodParing = "food_pairing"
//    }
}
