//
//  SuggextionModel.swift
//  RGB
//
//  Created by 박준하 on 2022/10/31.
//

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
