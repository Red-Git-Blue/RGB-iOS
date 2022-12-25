//
//  GetBadgeDetailModel.swift
//  RGB
//
//  Created by 박준하 on 2022/12/25.
//

import Foundation

// MARK: - GetBadgeDetailModel
struct GetBadgeDetailModel: Codable {
    let id: Int
    let name, introduction: String
    let price: Int
    let rarity: Rarity
    let tagList: [TagList]
    let category: Category
    let iconImage, mainImage: IconImage
    let subImages: [IconImage]
    
    // MARK: - Category
    struct Category: Codable {
        let categoryName: String
        let color: Color
        let categoryIcon: IconImage
    }

    // MARK: - IconImage
    struct IconImage: Codable {
        let fileID: Int
        let fileURL, fileType, iconImageExtension, fileName: String

        enum CodingKeys: String, CodingKey {
            case fileID = "fileId"
            case fileURL = "fileUrl"
            case fileType
            case iconImageExtension = "extension"
            case fileName
        }
    }

    // MARK: - Color
    struct Color: Codable {
        let startColor, endColor: String
    }

    // MARK: - Rarity
    struct Rarity: Codable {
        let tag, noun, name: String
    }

    // MARK: - TagList
    struct TagList: Codable {
        let tagName, tagColor: String
    }

}
